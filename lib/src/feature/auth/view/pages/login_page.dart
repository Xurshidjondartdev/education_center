import 'package:education_center/src/core/widgets/main_button.dart';
import 'package:education_center/src/feature/auth/view/widgets/login_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart'; // Lottie paketini import qiling
import '../../vm/auth_vm.dart';

final authVm = ChangeNotifierProvider.autoDispose<AuthVM>((ref) {
  return AuthVM();
});

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authvm = ref.watch(authVm);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40.h),
              Lottie.asset("assets/lottie/login.json", height: 200.h),
              SizedBox(height: 20.h),
              LoginInputWidget(
                keyboardType: TextInputType.phone,
                hintText: "Enter phone number",
                textEditingController: authvm.loginC,
              ),
              SizedBox(height: 20.h),
              LoginInputWidget(
                hintText: "Password",
                textEditingController: authvm.passwordC,
                isPassword: true,
              ),
              const Spacer(),
              MainButton(
                text: "Continue",
                onTap: () async {
                  authvm.login(
                    authvm.passwordC.text.trim(),
                    authvm.passwordC.text.trim(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
