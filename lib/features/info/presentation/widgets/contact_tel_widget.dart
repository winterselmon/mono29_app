import 'package:MONO29/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ContactTelWidget extends StatefulWidget {
  final String tel;
  final String fax;
  const ContactTelWidget({
    required this.tel,
    required this.fax,
    super.key,
  });

  @override
  State<ContactTelWidget> createState() => _ContactTelWidgetState();
}

class _ContactTelWidgetState extends State<ContactTelWidget> {
  double screenWidth = 0.0;
  final contactLocationHeight = 220.0;

  TextStyle normalStyle = TextStyle(color: AppColors.whiteColor, fontSize: 16);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      color: AppColors.suggestionsZone1,
      height: contactLocationHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'เบอร์ติดต่อ :',
            style: normalStyle,
          ),
          Text(
            'โทรศัพท์ ${widget.tel}',
            style: normalStyle,
          ),
          Text(
            'โทรสาร ${widget.fax}',
            style: normalStyle,
          ),
        ],
      ),
    );
  }
}
