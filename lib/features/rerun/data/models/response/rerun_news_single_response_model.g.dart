// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rerun_news_single_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RerunNewsSingleResponseModel _$RerunNewsSingleResponseModelFromJson(
        Map<String, dynamic> json) =>
    RerunNewsSingleResponseModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: RerunNewsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RerunNewsSingleResponseModelToJson(
        RerunNewsSingleResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
