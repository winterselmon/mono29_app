import 'package:json_annotation/json_annotation.dart';

part 'schedule_request.mode.g.dart';

@JsonSerializable()
class ScheduleRequestModel {
  String? udid;

  ScheduleRequestModel({this.udid});

  ScheduleRequestModel.fromJson(Map<String, dynamic> json) {
    udid = json['udid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['udid'] = udid;
    return data;
  }
}
