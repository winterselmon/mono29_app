import 'package:json_annotation/json_annotation.dart';
import 'schedule_data.dart';

part 'schedule_response_model.g.dart';

@JsonSerializable()
class ScheduleResponseModel {
  final bool status;
  final String message;
  final ScheduleData? data;

  ScheduleResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ScheduleResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleResponseModelToJson(this);
}
