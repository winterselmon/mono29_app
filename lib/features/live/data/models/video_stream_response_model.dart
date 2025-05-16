import 'package:json_annotation/json_annotation.dart';

part 'video_stream_response_model.g.dart';

@JsonSerializable()
class VideoStreamResponse {
  final bool status;
  final String message;
  final VideoStreamData data;

  VideoStreamResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory VideoStreamResponse.fromJson(Map<String, dynamic> json) =>
      _$VideoStreamResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VideoStreamResponseToJson(this);
}

@JsonSerializable()
class VideoStreamData {
  @JsonKey(
    fromJson: _mapStreamUrlFromJson,
    toJson: _mapStreamUrlToJson,
  )
  final Map<String, StreamUrl> hls;

  @JsonKey(
    fromJson: _mapDrmStreamFromJson,
    toJson: _mapDrmStreamToJson,
  )
  final Map<String, DrmStream> drm;

  final GoogleIma googleima;

  VideoStreamData({
    required this.hls,
    required this.drm,
    required this.googleima,
  });

  factory VideoStreamData.fromJson(Map<String, dynamic> json) =>
      _$VideoStreamDataFromJson(json);

  Map<String, dynamic> toJson() => _$VideoStreamDataToJson(this);
}

// ---------- Helper functions ----------
Map<String, StreamUrl> _mapStreamUrlFromJson(Map<String, dynamic> json) =>
    json.map((key, value) => MapEntry(key, StreamUrl.fromJson(value)));

Map<String, dynamic> _mapStreamUrlToJson(Map<String, StreamUrl> map) =>
    map.map((key, value) => MapEntry(key, value.toJson()));

Map<String, DrmStream> _mapDrmStreamFromJson(Map<String, dynamic> json) =>
    json.map((key, value) => MapEntry(key, DrmStream.fromJson(value)));

Map<String, dynamic> _mapDrmStreamToJson(Map<String, DrmStream> map) =>
    map.map((key, value) => MapEntry(key, value.toJson()));

// ---------- Other Models ----------

@JsonSerializable()
class StreamUrl {
  final String url;

  StreamUrl({required this.url});

  factory StreamUrl.fromJson(Map<String, dynamic> json) =>
      _$StreamUrlFromJson(json);

  Map<String, dynamic> toJson() => _$StreamUrlToJson(this);
}

@JsonSerializable()
class DrmStream {
  final String url;
  final String proxy;

  DrmStream({required this.url, required this.proxy});

  factory DrmStream.fromJson(Map<String, dynamic> json) =>
      _$DrmStreamFromJson(json);

  Map<String, dynamic> toJson() => _$DrmStreamToJson(this);
}

@JsonSerializable()
class GoogleIma {
  final String ios;
  final String android;

  @JsonKey(name: 'delay_next_ads')
  final int delayNextAds;

  @JsonKey(name: 'must_watch_ads')
  final int mustWatchAds;

  GoogleIma({
    required this.ios,
    required this.android,
    required this.delayNextAds,
    required this.mustWatchAds,
  });

  factory GoogleIma.fromJson(Map<String, dynamic> json) =>
      _$GoogleImaFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleImaToJson(this);
}
