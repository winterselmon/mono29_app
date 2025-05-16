import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/core/utils/function_widgets.dart';
import 'package:flutter/material.dart';

class ContactLocationWidget extends StatefulWidget {
  final String address;
  const ContactLocationWidget({required this.address, super.key});

  @override
  State<ContactLocationWidget> createState() => _ContactLocationWidgetState();
}

class _ContactLocationWidgetState extends State<ContactLocationWidget> {
  double screenWidth = 0.0;
  final contactLocationHeight = 220.0;
  final addressWidth = 220.0;

  TextStyle titleStyle = const TextStyle(fontSize: 26);
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      color: AppColors.suggestionsZone2,
      height: contactLocationHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'สามารถติดต่อ MONO29TV ได้ที่',
            style: titleStyle,
          ),
          addVerticalSpace(10),
          Container(
            width: addressWidth,
            alignment: Alignment.center,
            child: Text(
              widget.address,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
