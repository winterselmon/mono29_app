import 'package:MONO29/core/services/nielsen_config.dart';
import 'package:MONO29/core/utils/log.dart';
import 'package:flutter/services.dart';

class NielsenBridge {
  static const _channel = MethodChannel("nielsen_bridge");

  static Future<void> init({required String appId}) async {
    try {
      await _channel.invokeMethod("init", {"appId": appId});
    } on PlatformException catch (e) {
      print("Nielsen init failed: ${e.message}");
    }
  }

  static Future<void> loadMetadata(Map<String, String> metadata) async {
    try {
      await _channel.invokeMethod("loadMetadata", {"metadata": metadata});
    } on PlatformException catch (e) {
      print("Load metadata failed: ${e.message}");
    }
  }

  static Future<void> play({Map<String, String>? metadata}) async {
    try {
      await _channel.invokeMethod("play", {"metadata": metadata ?? {}});
    } on PlatformException catch (e) {
      print("Play failed: ${e.message}");
    }
  }

  static Future<void> stop() async {
    try {
      await _channel.invokeMethod("stop");
    } on PlatformException catch (e) {
      print("Stop failed: ${e.message}");
    }
  }
}
