import 'package:MONO29/core/constants/api_endpoints.dart';
import 'package:MONO29/core/network/api_service.dart';
import 'package:MONO29/core/utils/log.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_highlight_response_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_news_response_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_news_single_response_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_series_response_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_series_single_response_model.dart';

class RerunDataSource {
  final ApiService apiService;

  RerunDataSource(this.apiService);

  Future<dynamic> fetchRerunHighLight({Map<String, dynamic>? body}) async {
    final json = await apiService.post(ApiEndpoints.rerunHighlight, body: body);

    if (json is Map<String, dynamic>) {
      return RerunHighlightResposneModel.fromJson(json);
    } else {
      printLog('Unexpected JSON format: $json');
    }
  }

  Future<dynamic> fetchRerunSeries({Map<String, dynamic>? body}) async {
    final json = await apiService.post(ApiEndpoints.rerunSeries, body: body);

    if (json is Map<String, dynamic>) {
      return RerunSeriesResposneModel.fromJson(json);
    } else {
      printLog('Unexpected JSON format: $json');
    }
  }

  Future<dynamic> fetchRerunNews({Map<String, dynamic>? body}) async {
    final json = await apiService.post(ApiEndpoints.rerunNews, body: body);

    if (json is Map<String, dynamic>) {
      return RerunNewsResposneModel.fromJson(json);
    } else {
      printLog('Unexpected JSON format: $json');
    }
  }

  Future<dynamic> fetchRerunNewsSingle({Map<String, dynamic>? body}) async {
    final json = await apiService.post(ApiEndpoints.rerunNewsSingle, body: body);

    if (json is Map<String, dynamic>) {
      printLog(json.toString());

      return RerunNewsSingleResponseModel.fromJson(json);
    } else {
      printLog('Unexpected JSON format: $json');
    }
  }

  Future<dynamic> fetchRerunSeriesSingle({Map<String, dynamic>? body}) async {
    final json =
        await apiService.post(ApiEndpoints.rerunSeriesSingle, body: body);

    if (json is Map<String, dynamic>) {
      return RerunSeriesSingleResponseModel.fromJson(json);
    } else {
      printLog('Unexpected JSON format: $json');
    }
  }
}
