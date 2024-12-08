import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:education_center/src/core/storage/app_storage.dart';
import 'package:education_center/src/data/model/login_model.dart';
import 'package:education_center/src/data/repository/app_repository_impl.dart';
import 'package:flutter/material.dart';

class AuthVM extends ChangeNotifier {
  TextEditingController loginC = TextEditingController(text: "+998939468430");
  TextEditingController passwordC = TextEditingController(text: "admin1234");

  final formKey = GlobalKey<FormState>();
  AppRepositoryImpl appRepositoryImpl = AppRepositoryImpl();
  late final LoginModel loginModel;
  String? errorMessage;

Future<bool> login() async {
  try {
    final response = await http.post(
      Uri.parse('http://192.168.222.251:8080/api/login'), // API URL'ni kiriting
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer YOUR_API_TOKEN_HERE', // Agar token talab qilinsa
      },
      body: jsonEncode({
        "phone": loginC.text.trim(),
        "password": passwordC.text.trim(),
      }),
    );

    log("HTTP status code: ${response.statusCode}");
    log("HTTP response body: ${response.body}");

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      log("JSON ma'lumot: $jsonData");

      // Modelga o'zlashtirish
      loginModel = LoginModel.fromJson(jsonData);
      log("Model ma'lumot: ${loginModel.name}, ${loginModel.jwt}");
      return true;
    } else {
      log("API xatolik qaytardi: ${response.statusCode}");
      errorMessage = "Server javobi: ${response.body}";
      return false;
    }
  } catch (e) {
    log("Exception: $e");
    errorMessage = "Xatolik yuz berdi: $e";
    return false;
  }
}




Future<void> testApiLogin() async {
  final url = Uri.parse('http://192.168.222.251:8080/auth/login'); // API endpointni kiritish kerak
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      "phone": "+998939468430",
      "password": "admin1234",
    }),
  );

  log("HTTP status code: ${response.statusCode}");
  log("HTTP response body: ${response.body}");

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonData = jsonDecode(response.body);
    log("API muvaffaqiyatli javob berdi: $jsonData");
  } else {
    log("API xatolik qaytardi: ${response.body}");
  }
}


  void saveRoleStorage() {
    AppStorage.$write(key: StorageKey.role, value: loginModel.role!);
    AppStorage.$write(key: StorageKey.jwtToken, value: loginModel.jwt!);
  }
}
