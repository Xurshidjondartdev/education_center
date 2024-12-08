import 'package:education_center/src/core/widgets/custom_app_bar_widget.dart';
import 'package:education_center/src/core/widgets/main_button.dart';
import 'package:education_center/src/feature/admin/view_model/admin_vm.dart';
import 'package:education_center/src/feature/auth/view/widgets/login_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_route_names.dart';
import '../../../../core/routes/router_config.dart';



class AddGroupsPage extends ConsumerWidget {
  const AddGroupsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupVm = ref.watch(adminVM);
    return Scaffold(
      appBar: const CustomAppBarWidget(title: "Add new group", canPop: true),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: Column(
            children: [
              LoginInputWidget(
                hintText: "Group's name",
                textEditingController: groupVm.addTeacherNameC,
              ),
              SizedBox(height: 20.h),
              LoginInputWidget(
                hintText: "time",
                textEditingController: groupVm.timeGroupC,
              ),
              SizedBox(height: 20.h),
              LoginInputWidget(
                hintText: "What subject is taught?",
                textEditingController: groupVm.addTeacherSubjectC,
              ),
              const Spacer(),
              MainButton(
                  text: "Add group",
                  onTap: () {
                    RouterConfigService.router.go(AppRouteNames.adminGroupPage);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
