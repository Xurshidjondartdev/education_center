final class ApiConst {
  const ApiConst._();

  static const Duration connectionTimeout = Duration(minutes: 10);
  static const Duration sendTimeout = Duration(minutes: 10);
  static const Duration receiveTimeout = Duration(minutes: 10);

  static const String baseUrl = "http://localhost:8080";
  static const String version = "/api/v1";

  // auth
  static const String apiLogin = "$version/auth/login";
  static const String createAccount = "$version/auth/register";
  static const String verifyEmail = "$version/auth/verify/email";
}

final class ApiParams {
  const ApiParams._();

  static Map<String, dynamic> cabinetSmsCheckParams(
          {required String phone, required String code}) =>
      <String, dynamic>{
        "phone": phone,
        "code": code,
      };

  static Map<String, dynamic> emptyParams() => <String, dynamic>{};
}
