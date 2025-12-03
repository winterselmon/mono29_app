import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:MONO29/core/services/nielsen_config.dart';
import 'package:MONO29/core/utils/log.dart';

class NielsenBridge {
  static const _channel = MethodChannel("nielsen_bridge");

  /// Init Nielsen SDK
  static Future<void> init(String appIdAndroid,
      {bool enableDebug = kDebugMode}) async {
    try {
      final appId = Platform.isAndroid
          ? NielsenConfig.appIdAndroid
          : Platform.isIOS
              ? NielsenConfig.appIdIos
              : null;

      if (appId == null) {
        printLog("Unsupported platform: ${Platform.operatingSystem}");
        return;
      }

      final result = await _channel.invokeMethod(
        "init",
        {
          "appId": appId,
          "debug": enableDebug,
        },
      );
      printLog("Init success: $result");
    } on PlatformException catch (e) {
      printLog("Init failed: ${e.message}");
    } on MissingPluginException {
      printLog("Init not implemented on ${Platform.operatingSystem}");
    }
  }

  /// Load Metadata (e.g. program info, content type)
  static Future<void> loadMetadata(Map<String, String> metadata) async {
    try {
      final result =
          await _channel.invokeMethod("loadMetadata", {"metadata": metadata});
      printLog("Load metadata success: $result");
    } on PlatformException catch (e) {
      printLog("Load metadata failed: ${e.message}");
    } on MissingPluginException {
      printLog("Load metadata not implemented on ${Platform.operatingSystem}");
    }
  }

  /// Play Event (start playing content)
  static Future<void> play({Map<String, String>? metadata}) async {
    try {
      final result =
          await _channel.invokeMethod("play", {"metadata": metadata ?? {}});
      printLog("Play success: $result");
    } on PlatformException catch (e) {
      printLog("Play failed: ${e.message}");
    } on MissingPluginException {
      printLog("Play not implemented on ${Platform.operatingSystem}");
    }
  }

  /// Stop Event (stop playback)
  static Future<void> stop() async {
    try {
      final result = await _channel.invokeMethod("stop");
      printLog("Stop success: $result");
    } on PlatformException catch (e) {
      printLog("Stop failed: ${e.message}");
    } on MissingPluginException {
      printLog("Stop not implemented on ${Platform.operatingSystem}");
    }
  }

  /// End Nielsen session
  static Future<void> end() async {
    try {
      final result = await _channel.invokeMethod("end");
      printLog("End success: $result");
    } catch (e) {
      printLog("End error: $e");
    }
  }

  /// Update playhead position (seconds)
  static Future<void> setPlayheadPosition(int position) async {
    try {
      final result = await _channel
          .invokeMethod("setPlayheadPosition", {"position": position});
      printLog("Set playhead position: $result");
    } catch (e) {
      printLog("Set playhead error: $e");
    }
  }
}
