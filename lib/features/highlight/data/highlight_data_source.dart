import 'package:MONO29/core/constants/api_endpoints.dart';
import 'package:MONO29/core/network/api_service.dart';
import 'package:MONO29/core/utils/log.dart';
import 'package:MONO29/features/highlight/data/models/highlight_response_model.dart';

class HighlightDataSource {
  final ApiService apiService;

  HighlightDataSource(this.apiService);

  Future<dynamic> getHighlightFeed({Map<String, dynamic>? body}) async {
    final json = await apiService.post(ApiEndpoints.highlightFeed, body: body);

    if (json is Map<String, dynamic>) {
      return HighlightResponseModel.fromJson(json);
    } else {
      printLog('Unexpected JSON format: $json');
    }
  }
}
