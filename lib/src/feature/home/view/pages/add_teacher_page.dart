import 'package:education_center/src/core/widgets/custom_app_bar_widget.dart';
import 'package:education_center/src/core/widgets/main_button.dart';
import 'package:education_center/src/feature/auth/view/widgets/login_input_widget.dart';
import 'package:education_center/src/feature/home/view_model/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_route_names.dart';
import '../../../../core/routes/router_config.dart';

class AddTeacherPage extends ConsumerWidget {
  const AddTeacherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(homeVM);
    return Scaffold(
      appBar: const CustomAppBarWidget(title: "Add new teacher", canPop: true),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: Column(
            children: [
              LoginInputWidget(
                hintText: "Teacher's name",
                textEditingController: vm.addTeacherNameC,
              ),
              SizedBox(height: 20.h),
              LoginInputWidget(
                hintText: "Teacher's last name",
                textEditingController: vm.addTeacherLastNameC,
              ),
              SizedBox(height: 20.h),
              LoginInputWidget(
                hintText: "What subject does he teach?",
                textEditingController: vm.addTeacherSubjectC,
              ),
              const Spacer(),
              MainButton(
                  text: "Add teacher",
                  onTap: () {
                    RouterConfigService.router.go(AppRouteNames.home);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
