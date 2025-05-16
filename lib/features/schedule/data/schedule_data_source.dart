import 'package:MONO29/core/constants/api_endpoints.dart';
import 'package:MONO29/core/network/api_service.dart';
import 'package:MONO29/core/utils/log.dart';
import 'package:MONO29/features/schedule/data/models/response/schedule_detail_response_model.dart';
import 'package:MONO29/features/schedule/data/models/response/schedule_response_model.dart';

class ScheduleDataSource {
  final ApiService apiService;

  ScheduleDataSource(this.apiService);

  Future<dynamic> fetchSchedule({Map<String, dynamic>? body}) async {
    final json = await apiService.post(ApiEndpoints.schedule, body: body);

    if (json is Map<String, dynamic>) {
      return ScheduleResponseModel.fromJson(json);
    } else {
      printLog('Unexpected JSON format: $json');
    }
  }

  Future<dynamic> fetchScheduleDetail({Map<String, dynamic>? body}) async {
    final json = await apiService.post(ApiEndpoints.scheduleDetail, body: body);

    if (json is Map<String, dynamic>) {
      return ScheduleDetailResponseModel.fromJson(json);
    } else {
      printLog('Unexpected JSON format: $json');
    }
  }
}
