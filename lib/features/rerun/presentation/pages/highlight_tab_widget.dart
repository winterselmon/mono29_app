import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/core/network/api_service.dart';
import 'package:MONO29/core/utils/function_widgets.dart';
import 'package:MONO29/core/utils/log.dart';
import 'package:MONO29/features/rerun/bloc/rerun_bloc.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_yt_highlight_response_model.dart';
import 'package:MONO29/features/rerun/data/rerun_data_source.dart';
import 'package:MONO29/features/rerun/data/rerun_repository_impl.dart';
import 'package:MONO29/features/rerun/presentation/dialog/rerun_yt_highlight_dialog.dart';
import 'package:MONO29/features/rerun/utils/highlight_combiner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HighlightTabWidget extends StatefulWidget {
  const HighlightTabWidget({super.key});

  @override
  State<HighlightTabWidget> createState() => _HighlightTabWidgetState();
}

class _HighlightTabWidgetState extends State<HighlightTabWidget> {
  final ApiService _apiService = ApiService();
  List<RerunYtVideo> allYtShorts = [];
  List<RerunYtVideo> allYtVideos = [];

  void _showHighlightDetailDialog(
      BuildContext context, RerunYtVideo rerunYtModel, String type) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => RerunYtHighlightDialog(
        rerunYtModel: rerunYtModel,
        type: type,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RerunBloc(RerunRepositoryImpl(RerunDataSource(_apiService)))
            ..add(FetchTabData(0)),
      child: BlocBuilder<RerunBloc, RerunState>(
        builder: (context, state) {
          printLog(state.toString());
          if (state is RerunLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is RerunHighlightLoaded) {
            RerunYtHighlightResponseModel rerunYtHighlightRes =
                state.rerunYtHighlightResponseModel;

            allYtVideos = getAllHighlightYtVideos(rerunYtHighlightRes);
            allYtShorts = getAllHighlightYtShorts(rerunYtHighlightRes);

            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    //Videos
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            _showHighlightDetailDialog(
                              context,
                              allYtVideos[index],
                              'video',
                            );
                          },
                          child: SizedBox(
                            width: screenWidth(context),
                            child: Container(
                                height: 120,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 4),
                                child: Row(
                                  children: [
                                    Image.network(
                                      allYtVideos[index].thumbnails,
                                      fit: BoxFit.cover,
                                      width: 160,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        printLog(error.toString());
                                        return Text('Error');
                                      },
                                    ),
                                    addHorizontalSpace(10),
                                    Expanded(
                                      child: Text(
                                        allYtVideos[index].title,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.whiteColor),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                      itemCount: allYtVideos.length,
                      shrinkWrap: true,
                    ),
                    addVerticalSpace(20),
                    // Shorts
                    SizedBox(
                      height: 150,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              _showHighlightDetailDialog(
                                context,
                                allYtShorts[index],
                                'short',
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 4),
                              child: Image.network(
                                allYtShorts[index].thumbnails,
                                fit: BoxFit.cover,
                                width: 160,
                                height: 130,
                                errorBuilder: (context, error, stackTrace) {
                                  printLog(error.toString());
                                  return Text('Error');
                                },
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                        itemCount: allYtShorts.length,
                        shrinkWrap: true,
                      ),
                    ),
                    addVerticalSpace(20),
                  ],
                ),
              ),
            );
          } else if (state is RerunError) {
            return Center(child: Text(""));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
