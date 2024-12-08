import "dart:developer";

import "package:dio/dio.dart";
import "package:education_center/src/core/server/api/api_constants.dart";
import "package:education_center/src/core/server/api/network_service.dart";
import "package:education_center/src/data/model/login_model.dart";

import "app_repository.dart";

class AppRepositoryImpl implements AppRepo {
  @override
  Future<LoginModel?> login(
      {required String phone, required String password}) async {
    try {
      final data = await NetworkService.post(
        ApiConst.apiLogin,
        {
          "phone": phone,
          "password": password,
        },
      );
      if (data != null) {
        final LoginModel loginModel = loginModelFromJson(data);
        return loginModel;
      } else {
        return null;
      }
    } on DioException catch (e) {
      log(" $e");
    } catch (e) {
      log(" $e");
    }
    return null;
  }
}
