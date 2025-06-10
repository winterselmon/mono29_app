import 'package:MONO29/features/rerun/data/models/response/rerun_yt_highlight_response_model.dart';

List<RerunYtVideo> getAllHighlightYtVideos(
    RerunYtHighlightResponseModel model) {
  return [
    ...model.data.mono29.ytVideos,
    ...model.data.mononews.ytVideos,
  ];
}

List<RerunYtVideo> getAllHighlightYtShorts(
    RerunYtHighlightResponseModel model) {
  return [
    ...model.data.mono29.ytShorts,
    ...model.data.mononews.ytShorts,
  ];
}
