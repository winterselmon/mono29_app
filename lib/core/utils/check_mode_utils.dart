import 'package:MONO29/core/enums/mode_enum.dart';
import 'package:MONO29/core/utils/log.dart';
import 'package:MONO29/core/utils/webview_helper.dart';
import 'package:flutter/material.dart';

extension ModeTypeParser on String {
  ModeTypeEnum toModeType() {
    switch (this) {
      case 'popup':
        return ModeTypeEnum.popup;
      // case 'banner':
      //   return ModeType.banner;
      // case 'fullScreen':
      //   return ModeType.fullScreen;
      default:
        throw Exception('Unknown mode: $this');
    }
  }
}

void handleMode(
  BuildContext context,
  String modeString,
  String source, {
  String title = 'MONO29',
}) {
  try {
    final mode = modeString.toModeType();

    switch (mode) {
      case ModeTypeEnum.popup:
        printLog('แสดงแบบ Popup');
        WebViewHelper.openInAppWebView(
          context,
          source,
          title,
        );
        break;
      // case ModeTypeEnum.banner:
      //   print('แสดงเป็น Banner');
      //   break;
      // case ModeTypeEnum.fullScreen:
      //   print('แสดงแบบ Full Screen');
      //   break;
    }
  } catch (e) {
    printLog('Mode ไม่รู้จัก: $modeString');
  }
}
