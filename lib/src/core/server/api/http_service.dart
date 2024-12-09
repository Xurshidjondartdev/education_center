import "dart:convert";
import "dart:developer";
import "package:education_center/src/core/server/api/http_interceptor.dart";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:http_interceptor/http_interceptor.dart";

class Api {
  // BASEURL faqat host va portni o‘z ichiga oladi
  static const String baseURl = "http://192.168.248.251:8080/api/v1";

  // API yo‘llarini to‘g‘ri formatlash
  static const String apiLogin = "/auth/login";

  // headers
  static Map<String, String> headers = {
    "Content-Type": "application/json",
  };

  // Intercepted client
  static final http.Client client = InterceptedClient.build(
    interceptors: [ApiInterceptor()],
  );

  // Generalized response handler
  static Future<String?> handleResponse(http.Response response) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    log("Error: ${response.statusCode} - ${response.reasonPhrase}");
    return null;
  }

  // GET method
  static Future<String?> get(
      {required String api, Map<String, String>? params}) async {
    final Uri url = Uri.http(baseURl, api, params);
    log("URL: $url");
    final http.Response response = await client.get(url, headers: headers);
    return handleResponse(response);
  }

  // POST method
  static Future<String?> post({
    required String api,
    required Map<String, dynamic>? body,
    Map<String, String>? param,
  }) async {
    final Uri url = Uri.parse("$baseURl$api");
    log("URL: $url");
    final http.Response response = await client.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );
    log("Response: ${response.body}");
    debugPrint("StatusCode: ${response.statusCode}");
    return handleResponse(response);
  }

  // PUT method
  static Future<String?> put(
    String api,
    Map<String, dynamic> body,
    Map<String, String>? param,
  ) async {
    final Uri url = Uri.http(baseURl, api, param);
    final http.Response response = await client.put(
      url,
      headers: headers,
      body: jsonEncode(body),
    );
    return handleResponse(response);
  }

  // PATCH method
  static Future<String?> patch(
    String api,
    Map<String, String> params,
    Map<String, dynamic> body,
  ) async {
    final Uri url = Uri.http(baseURl, api, params);
    final http.Response response = await client.patch(
      url,
      headers: headers,
      body: jsonEncode(body),
    );
    return handleResponse(response);
  }

  // DELETE method
  static Future<String?> delete(String api, Map<String, String>? params) async {
    final Uri url = Uri.http(baseURl, api, params);
    final http.Response response = await client.delete(
      url,
      headers: headers,
    );
    return handleResponse(response);
  }

  /// params
  static Map<String, String> emptyParams() => <String, String>{};
  static Map<String, String> paramGetPostAll() => {
        "page": "1",
        "size": "2",
      };

  /// body
  static Map<String, dynamic> bodyEmpty() => <String, dynamic>{};
}
