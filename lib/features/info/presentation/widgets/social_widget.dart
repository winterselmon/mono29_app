import 'package:MONO29/core/analytics/analytics_service.dart';
import 'package:MONO29/core/analytics/injection.dart';
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
    final analytics = getIt<AnalyticsService>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            analytics.logEvent('tap_facebook',
                parameters: {'url': data.facebook ?? ''});
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
            analytics.logEvent('tap_youtube',
                parameters: {'url': data.youtube ?? ''});
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
            analytics.logEvent('tap_instagram',
                parameters: {'url': data.instagram ?? ''});
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
            analytics
                .logEvent('tap_twitter', parameters: {'url': data.x ?? ''});
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
