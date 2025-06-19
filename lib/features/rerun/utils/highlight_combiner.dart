import 'package:MONO29/features/rerun/data/models/response/rerun_yt_highlight_response_model.dart';

List<RerunYtVideo> getAllHighlightYtVideos(
    RerunYtHighlightResponseModel model) {
  final mono29Videos = model.data.mono29.ytVideos ?? [];
  final mononewsVideos = model.data.mononews.ytVideos ?? [];

  if (mono29Videos.isEmpty && mononewsVideos.isEmpty) {
    return [];
  }

  return [...mono29Videos, ...mononewsVideos];
}

List<RerunYtVideo> getAllHighlightYtShorts(
    RerunYtHighlightResponseModel model) {
  final mono29Shorts = model.data.mono29.ytShorts ?? [];
  final mononewsShorts = model.data.mononews.ytShorts ?? [];

  if (mono29Shorts.isEmpty && mononewsShorts.isEmpty) {
    return [];
  }

  return [...mono29Shorts, ...mononewsShorts];
}
