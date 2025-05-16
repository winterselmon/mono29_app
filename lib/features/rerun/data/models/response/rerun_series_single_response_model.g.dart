// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rerun_series_single_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RerunSeriesSingleResponseModel _$RerunSeriesSingleResponseModelFromJson(
        Map<String, dynamic> json) =>
    RerunSeriesSingleResponseModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: RerunSeriesData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RerunSeriesSingleResponseModelToJson(
        RerunSeriesSingleResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
