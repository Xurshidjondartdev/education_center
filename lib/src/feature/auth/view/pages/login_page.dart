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
                  authvm.login();
                  // authvm.testApiLogin();
                  // final isSuccessLogin = await authvm.login();
                  // if (isSuccessLogin == true) {
                  //   log("login qildi");
                  // } else {
                  //   log("login qilinmadi");
                  // }

                  //   var headers = {'Content-Type': 'application/json'};
                  //   var request = http.Request(
                  //       'POST',
                  //       Uri.parse(
                  //           'http://192.168.222.251:8080/api/v1/auth/login'));
                  //   request.body = json.encode(
                  //       {"phone": "+998939468430", "password": "admin1234"});
                  //   request.headers.addAll(headers);
                  //   log("message 1");
                  //   http.StreamedResponse response = await request.send();
                  //   log("message 2");
                  //   if (response.statusCode == 200 ||
                  //       response.statusCode == 201) {
                  //     log(await response.stream.bytesToString());
                  //   } else {
                  //     log("else 200 201 emas");
                  //   }

                  // var headers = {'Content-Type': 'application/json'};
                  // var data = json.encode(
                  //     {"phone": "+998939468432", "password": "string0"});
                  // var dio = Dio();
                  // var response = await dio.request(
                  //   'http://192.168.222.251:8080/api/v1/auth/login',
                  //   options: Options(
                  //     method: 'POST',
                  //     headers: headers,
                  //   ),
                  //   data: data,
                  // );
                  // if (response.statusCode == 200) {
                  //   print(json.encode(response.data));
                  // } else {
                  //   print(response.statusMessage);
                  // }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
