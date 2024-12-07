import 'package:education_center/src/core/storage/app_storage.dart';
import 'package:flutter/material.dart';

class AuthVM extends ChangeNotifier {
  // controllers
  TextEditingController loginC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final String loginValidatorT = "Login to'gri kiriting";
  final String passwordValidatorT = "Parolni to'gri kiriting";

  bool loginSuccess() {
    if (loginC.text.trim() == "kimyobiologiya" &&
        passwordC.text.trim() == "zobidov1234") {
      AppStorage.$write(key: StorageKey.token, value: loginC.text.trim());
      return true;
    } else {
      return false;
    }
  }
}
