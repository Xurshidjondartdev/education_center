final class ApiConst {
  const ApiConst._();

  static const Duration connectionTimeout = Duration(minutes: 2);
  static const Duration sendTimeout = Duration(minutes: 2);
  static const Duration receiveTimeout = Duration(minutes: 2);

  static const String baseUrl = "192.168.248.251";

  static const String apiLogin = "/auth/login";
}

