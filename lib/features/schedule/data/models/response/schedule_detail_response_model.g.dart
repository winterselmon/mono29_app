// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_detail_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleDetailResponseModel _$ScheduleDetailResponseModelFromJson(
        Map<String, dynamic> json) =>
    ScheduleDetailResponseModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScheduleDetailResponseModelToJson(
        ScheduleDetailResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
