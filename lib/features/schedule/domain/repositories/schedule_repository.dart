import 'package:MONO29/features/schedule/data/models/response/schedule_detail_response_model.dart';
import 'package:MONO29/features/schedule/data/models/response/schedule_response_model.dart';

abstract class ScheduleRepository {
  Future<ScheduleResponseModel> fetchSchedule();

  Future<ScheduleDetailResponseModel> fetchScheduleDetail(
      {Map<String, dynamic> body});

  // Future<RerunNewsResposneModel> fetchRerunNews();
}
