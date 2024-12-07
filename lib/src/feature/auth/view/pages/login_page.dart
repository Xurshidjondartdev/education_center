import 'dart:developer';

import 'package:education_center/src/core/widgets/main_button.dart';
import 'package:education_center/src/feature/auth/view/widgets/login_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart'; // Lottie paketini import qiling

import '../../../../core/routes/app_route_names.dart';
import '../../../../core/routes/router_config.dart';
import '../../view_model/auth_vm.dart';

final authVm = ChangeNotifierProvider.autoDispose<AuthVM>((ref) {
  return AuthVM();
});

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authvm = ref.watch(authVm);
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40.h),
              Lottie.asset(
                "assets/lottie/login.json",
                height: 200.h,
              ),
              SizedBox(height: 20.h),
              LoginInputWidget(
                hintText: "Enter login",
                textEditingController: authvm.loginC,
                validatorText: authvm.loginValidatorT,
              ),
              SizedBox(height: 20.h),
              LoginInputWidget(
                hintText: "Password",
                textEditingController: authvm.passwordC,
                validatorText: authvm.passwordValidatorT,
                isPassword: true,
              ),
              const Spacer(),
              MainButton(
                text: "Continue",
                onTap: () {
                  if (authvm.loginSuccess()) {
                    RouterConfigService.router.go(AppRouteNames.home);
                  } else {
                    log("message");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
