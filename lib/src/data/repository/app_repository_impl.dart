import "package:dio/dio.dart";
import "package:education_center/src/core/server/api/api.dart";
import "package:education_center/src/core/server/api/api_constants.dart";
import "package:flutter/material.dart";

import "app_repository.dart";

class AppRepositoryImpl implements AppRepo {
  @override
  Future<String?> login(
      {required String login, required String password}) async {
    try {
      final data = await ApiService.post(
        ApiConst.apiLogin,
        {
          "phone": login,
          "password": password,
        },
      );
      return data;
    } on DioException catch (e) {
      debugPrint("Server error: ${e.response?.data ?? e.message}");
      return "Server error: ${e.response?.statusCode ?? 'Unknown status code'}";
    } catch (e) {
      debugPrint("Unexpected error: $e");
      return "Unexpected error: $e";
    }
  }
}
