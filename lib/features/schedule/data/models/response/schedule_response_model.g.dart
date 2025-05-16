// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleResponseModel _$ScheduleResponseModelFromJson(
        Map<String, dynamic> json) =>
    ScheduleResponseModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : ScheduleData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScheduleResponseModelToJson(
        ScheduleResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
