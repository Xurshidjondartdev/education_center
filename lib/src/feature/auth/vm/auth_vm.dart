import 'dart:developer';

import 'package:education_center/src/data/model/login_model.dart';
import 'package:education_center/src/data/repository/app_repository_impl.dart';
import 'package:flutter/material.dart';

class AuthVM extends ChangeNotifier {
  TextEditingController loginC = TextEditingController(text: "+998939468430");
  TextEditingController passwordC = TextEditingController(text: "admin1234");

  final formKey = GlobalKey<FormState>();

  late final LoginModel? loginModel;

  Future<void> login(String phone, String password) async {
    AppRepositoryImpl appRepositoryImpl = AppRepositoryImpl();

    final LoginModel? model = await appRepositoryImpl.login(
      phone: phone,
      password: password,
    );
    if (model != null) {
      loginModel = model;
      log("message");
    } else {
      log("model esle");
    }
  }
}
