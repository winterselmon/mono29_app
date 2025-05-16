import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/core/network/api_service.dart';
import 'package:MONO29/core/utils/function_widgets.dart';
import 'package:MONO29/core/utils/log.dart';
import 'package:MONO29/features/rerun/bloc/rerun_bloc.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_highlight_response_model.dart';
import 'package:MONO29/features/rerun/data/rerun_data_source.dart';
import 'package:MONO29/features/rerun/data/rerun_repository_impl.dart';
import 'package:MONO29/features/rerun/presentation/dialog/rerun_highlight_dialog.dart';
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
  List allList = [];

  void _showHighlightDetailDialog(
      BuildContext context, String playlistId, String videoId) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => RerunHighlightDialog(
        playlistId: playlistId,
        videoId: videoId,
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
            RerunHighlightResposneModel rerunHighlightRes =
                state.rerunHighlightResposneModel;
            return Center(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  Highlight highlight =
                      rerunHighlightRes.data!.highlight![index];

                  return GestureDetector(
                    onTap: () {
                      _showHighlightDetailDialog(
                        context,
                        highlight.pid!,
                        highlight.id.toString(),
                      );
                    },
                    child: Container(
                        height: 110,
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: Row(
                          children: [
                            Image.network(
                              rerunHighlightRes.data!.highlight![index].img!,
                              fit: BoxFit.cover,
                              width: 160,
                              errorBuilder: (context, error, stackTrace) {
                                printLog(error.toString());
                                return Text('Error');
                              },
                            ),
                            addHorizontalSpace(10),
                            Expanded(
                              child: Text(
                                '${rerunHighlightRes.data!.highlight![index].title}',
                                style: TextStyle(color: AppColors.whiteColor),
                              ),
                            )
                          ],
                        )),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                itemCount: rerunHighlightRes.data!.highlight!.length,
                shrinkWrap: true,
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
