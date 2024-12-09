import "dart:developer";

import "package:education_center/src/core/server/api/http_service.dart";

import "app_repository.dart";

class AppRepositoryImpl implements AppRepo {
  @override
  Future<String?> login({
    required String phone,
    required String password,
  }) async {
    final result = await Api.post(
      api: Api.apiLogin,
      body: {
        "phone": phone,
        "password": password,
      },
    );
    log("impl loginga keldi");
    if (result != null) {
      log("login null emas");
      log("result == $result");
      return result;
    } else {
      log("login null");
      return null;
    }
  }
}
