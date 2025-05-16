import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/core/utils/app_helpers.dart';
import 'package:flutter/material.dart';

class SuggestButtonWidget extends StatefulWidget {
  final String reportUrl;
  const SuggestButtonWidget({required this.reportUrl, super.key});

  @override
  State<SuggestButtonWidget> createState() => _SuggestButtonWidgetState();
}

class _SuggestButtonWidgetState extends State<SuggestButtonWidget> {
  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        launchUrlHelper(widget.reportUrl);
      },
      child: Container(
        width: screenWidth,
        decoration: BoxDecoration(
          color: AppColors.suggestionsButton,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        margin: EdgeInsets.symmetric(horizontal: 40),
        height: 50,
        child: Center(
          child: Text(
            'ข้อเสนอแนะ/คำติชม',
            style: TextStyle(color: AppColors.whiteColor, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
