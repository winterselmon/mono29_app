import 'package:MONO29/features/rerun/presentation/widgets/news/rerun_highlight_list.dart';
import 'package:MONO29/features/rerun/presentation/widgets/news/rerun_related_list.dart';
import 'package:MONO29/features/rerun/presentation/widgets/news/rerun_youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/core/constants/width_height.dart';
import 'package:MONO29/core/network/api_service.dart';
import 'package:MONO29/core/utils/function_widgets.dart';
import 'package:MONO29/features/rerun/bloc/rerun_bloc.dart';
import 'package:MONO29/features/rerun/data/rerun_data_source.dart';
import 'package:MONO29/features/rerun/data/rerun_repository_impl.dart';

class RerunHighlightDialog extends StatelessWidget {
  final String playlistId;
  final String videoId;

  const RerunHighlightDialog({
    super.key,
    required this.playlistId,
    required this.videoId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RerunBloc(
        RerunRepositoryImpl(RerunDataSource(ApiService())),
      )..add(FetchRerunNewsSingle(playlistId, videoId)),
      child: const _RerunHighlightView(),
    );
  }
}

class _RerunHighlightView extends StatelessWidget {
  const _RerunHighlightView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RerunBloc, RerunState>(
      builder: (context, state) {
        if (state is RerunLoading || state is RerunInitial) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is RerunNewsSingleLoaded) {
          final video = state.rerunNewsSingleResponseModel.data.video;
          final highlights = state.rerunNewsSingleResponseModel.data.highlight;
          final related = state.rerunNewsSingleResponseModel.data.related;

          return SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.hightlightScreen,
              appBar: AppBar(
                backgroundColor: AppColors.appBar,
                leadingWidth: 150,
                centerTitle: true,
                actionsPadding: const EdgeInsets.symmetric(horizontal: 10),
                leading: GestureDetector(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                title: const Text('ย้อนหลัง',
                    style: TextStyle(color: AppColors.whiteColor)),
                actions: [
                  Image.asset(
                    'assets/images/Mono_29_Logo.png',
                    width: WidthHeight.iconWidth,
                    height: WidthHeight.iconHeight,
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RerunYoutubePlayer(youtubeHtml: video.youtube),
                      addVerticalSpace(10),
                      Text(video.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.okButtonNotcheck,
                          )),
                      addVerticalSpace(5),
                      Text(video.ptitle,
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.forDev,
                          )),
                      addVerticalSpace(20),
                      const Divider(color: Colors.grey),
                      addVerticalSpace(10),
                      RerunRelatedList(related: related),
                      addVerticalSpace(15),
                      const Text('รวมคลิปข่าวเด่น',
                          style: TextStyle(
                              fontSize: 18, color: AppColors.okButtonNotcheck)),
                      addVerticalSpace(15),
                      RerunHighlightList(highlight: highlights),
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        return const Center(child: Text('เกิดข้อผิดพลาด'));
      },
    );
  }
}
