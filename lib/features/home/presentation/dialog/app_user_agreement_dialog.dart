import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/core/network/api_service.dart';
import 'package:MONO29/core/utils/function_widgets.dart';
import 'package:MONO29/core/utils/log.dart';
import 'package:MONO29/features/home/data/home_data_source.dart';
import 'package:MONO29/features/home/data/models/request/user_agreement_accept_request_model.dart';
import 'package:MONO29/features/home/data/models/response/user_agreement_accept_response_model.dart';
import 'package:MONO29/features/home/data/models/response/user_agreement_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class AppUserAgreementDialog extends StatefulWidget {
  final Data data;
  const AppUserAgreementDialog({required this.data, super.key});

  @override
  State<AppUserAgreementDialog> createState() => _AppUserAgreementDialogState();
}

class _AppUserAgreementDialogState extends State<AppUserAgreementDialog> {
  bool isCheck = false;

  TextStyle styleIsCheck =
      TextStyle(fontSize: 16, color: AppColors.textIsCheck);

  Future<UserAgreementAcceptResponseModel> fetchUserAgreementAccept(
      BuildContext context) async {
    final apiService = ApiService();

    try {
      UserAgreementAcceptRequestModel userAgreementAcceptRequestModel =
          UserAgreementAcceptRequestModel();
      userAgreementAcceptRequestModel.uuid = 'test1111';

      UserAgreementAcceptResponseModel userAgreementAcceptResponseModel =
          await HomeDataSource(apiService).getUserAgreementAcceptFeed(
              body: userAgreementAcceptRequestModel.toJson());

      printLog(userAgreementAcceptResponseModel.toJson().toString());

      if (userAgreementAcceptResponseModel.status!) {}

      return userAgreementAcceptResponseModel;
    } catch (e) {
      printLog(e);
      throw Exception('Failed to fetch highlights: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: screenWidth(context),
          padding: const EdgeInsets.all(8.0),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: AppColors.whiteColor,
                ),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: screenWidth(context),
                          height: screenHeight(context) * 0.85,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(14),
                                  margin: EdgeInsets.only(right: 40),
                                  child: Text(
                                    'Mono29 App: User Agreement',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                addVerticalSpace(5),
                                Container(
                                  height: 1,
                                  color: Colors.grey,
                                  width: screenWidth(context),
                                ),
                                addVerticalSpace(20),
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Html(
                                        data: widget.data.descriptionHtml)),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(
                                              value: isCheck,
                                              onChanged: (value) {
                                                setState(() {
                                                  isCheck = !isCheck;
                                                });
                                              }),
                                          Text('ยอมรับ')
                                        ],
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 60,
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('[X] ปิด')),
                                      )
                                    ],
                                  ),
                                ),
                                addVerticalSpace(80)
                              ],
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
                    Positioned(
                      bottom: 10,
                      right: 0,
                      left: 0,
                      child: InkWell(
                        onTap: () {
                          if (isCheck) {
                            printLog('check');
                            fetchUserAgreementAccept(context);
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(14),
                          width: screenWidth(context),
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          color: isCheck
                              ? AppColors.okButtonCheck
                              : AppColors.okButtonNotcheck,
                          child: Text(
                            'OK',
                            style: styleIsCheck,
                          ),
                        ),
                      ),
                    )
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
