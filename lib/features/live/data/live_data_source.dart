import 'package:MONO29/core/constants/api_endpoints.dart';
import 'package:MONO29/core/network/api_service.dart';
import 'package:MONO29/core/utils/log.dart';
import 'package:MONO29/features/live/data/models/video_stream_response_model.dart';

class LiveDataSource {
  final ApiService _apiService;

  LiveDataSource(this._apiService);

  Future<dynamic> streamFeed({Map<String, dynamic>? body}) async {
    final json = await _apiService.post(ApiEndpoints.streamFeed, body: body);
    
    if (json is Map<String, dynamic>) {
      return VideoStreamResponse.fromJson(json);
    } else {
      printLog('Unexpected JSON format: $json');
    }
  }
}
