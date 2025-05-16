import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/core/constants/width_height.dart';
import 'package:flutter/material.dart';

//currentIndex 0 = ดูทีวีสด, 1 = ไฮไลท์, 2 = ย้อนหลัง, 3 = ผังรายการ, 4 = กิจกรรม, // 5 = ติดต่อ

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final int currentIndex;

  final Color? backgroundColor;
  final Color? textColor;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.currentIndex,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: WidthHeight.appBarHeight,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: textColor ?? Colors.white,
        ),
      ),
      actionsPadding: EdgeInsets.symmetric(horizontal: 10),
      backgroundColor:
          currentIndex == 1 ? AppColors.hightlightScreen : AppColors.appBar,
      actions: [
        Image.asset(
          'assets/images/Mono_29_Logo.png',
          width: WidthHeight.iconWidth,
          height: WidthHeight.iconHeight,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(WidthHeight.appBarHeight);
}
