import 'package:json_annotation/json_annotation.dart';

part 'video_stream_response_model.g.dart';

@JsonSerializable()
class VideoStreamResponse {
  bool? status;
  String? message;
  Data? data;

  VideoStreamResponse({this.status, this.message, this.data});

  VideoStreamResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Hls? hls;
  List<dynamic>? drm;
  Googleima? googleima;

  Data({this.hls, this.drm, this.googleima});

  Data.fromJson(Map<String, dynamic> json) {
    hls = json['hls'] != null ? Hls.fromJson(json['hls']) : null;
    drm = json['drm'];
    googleima = json['googleima'] != null
        ? Googleima.fromJson(json['googleima'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (hls != null) {
      data['hls'] = hls!.toJson();
    }
    if (drm != null) {
      data['drm'] = drm!.map((v) => v?.toJson()).toList();
    }
    if (googleima != null) {
      data['googleima'] = googleima!.toJson();
    }
    return data;
  }
}

class Hls {
  String? tH;
  String? eN;

  Hls({this.tH, this.eN});

  Hls.fromJson(Map<String, dynamic> json) {
    tH = json['TH'];
    eN = json['EN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['TH'] = tH;
    data['EN'] = eN;
    return data;
  }
}

class Googleima {
  String? ios;
  String? android;
  int? delayNextAds;
  int? mustWatchAds;

  Googleima({this.ios, this.android, this.delayNextAds, this.mustWatchAds});

  Googleima.fromJson(Map<String, dynamic> json) {
    ios = json['ios'];
    android = json['android'];
    delayNextAds = json['delay_next_ads'];
    mustWatchAds = json['must_watch_ads'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ios'] = ios;
    data['android'] = android;
    data['delay_next_ads'] = delayNextAds;
    data['must_watch_ads'] = mustWatchAds;
    return data;
  }
}
