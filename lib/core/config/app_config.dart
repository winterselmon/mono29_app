import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String get baseUrl => dotenv.env['BASE_URL'] ?? '';
  static String get username => dotenv.env['USERNAME'] ?? '';
  static String get password => dotenv.env['PASSWORD'] ?? '';

  static String get basicAuthHeader {
    final credentials = '$username:$password';
    final encoded = base64Encode(utf8.encode(credentials));
    return 'Basic $encoded';
  }
}
