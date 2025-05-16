import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/core/dispatch/schedule_dispatcher.dart';
import 'package:MONO29/core/network/api_service.dart';
import 'package:MONO29/core/utils/function_widgets.dart';
import 'package:MONO29/core/utils/log.dart';
import 'package:MONO29/features/schedule/bloc/schedule_bloc.dart';
import 'package:MONO29/features/schedule/data/models/response/schedule_detail_response_model.dart';
import 'package:MONO29/features/schedule/data/schedule_data_source.dart';
import 'package:MONO29/features/schedule/data/schedule_repository_impl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class ScheduleDetailDialog extends StatefulWidget {
  final String postId;
  const ScheduleDetailDialog({required this.postId, super.key});

  @override
  State<ScheduleDetailDialog> createState() => _ScheduleDetailDialogState();
}

class _ScheduleDetailDialogState extends State<ScheduleDetailDialog> {
  final ApiService _apiService = ApiService();
  ScheduleDetailResponseModel _scheduleDetailResponseModel =
      ScheduleDetailResponseModel();
  bool isActiveNotif = false;

  @override
  Widget build(BuildContext context) {
    printLog(widget.postId);
    return BlocProvider(
      create: (context) =>
          ScheduleBloc(ScheduleRepositoryImpl(ScheduleDataSource(_apiService)))
            ..add(FetchScheduleDetailEvent(widget.postId)),
      child: BlocListener<ScheduleBloc, ScheduleState>(
        listener: (context, state) {
          if (state is ScheduleNotif) {
            isActiveNotif = state.isActiveNotif;
          }
        },
        child: BlocBuilder<ScheduleBloc, ScheduleState>(
          builder: (context, state) {
            if (state is ScheduleDetailLoaded) {
              _scheduleDetailResponseModel = state.scheduleDetailResponseModel;
            }
            return SafeArea(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: AppColors.whiteColor,
                        ),
                        width: screenWidth(context),
                        child: Stack(
                          children: [
                            _scheduleDetailResponseModel.data != null
                                ? Stack(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: SizedBox(
                                              width: screenWidth(context),
                                              height:
                                                  screenHeight(context) * 0.8,
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  spacing: 10,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      _scheduleDetailResponseModel
                                                              .data!.title ??
                                                          '',
                                                      style: TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                    addVerticalSpace(10),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(4),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.grey,
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: CachedNetworkImage(
                                                        fit: BoxFit.cover,
                                                        imageUrl:
                                                            _scheduleDetailResponseModel
                                                                    .data!
                                                                    .thumbnail ??
                                                                '',
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                        placeholder: (context,
                                                                url) =>
                                                            Image.asset(
                                                                'assets/images/default-thumbnail320.jpg'),
                                                      ),
                                                    ),
                                                    // addVerticalSpace(10),
                                                    // InkWell(
                                                    //   onTap: () =>
                                                    //       ScheduleDispatcher
                                                    //           .disPatchActiveNotif(
                                                    //               context),
                                                    //   child: Container(
                                                    //     decoration:
                                                    //         BoxDecoration(
                                                    //       color: AppColors
                                                    //           .scheduleDetailNotif,
                                                    //       borderRadius:
                                                    //           BorderRadius
                                                    //               .circular(8),
                                                    //     ),
                                                    //     padding:
                                                    //         EdgeInsets.all(20),
                                                    //     child: Row(
                                                    //       mainAxisAlignment:
                                                    //           MainAxisAlignment
                                                    //               .center,
                                                    //       children: [
                                                    //         Checkbox(
                                                    //           value:
                                                    //               isActiveNotif,
                                                    //           onChanged:
                                                    //               (value) {},
                                                    //         ),
                                                    //         Text(
                                                    //           'แจ้งเตือนเมื่อออกอากาศ',
                                                    //           style: TextStyle(
                                                    //               fontSize: 18),
                                                    //         ),
                                                    //       ],
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                    addVerticalSpace(10),
                                                    Text('เรื่องย่อ',
                                                        style: TextStyle(
                                                            fontSize: 20)),
                                                    Html(
                                                      data:
                                                          _scheduleDetailResponseModel
                                                                  .data!
                                                                  .description ??
                                                              '',
                                                    ),
                                                    addVerticalSpace(10),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 20,
                                                                vertical: 20),
                                                        alignment:
                                                            Alignment.center,
                                                        width: screenWidth(
                                                            context),
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          8)),
                                                          color: AppColors
                                                              .scheduleScreenToptab,
                                                        ),
                                                        child: Text(
                                                          'Close',
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .whiteColor),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : Center(child: CircularProgressIndicator()),
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
          },
        ),
      ),
    );
  }
}
