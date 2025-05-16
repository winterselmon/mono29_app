import 'package:MONO29/core/constants/app_colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class DotIndicatorWidget extends StatefulWidget {
  final int currentPage;
  const DotIndicatorWidget({super.key, required this.currentPage});

  @override
  State<DotIndicatorWidget> createState() => _DotIndicatorWidgetState();
}

class _DotIndicatorWidgetState extends State<DotIndicatorWidget> {
  DotsDecorator _dotsDecorator = DotsDecorator();
  final double _dotHeight = 15.0, _dotWidth = 15.0;

  @override
  void initState() {
    super.initState();
    _dotsDecorator = DotsDecorator(
      color: AppColors.dotInactive,
      size: Size(_dotWidth, _dotHeight),
      activeSize: Size(_dotWidth, _dotHeight),
      activeColor: Colors.redAccent,
      shape: RoundedRectangleBorder(
        // รูปร่างตอน inactive
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: AppColors.dotInactive,
          width: 3,
        ),
      ),
      activeShape: RoundedRectangleBorder(
        // รูปร่างตอน active
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: AppColors.whiteColor,
          width: 3,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      child: DotsIndicator(
        dotsCount: 5,
        position: widget.currentPage.toDouble(),
        decorator: _dotsDecorator,
      ),
    );
  }
}
