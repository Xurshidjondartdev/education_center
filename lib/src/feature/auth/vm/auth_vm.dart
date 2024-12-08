import 'package:education_center/src/data/repository/app_repository_impl.dart';
import 'package:flutter/material.dart';

class AuthVM extends ChangeNotifier {
  AppRepositoryImpl appRepositoryImpl = AppRepositoryImpl();

  // controllers
  TextEditingController loginC = TextEditingController(text: "+998939468430");
  TextEditingController passwordC = TextEditingController(text: "admin1234");

  final formKey = GlobalKey<FormState>();

  String? errorMessage;

  Future<bool> login() async {
    try {
      final data = await appRepositoryImpl.login(
        login: loginC.text.trim(),
        password: passwordC.text.trim(),
      );
      if (data == null) {
        errorMessage = "Internet bilan muammo yuz berdi, qayta urinib ko'ring.";
        return false;
      } else {
        errorMessage = "Good";
        return true;
      }
    } catch (e) {
      return false;
    }
  }
}
