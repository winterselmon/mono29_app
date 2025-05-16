import 'package:MONO29/core/constants/api_endpoints.dart';
import 'package:MONO29/core/network/api_service.dart';
import 'package:MONO29/core/utils/log.dart';
import 'package:MONO29/features/prnews/data/models/prnews_response_model.dart';

class PrnewsDataSource {
  final ApiService apiService;

  PrnewsDataSource(this.apiService);

  Future<dynamic> fetchPenews({Map<String, dynamic>? body}) async {
    final json = await apiService.post(ApiEndpoints.prNews, body: body);

    if (json is Map<String, dynamic>) {
      return PrNewsResponseModel.fromJson(json);
    } else {
      printLog('Unexpected JSON format: $json');
    }
  }
}
