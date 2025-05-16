import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/core/constants/width_height.dart';
import 'package:MONO29/core/utils/function_widgets.dart';
import 'package:MONO29/features/info/data/models/info_response_model.dart';
import 'package:MONO29/features/info/presentation/widgets/social_widget.dart';
import 'package:MONO29/features/info/presentation/widgets/suggest_button_widget.dart';
import 'package:flutter/material.dart';

class LogoSuggestWidget extends StatefulWidget {
  final Data data;
  const LogoSuggestWidget({required this.data, super.key});

  @override
  State<LogoSuggestWidget> createState() => _LogoSuggestWidgetState();
}

class _LogoSuggestWidgetState extends State<LogoSuggestWidget> {
  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: AppColors.suggestionsZone1,
      width: screenWidth,
      child: Column(
        children: [
          addVerticalSpace(50),
          Image.asset(
            'assets/images/Mono_29_Logo.png',
            width: 330,
            height: 130,
          ),
          addVerticalSpace(30),
          SuggestButtonWidget(
            reportUrl: widget.data.reportUrl ?? '',
          ),
          addVerticalSpace(30),
          SocialWidget(
            iconWidth: WidthHeight.socialIconWidth,
            iconHeight: WidthHeight.socialIconHeight,
            data: widget.data,
          ),
          addVerticalSpace(50),
        ],
      ),
    );
  }
}
