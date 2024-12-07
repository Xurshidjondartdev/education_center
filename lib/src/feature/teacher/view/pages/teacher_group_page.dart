import 'package:education_center/src/core/widgets/custom_app_bar_widget.dart';
import 'package:education_center/src/feature/teacher/view_model/teacher_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_route_names.dart';
import '../../../../core/routes/router_config.dart';
import '../../../../core/widgets/group_widget.dart';

class TeacherGroupPage extends ConsumerWidget {
  const TeacherGroupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupsVm = ref.watch(teacherVm);
    return Scaffold(
      appBar: const CustomAppBarWidget(
          title: "Teacher View All Groups", canPop: true),
      body: Padding(
        padding: REdgeInsets.all(10.0),
        child: SizedBox(
          height: 300.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final group = groupsVm.groups[index];
              return GroupWidget(
                name: group["name"]!,
                position: group['position']!,
                onActionPressed: () {
                  RouterConfigService.router.go(
                      "${AppRouteNames.teacherGroupPage}${AppRouteNames.teacherstudentsPage}");
                },
                onCardPressed: () {},
                onEditPressed: () {},
                onDeleteConfirmed: () {},
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 16.w),
            itemCount: groupsVm.groups.length,
          ),
        ),
      ),
    );
  }
}
