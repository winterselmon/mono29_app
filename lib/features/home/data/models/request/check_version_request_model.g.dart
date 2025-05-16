// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_version_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckVersionRequestModel _$CheckVersionRequestModelFromJson(
        Map<String, dynamic> json) =>
    CheckVersionRequestModel(
      os: json['os'] as String?,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$CheckVersionRequestModelToJson(
        CheckVersionRequestModel instance) =>
    <String, dynamic>{
      'os': instance.os,
      'version': instance.version,
    };
