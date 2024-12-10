import "dart:developer";

import "package:education_center/src/core/server/api/http_service.dart";
import "app_repository.dart";

class AppRepositoryImpl implements AppRepo {
  @override
  Future<String?> login(
      {required String phone, required String password}) async {
    final result = await Api.post(
      api: Api.apiLogin,
      body: {"phone": phone, "password": password},
    );
    if (result != null) {
      return result;
    } else {
      return null;
    }
  }

  @override
  Future<String?> creatTeacher({
    required String name,
    required String surname,
    required String phone,
    required String password,
  }) async {
    final result = await Api.post(api: Api.apiCreateTeacher,body: {
      "name": name,
      "surname": surname,
      "phone": phone,
      "password": password,
      "role": "ROLE_USER",
    });
    log("create teacher impl");
    if (result != null) {
      return result;
    } else {
      return null;
    }
  }
}
