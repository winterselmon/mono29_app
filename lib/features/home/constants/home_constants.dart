import 'package:MONO29/features/highlight/presentation/screen/hightlight_screen.dart';
import 'package:MONO29/features/live/presentation/screen/live_screen.dart';
import 'package:MONO29/features/prnews/presentation/screen/prnews_screen.dart';
import 'package:MONO29/features/rerun/presentation/screen/rerun_screen.dart';
import 'package:MONO29/features/schedule/presentation/screen/schedule_screen.dart';
import 'package:flutter/material.dart';

class HomeConstants {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> widgetOptions({required VoidCallback onBack}) {
    return [
      LiveScreen(
        onBack: onBack,
      ), //หน้า Live : Index 0
      HightlightScreen(), //หน้า Highlight : Index 1
      RerunScreen(), //หน้า Later : Index 2
      ScheduleScreen(), //หน้า Program Chart : Index 3
      EventScreen(), //หน้า Event : Index 4
    ];
  }
}
