// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_stream_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoStreamResponse _$VideoStreamResponseFromJson(Map<String, dynamic> json) =>
    VideoStreamResponse(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: VideoStreamData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoStreamResponseToJson(
        VideoStreamResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

VideoStreamData _$VideoStreamDataFromJson(Map<String, dynamic> json) =>
    VideoStreamData(
      hls: _mapStreamUrlFromJson(json['hls'] as Map<String, dynamic>),
      drm: _mapDrmStreamFromJson(json['drm'] as Map<String, dynamic>),
      googleima: GoogleIma.fromJson(json['googleima'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoStreamDataToJson(VideoStreamData instance) =>
    <String, dynamic>{
      'hls': _mapStreamUrlToJson(instance.hls),
      'drm': _mapDrmStreamToJson(instance.drm),
      'googleima': instance.googleima,
    };

StreamUrl _$StreamUrlFromJson(Map<String, dynamic> json) => StreamUrl(
      url: json['url'] as String,
    );

Map<String, dynamic> _$StreamUrlToJson(StreamUrl instance) => <String, dynamic>{
      'url': instance.url,
    };

DrmStream _$DrmStreamFromJson(Map<String, dynamic> json) => DrmStream(
      url: json['url'] as String,
      proxy: json['proxy'] as String,
    );

Map<String, dynamic> _$DrmStreamToJson(DrmStream instance) => <String, dynamic>{
      'url': instance.url,
      'proxy': instance.proxy,
    };

GoogleIma _$GoogleImaFromJson(Map<String, dynamic> json) => GoogleIma(
      ios: json['ios'] as String,
      android: json['android'] as String,
      delayNextAds: (json['delay_next_ads'] as num).toInt(),
      mustWatchAds: (json['must_watch_ads'] as num).toInt(),
    );

Map<String, dynamic> _$GoogleImaToJson(GoogleIma instance) => <String, dynamic>{
      'ios': instance.ios,
      'android': instance.android,
      'delay_next_ads': instance.delayNextAds,
      'must_watch_ads': instance.mustWatchAds,
    };
