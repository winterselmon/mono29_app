// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rerun_yt_news_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RerunYtNewsResponseModel _$RerunYtNewsResponseModelFromJson(
        Map<String, dynamic> json) =>
    RerunYtNewsResponseModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PlaylistData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RerunYtNewsResponseModelToJson(
        RerunYtNewsResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
