// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rerun_series_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RerunSeriesResposneModel _$RerunSeriesResposneModelFromJson(
        Map<String, dynamic> json) =>
    RerunSeriesResposneModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RerunSeriesResposneModelToJson(
        RerunSeriesResposneModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
