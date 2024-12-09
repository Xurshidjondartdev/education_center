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
    if (result != null) {
      return result;
    } else {
      return null;
    }
  }
}
