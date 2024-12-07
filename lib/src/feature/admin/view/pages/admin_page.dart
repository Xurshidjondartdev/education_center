import 'dart:developer';

import 'package:education_center/src/core/routes/app_route_names.dart';
import 'package:education_center/src/core/routes/router_config.dart';
import 'package:education_center/src/core/widgets/custom_app_bar_widget.dart';
import 'package:education_center/src/feature/admin/view_model/admin_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/admin_main_widget.dart';

class AdminPage extends ConsumerWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adminVm = ref.watch(adminVM);
    return Scaffold(
      appBar: const CustomAppBarWidget(
          title: "Education Center", canPop: false),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: ListView.separated(
          itemCount: adminVm.users.length,
          separatorBuilder: (context, index) => SizedBox(height: 16.h),
          itemBuilder: (context, index) {
            final user = adminVm.users[index];
            return ProfileCard(
              name: user['name']!,
              position: user['position']!,
              onActionPressed: () {
                log("$user darni boshladi");
                RouterConfigService.router
                    .go("${AppRouteNames.home}/${AppRouteNames.viewGroups}");
              },
              onCardPressed: () {
                log("card present");
              },
              onEditPressed: () {
                log("edit");
                RouterConfigService.router.go(AppRouteNames.addTeacher);
                Navigator.pop(context);
              },
              onDeleteConfirmed: () {
                log("delete");
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          RouterConfigService.router
              .go("${AppRouteNames.home}/${AppRouteNames.addTeacher}");
        },
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
