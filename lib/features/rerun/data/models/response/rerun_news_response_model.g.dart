// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rerun_news_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RerunNewsResposneModel _$RerunNewsResposneModelFromJson(
        Map<String, dynamic> json) =>
    RerunNewsResposneModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RerunNewsResposneModelToJson(
        RerunNewsResposneModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
