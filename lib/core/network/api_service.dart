import 'dart:convert';
import 'package:MONO29/core/config/app_config.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService()
      : dio = Dio(BaseOptions(
          baseUrl: AppConfig.baseUrl,
          responseType: ResponseType.json,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': AppConfig.basicAuthHeader,
          },
          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 10),
        ));

  Future<List<dynamic>> getList(String url) async {
    try {
      final response = await dio.get(url);
      return response.data is List ? response.data : [response.data];
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<dynamic> post(String url, {Map<String, dynamic>? body}) async {
    try {
      final response = await dio.post(
        url,
        data: FormData.fromMap(body ?? {}),
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );

      if (response.statusCode == 200) {
        if (response.data is String) {
          return json.decode(response.data);
        } else {
          return response.data;
        }
      }
    } catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _handleError(dynamic error) {
    if (error is DioException) {
      return 'API error: ${error.response?.statusCode} - ${error.response?.statusMessage ?? error.message}';
    }
    return 'Unknown error: $error';
  }
}
