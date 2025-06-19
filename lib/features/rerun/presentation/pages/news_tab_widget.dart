import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/core/dispatch/rerun_dispatcher.dart';
import 'package:MONO29/core/network/api_service.dart';
import 'package:MONO29/core/utils/function_widgets.dart';
import 'package:MONO29/features/rerun/bloc/rerun_bloc.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_yt_news_response_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_yt_playlist_response_model.dart';
import 'package:MONO29/features/rerun/data/rerun_data_source.dart';
import 'package:MONO29/features/rerun/data/rerun_repository_impl.dart';
import 'package:MONO29/features/rerun/presentation/widgets/news/news_grid.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsTabWidget extends StatefulWidget {
  const NewsTabWidget({super.key});

  @override
  State<NewsTabWidget> createState() => _NewsTabWidgetState();
}

class _NewsTabWidgetState extends State<NewsTabWidget> {
  final ApiService _apiService = ApiService();
  RerunYtNewsResponseModel? _cachedModel;
  RerunYtPlaylistResponseModel? _cachedPlaylistModel;
  List<YtPlaylistData> playlistYt = [];
  List<PlaylistData> newsYtList = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RerunBloc(RerunRepositoryImpl(RerunDataSource(_apiService)))
            ..add(FetchTabData(2)),
      child: BlocBuilder<RerunBloc, RerunState>(
        builder: (context, state) {
          if (state is RerunNewsLoaded) {
            _cachedModel = state.rerunYtNewsResponseModel;
            newsYtList = _cachedModel?.data ?? [];

            return SingleChildScrollView(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: newsYtList.length,
                physics: NeverScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      RerunDispatcher.disPatchRerunYtPlaylist(
                          context,
                          newsYtList[index].playlistId ?? '',
                          newsYtList[index].playlistName ?? '');
                    },
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: newsYtList[index].thumbnailUrl ?? '',
                          errorWidget: (_, __, ___) => const Icon(Icons.error),
                          placeholder: (_, __) => Image.asset(
                            'assets/images/Mono_29_Logo.png',
                          ),
                        ),
                        addVerticalSpace(10),
                        Text(
                          newsYtList[index].playlistName ?? '',
                          style: TextStyle(color: AppColors.whiteColor),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          } else if (state is RerunLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RerunPlaylistLoaded) {
            _cachedPlaylistModel = state.rerunYtPlaylistResponseModel;

            playlistYt = _cachedPlaylistModel?.data ?? [];
            String playlistName = state.playlistName;

            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    width: screenWidth(context),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            RerunDispatcher.disPatchIsFetchRerunTab(context, 2);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            // color: Colors.amber,
                            width: 60,
                            child: Text(
                              '<<',
                              style: TextStyle(
                                  fontSize: 20, color: AppColors.whiteColor),
                            ),
                          ),
                        ),
                        Text(
                          playlistName,
                          style: TextStyle(
                              fontSize: 18, color: AppColors.whiteColor),
                        ),
                      ],
                    ),
                  ),
                  addVerticalSpace(20),
                  NewsList(items: playlistYt)
                ],
              ),
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}
