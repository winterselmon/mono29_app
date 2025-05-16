import 'package:MONO29/features/schedule/data/models/response/schedule_detail_response_model.dart';
import 'package:MONO29/features/schedule/data/models/response/schedule_response_model.dart';
import 'package:MONO29/features/schedule/data/schedule_data_source.dart';
import 'package:MONO29/features/schedule/domain/repositories/schedule_repository.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  final ScheduleDataSource dataSource;

  ScheduleRepositoryImpl(this.dataSource);

  @override
  Future<ScheduleResponseModel> fetchSchedule() async {
    return await dataSource.fetchSchedule();
  }

  @override
  Future<ScheduleDetailResponseModel> fetchScheduleDetail(
      {Map<String, dynamic>? body}) async {
    return await dataSource.fetchScheduleDetail(body: body);
  }
}
