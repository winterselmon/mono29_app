import 'package:MONO29/features/rerun/data/models/response/rerun_highlight_response_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_news_response_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_news_single_response_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_series_response_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_series_single_response_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_yt_highlight_response_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_yt_news_response_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_yt_playlist_response_model.dart';

abstract class RerunRepository {
  Future<RerunHighlightResposneModel> fetchRerunHighLight();

  Future<RerunSeriesResposneModel> fetchRerunSeries();

  Future<RerunNewsResposneModel> fetchRerunNews();

  Future<RerunNewsSingleResponseModel> fetchRerunNewsSingle(
      {Map<String, dynamic> body});

  Future<RerunSeriesSingleResponseModel> fetchRerunSeriesSingle(
      {Map<String, dynamic> body});

  Future<RerunYtHighlightResponseModel> fetchRerunYtHighlight();

  Future<RerunYtNewsResponseModel> fetchRerunYtNews();

  Future<RerunYtPlaylistResponseModel> fetchRerunYtPlaylist(
      {Map<String, dynamic> body});
}
