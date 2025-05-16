import 'package:MONO29/core/constants/api_endpoints.dart';
import 'package:MONO29/core/network/api_service.dart';
import 'package:MONO29/core/utils/log.dart';
import 'package:MONO29/features/info/data/models/info_response_model.dart';

class InfoDataSource {
  final ApiService apiService;

  InfoDataSource(this.apiService);

  Future<dynamic> infoFeed({Map<String, dynamic>? body}) async {
    final json = await apiService.post(ApiEndpoints.infoFeed, body: body);

    if (json is Map<String, dynamic>) {
      return InfoResponseModel.fromJson(json);
    } else {
      printLog('Unexpected JSON format: $json');
    }
  }
}
