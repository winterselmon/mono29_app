// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoResponseModel _$InfoResponseModelFromJson(Map<String, dynamic> json) =>
    InfoResponseModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InfoResponseModelToJson(InfoResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
