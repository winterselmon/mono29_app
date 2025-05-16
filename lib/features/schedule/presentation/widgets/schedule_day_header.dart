import 'package:flutter/material.dart';
import 'package:MONO29/core/constants/app_colors.dart';

class ScheduleDayHeader extends StatelessWidget {
  final String title;

  const ScheduleDayHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      color: AppColors.scheduleScreenToptab,
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, color: AppColors.whiteColor),
      ),
    );
  }
}
