import 'package:MONO29/core/analytics/analytics_service.dart';
import 'package:MONO29/core/analytics/injection.dart';
import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/core/utils/webview_helper.dart';
import 'package:MONO29/features/info/data/models/info_response_model.dart';
import 'package:MONO29/features/info/presentation/dialog/user_agreement_dialog.dart';
import 'package:flutter/cupertino.dart';

class UserAgreementWidget extends StatefulWidget {
  final Data data;
  const UserAgreementWidget({required this.data, super.key});

  @override
  State<UserAgreementWidget> createState() => _UserAgreementWidgetState();
}

class _UserAgreementWidgetState extends State<UserAgreementWidget> {
  double screenWidth = 0.0;
  double userAgreementHeight = 220.0;
  double spacing = 15.0;
  String titleOnWebview = 'POLICY';
  final analytics = getIt<AnalyticsService>();

  TextStyle normalStyle = TextStyle(
      decoration: TextDecoration.underline,
      decorationColor: AppColors.whiteColor,
      color: AppColors.whiteColor,
      fontSize: 16);

  TextStyle forDevStyle = TextStyle(
    decoration: TextDecoration.underline,
    decorationColor: AppColors.whiteColor,
    color: AppColors.forDev,
  );

  void _showUserAgreement(BuildContext context, String text) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => UserAgreementDialog(
        userAgreenment: text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      height: userAgreementHeight,
      color: AppColors.suggestionsZone1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: spacing,
        children: [
          GestureDetector(
            onTap: () {
              analytics.logEvent('tap_user_agreement');
              _showUserAgreement(context, widget.data.userAgreement ?? '');
            },
            child: Text(
              "User Agreement and Privacy Policy",
              style: normalStyle,
            ),
          ),
          GestureDetector(
            onTap: () {
              analytics.logEvent('tap_user_policy');

              WebViewHelper.openInAppWebView(
                  context, widget.data.policyUrl ?? '', titleOnWebview);
            },
            child: Text(
              "นโยบายการใช้งานและความเป็นส่วนตัว",
              style: normalStyle,
            ),
          ),
          GestureDetector(
            onTap: () {
              analytics.logEvent('tap_cookie_policy');
              WebViewHelper.openInAppWebView(
                  context, widget.data.cookieUrl ?? '', titleOnWebview);
            },
            child: Text(
              "นโยบายคุกกี้",
              style: normalStyle,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              "For Developer",
              style: forDevStyle,
            ),
          ),
        ],
      ),
    );
  }
}
