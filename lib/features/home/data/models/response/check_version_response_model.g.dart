// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_version_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckVersionResponseModel _$CheckVersionResponseModelFromJson(
        Map<String, dynamic> json) =>
    CheckVersionResponseModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$CheckVersionResponseModelToJson(
        CheckVersionResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'url': instance.url,
    };
