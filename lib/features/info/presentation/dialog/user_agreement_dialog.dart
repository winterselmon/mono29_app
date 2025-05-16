import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/core/utils/function_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class UserAgreementDialog extends StatefulWidget {
  final String userAgreenment;
  const UserAgreementDialog({required this.userAgreenment, super.key});

  @override
  State<UserAgreementDialog> createState() => _UserAgreementDialogState();
}

class _UserAgreementDialogState extends State<UserAgreementDialog> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: AppColors.whiteColor,
                ),
                width: screenWidth(context),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                            width: screenWidth(context),
                            height: screenHeight(context) * 0.85,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 40),
                                    child: Text(
                                      'Mono29 App: User Agreement and Privacy Policy',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  addVerticalSpace(20),
                                  Container(
                                    height: 1,
                                    color: Colors.grey,
                                    width: screenWidth(context),
                                  ),
                                  addVerticalSpace(20),
                                  Html(data: widget.userAgreenment)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 8,
                      top: 2,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close_rounded,
                            size: 35,
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
