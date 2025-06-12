import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/core/constants/global_values.dart';
import 'package:MONO29/core/network/api_service.dart';
import 'package:MONO29/core/utils/app_pref_key.dart';
import 'package:MONO29/core/utils/app_preferences.dart';
import 'package:MONO29/core/utils/function_widgets.dart';
import 'package:MONO29/core/utils/log.dart';
import 'package:MONO29/features/home/data/home_data_source.dart';
import 'package:MONO29/features/home/data/home_repository_impl.dart';
import 'package:MONO29/features/home/data/models/request/user_agreement_accept_request_model.dart';
import 'package:MONO29/features/home/data/models/response/user_agreement_accept_response_model.dart';
import 'package:MONO29/features/home/data/models/response/user_agreement_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_html/flutter_html.dart';

class AppUserAgreementDialog extends StatefulWidget {
  final Data data;
  const AppUserAgreementDialog({required this.data, super.key});

  @override
  State<AppUserAgreementDialog> createState() => _AppUserAgreementDialogState();
}

class _AppUserAgreementDialogState extends State<AppUserAgreementDialog> {
  bool isCheck = false;
  late BuildContext _buildContext;
  TextStyle styleIsCheck =
      TextStyle(fontSize: 16, color: AppColors.textIsCheck);

  Future<UserAgreementAcceptResponseModel> fetchUserAgreementAccept(
      BuildContext context) async {
    EasyLoading.show();
    final apiService = ApiService();

    try {
      // UserAgreementResponseModel userAgreementResponseModel =
      //         await repository.fetchUserAgreement({'udid': udid});

      UserAgreementAcceptRequestModel userAgreementAcceptRequestModel =
          UserAgreementAcceptRequestModel();
      userAgreementAcceptRequestModel.udid = GlobalValues.udidGlobal;

      // UserAgreementAcceptResponseModel userAgreementAcceptResponseModel =
      //     await HomeDataSource(apiService).getUserAgreementAcceptFeed(
      //         body: userAgreementAcceptRequestModel.toJson());
      UserAgreementAcceptResponseModel userAgreementAcceptResponseModel =
          await HomeRepositoryImpl(HomeDataSource(apiService))
              .fetchUserAgreementAccept(
                  userAgreementAcceptRequestModel.toJson());

      if (userAgreementAcceptResponseModel.status == true) {
        AppPreferences.setBool(AppPrefKeys.isShowDialog, true);
        GlobalValues.isShowDialog = true;

        EasyLoading.dismiss();
      } else {
        printLog('Failed to Accept User Agreement');
      }
      return userAgreementAcceptResponseModel;
    } catch (e) {
      printLog(e);
      throw Exception('Failed to fetch highlights: $e');
    }
  }

  _closeDialog() async {
    // AppPreferences.setBool(AppPrefKeys.isShowDialog, true);
    // GlobalValues.isShowDialog = true;

    Navigator.pop(_buildContext);
  }

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
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
                        onTap: () async {
                          if (isCheck) {
                            await fetchUserAgreementAccept(context)
                                .then((_) async {
                              // AppPreferences.setBool(
                              //     AppPrefKeys.isShowDialog, true);

                              // bool isShown = await AppPreferences.getBool(
                              //     AppPrefKeys.isShowDialog);
                              // // GlobalValues.isShowDialog = isShown;
                              // printLog('Is User Agreement Shown: $isShown');

                              _closeDialog();
                            });
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
