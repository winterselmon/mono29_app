import 'package:MONO29/features/rerun/data/models/response/rerun_highlight_response_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_news_response_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_news_single_response_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_series_response_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_series_single_response_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_yt_highlight_response_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_yt_news_response_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_yt_playlist_response_model.dart';
import 'package:MONO29/features/rerun/data/rerun_data_source.dart';
import 'package:MONO29/features/rerun/domain/repositories/rerun_repository.dart';

class RerunRepositoryImpl implements RerunRepository {
  final RerunDataSource dataSource;

  RerunRepositoryImpl(this.dataSource);

  @override
  Future<RerunHighlightResposneModel> fetchRerunHighLight() async {
    return await dataSource.fetchRerunHighLight();
  }

  @override
  Future<RerunSeriesResposneModel> fetchRerunSeries() async {
    return await dataSource.fetchRerunSeries();
  }

  @override
  Future<RerunNewsResposneModel> fetchRerunNews() async {
    return await dataSource.fetchRerunNews();
  }

  @override
  Future<RerunNewsSingleResponseModel> fetchRerunNewsSingle(
      {Map<String, dynamic>? body}) async {
    return await dataSource.fetchRerunNewsSingle(body: body);
  }

  @override
  Future<RerunSeriesSingleResponseModel> fetchRerunSeriesSingle(
      {Map<String, dynamic>? body}) async {
    return await dataSource.fetchRerunSeriesSingle(body: body);
  }

  @override
  Future<RerunYtHighlightResponseModel> fetchRerunYtHighlight() async {
    return await dataSource.fetchRerunYtHighlight();
  }

  @override
  Future<RerunYtNewsResponseModel> fetchRerunYtNews() async {
    return await dataSource.fetchRerunYtNews();
  }

  @override
  Future<RerunYtPlaylistResponseModel> fetchRerunYtPlaylist(
      {Map<String, dynamic>? body}) async {
    return await dataSource.fetchRerunYtPlaylist(body: body);
  }
}
