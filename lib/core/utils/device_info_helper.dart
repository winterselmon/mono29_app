import 'dart:io';

import 'package:MONO29/core/utils/log.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DeviceInfoHelper {
  // ฟังก์ชันดึงข้อมูล OS
  static String getOs() {
    if (Platform.isAndroid) {
      return 'android';
    } else if (Platform.isIOS) {
      return 'ios';
    }

    return 'Unknown OS';
  }

  // ฟังก์ชันดึงข้อมูล App Version
  static Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    printLog(packageInfo.version);
    return packageInfo.version; // คืนค่าเวอร์ชันของแอป เช่น "1.0.0"
  }

  // ฟังก์ชันดึงข้อมูลทั้ง OS และ App Version
  static Future<Map<String, String>> getOsAndAppVersion() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    final os = getOs();
    final appVersion = await getAppVersion();
    final id = await deviceInfoPlugin.deviceInfo;
    // printLog(id.data['id']);
    return {'os': os, 'appVersion': '5.0', 'udid': id.data['id']};
  }
}
