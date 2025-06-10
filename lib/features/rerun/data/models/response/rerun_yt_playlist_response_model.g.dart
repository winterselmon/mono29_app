// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rerun_yt_playlist_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RerunYtPlaylistResponseModel _$RerunYtPlaylistResponseModelFromJson(
        Map<String, dynamic> json) =>
    RerunYtPlaylistResponseModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => YtPlaylistData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RerunYtPlaylistResponseModelToJson(
        RerunYtPlaylistResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
