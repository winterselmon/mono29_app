import 'package:MONO29/core/utils/app_helpers.dart';
import 'package:MONO29/core/utils/function_widgets.dart';
import 'package:MONO29/features/info/data/models/info_response_model.dart';
import 'package:flutter/material.dart';

class SocialWidget extends StatelessWidget {
  final Data data;

  const SocialWidget({
    super.key,
    required this.iconWidth,
    required this.iconHeight,
    required this.data,
  });

  final double iconWidth;
  final double iconHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            launchUrlHelper(data.facebook!);
          },
          child: Image.asset(
            'assets/images/facebook.png',
            width: iconWidth,
            height: iconHeight,
          ),
        ),
        addHorizontalSpace(30),
        InkWell(
          onTap: () {
            launchUrlHelper(data.youtube!);
          },
          child: Image.asset(
            'assets/images/youtube.png',
            width: iconWidth,
            height: iconHeight,
          ),
        ),
        addHorizontalSpace(30),
        InkWell(
          onTap: () {
            launchUrlHelper(data.instagram!);
          },
          child: Image.asset(
            'assets/images/instagram.png',
            width: iconWidth,
            height: iconHeight,
          ),
        ),
        addHorizontalSpace(30),
        InkWell(
          onTap: () {
            launchUrlHelper(data.x!);
          },
          child: Image.asset(
            'assets/images/twitter.png',
            width: iconWidth,
            height: iconHeight,
          ),
        ),
      ],
    );
  }
}
