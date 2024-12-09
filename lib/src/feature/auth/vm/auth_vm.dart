import 'dart:developer';

import 'package:education_center/src/core/storage/app_storage.dart';
import 'package:education_center/src/data/model/login_model.dart';
import 'package:education_center/src/data/repository/app_repository_impl.dart';
import 'package:flutter/material.dart';

class AuthVM extends ChangeNotifier {
  TextEditingController loginC = TextEditingController(text: "+998939468430");
  TextEditingController passwordC = TextEditingController(text: "admin1234");

  final formKey = GlobalKey<FormState>();

  Future<bool?> login({
    required BuildContext context,
    required String phone,
    required String password,
  }) async {
    final result = await AppRepositoryImpl().login(
      phone: phone,
      password: password,
    );
    if (result != null) {
      final loginModel = loginModelFromJson(result);
      await AppStorage.$write(key: StorageKey.jwtToken, value: loginModel.jwt!);
      await AppStorage.$write(key: StorageKey.role, value: loginModel.role!);
      log("vm hammsi yahwi ");
      if (loginModel.role == "ROLE_ADMIN") {
        log("Admin");
        return true;
      } else if (loginModel.role == "ROLE_USER") {
        log("User");
        return false;
      }
    } else {
      return null;
    }
    return null;
  }
}
