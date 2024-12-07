import "package:education_center/src/feature/admin/view/pages/admin_student_page.dart";
import "package:education_center/src/feature/auth/view/pages/login_page.dart";
import "package:education_center/src/feature/admin/view/pages/add_groups_page.dart";
import "package:education_center/src/feature/admin/view/pages/add_teacher_page.dart";
import "package:education_center/src/feature/admin/view/pages/admin_page.dart";
import "package:education_center/src/feature/splash/splash.dart";
import "package:education_center/src/feature/teacher/view/pages/teacher_group_page.dart";
import "package:education_center/src/feature/teacher/view/pages/teacher_students_page.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "../../feature/admin/view/pages/admin_group_page.dart";
import "../widgets/add_students_page.dart";
import "app_route_names.dart";

GlobalKey<NavigatorState> parentNavigatorKey = GlobalKey<NavigatorState>();

Page<dynamic> customEachTransitionAnimation(
    BuildContext context, GoRouterState state, Widget child) {
  return CustomTransitionPage<Object>(
    transitionsBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) {
      var begin = const Offset(1.0, 0.0);
      var end = Offset.zero;
      var tween = Tween(begin: begin, end: end);
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
    child: child,
  );
}

@immutable
final class RouterConfigService {
  const RouterConfigService._();

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: parentNavigatorKey,
    initialLocation: AppRouteNames.splash,
    routes: <RouteBase>[
      // SPLASH
      GoRoute(
        path: AppRouteNames.splash,
        builder: (context, state) => const SplashPage(),
      ),
      // AUTH
      GoRoute(
        path: AppRouteNames.login,
        builder: (context, state) => const LoginPage(),
      ),
      // Admin
      GoRoute(
        path: AppRouteNames.admin,
        builder: (context, state) => const AdminPage(),
        routes: [
          GoRoute(
            path: AppRouteNames.addTeacher,
            builder: (context, state) => const AddTeacherPage(),
          ),
          GoRoute(
            path: AppRouteNames.adminGroupPage,
            builder: (context, state) => const AdminGroupPage(),
            routes: [
              GoRoute(
                path: AppRouteNames.addGroups,
                builder: (context, state) => const AddGroupsPage(),
              ),
              GoRoute(
                path: AppRouteNames.adminStudentsPage,
                builder: (context, state) => const AdminStudentPage(),
                routes: [
                  GoRoute(
                    path: AppRouteNames.addStudentsPage,
                    builder: (context, state) => const AddStudentsPage(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      // Teacher Section
      GoRoute(
        path: AppRouteNames.teacherGroupPage,
        builder: (context, state) => const TeacherGroupPage(),
        routes: [
          GoRoute(
            path: AppRouteNames.teacherstudentsPage,
            builder: (context, state) => const TeacherStudentsPage(),
            routes: [
              GoRoute(
                path: AppRouteNames.addStudentsPage,
                builder: (context, state) => const AddStudentsPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
