// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rerun_highlight_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RerunHighlightResposneModel _$RerunHighlightResposneModelFromJson(
        Map<String, dynamic> json) =>
    RerunHighlightResposneModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RerunHighlightResposneModelToJson(
        RerunHighlightResposneModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
