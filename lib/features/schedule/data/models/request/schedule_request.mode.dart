import 'package:json_annotation/json_annotation.dart';

part 'schedule_request.mode.g.dart';

@JsonSerializable()
class ScheduleRequestModel {
  String? uuid;

  ScheduleRequestModel({this.uuid});

  ScheduleRequestModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    return data;
  }
}
