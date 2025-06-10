// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rerun_yt_highlight_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RerunYtHighlightResponseModel _$RerunYtHighlightResponseModelFromJson(
        Map<String, dynamic> json) =>
    RerunYtHighlightResponseModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: RerunYtHighlightData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RerunYtHighlightResponseModelToJson(
        RerunYtHighlightResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

RerunYtHighlightData _$RerunYtHighlightDataFromJson(
        Map<String, dynamic> json) =>
    RerunYtHighlightData(
      mono29: RerunYtCategory.fromJson(json['mono29'] as Map<String, dynamic>),
      mononews:
          RerunYtCategory.fromJson(json['mononews'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RerunYtHighlightDataToJson(
        RerunYtHighlightData instance) =>
    <String, dynamic>{
      'mono29': instance.mono29,
      'mononews': instance.mononews,
    };

RerunYtCategory _$RerunYtCategoryFromJson(Map<String, dynamic> json) =>
    RerunYtCategory(
      ytShorts: (json['yt_shorts'] as List<dynamic>)
          .map((e) => RerunYtVideo.fromJson(e as Map<String, dynamic>))
          .toList(),
      ytVideos: (json['yt_videos'] as List<dynamic>)
          .map((e) => RerunYtVideo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RerunYtCategoryToJson(RerunYtCategory instance) =>
    <String, dynamic>{
      'yt_shorts': instance.ytShorts,
      'yt_videos': instance.ytVideos,
    };

RerunYtVideo _$RerunYtVideoFromJson(Map<String, dynamic> json) => RerunYtVideo(
      videoId: json['videoId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      thumbnails: json['thumbnails'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$RerunYtVideoToJson(RerunYtVideo instance) =>
    <String, dynamic>{
      'videoId': instance.videoId,
      'title': instance.title,
      'description': instance.description,
      'thumbnails': instance.thumbnails,
      'url': instance.url,
    };
