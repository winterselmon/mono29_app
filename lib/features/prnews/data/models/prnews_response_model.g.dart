// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prnews_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrNewsResponseModel _$PrNewsResponseModelFromJson(Map<String, dynamic> json) =>
    PrNewsResponseModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrNewsResponseModelToJson(
        PrNewsResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
