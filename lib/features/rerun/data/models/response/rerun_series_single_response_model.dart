import 'package:json_annotation/json_annotation.dart';

part 'rerun_series_single_response_model.g.dart';

@JsonSerializable()
class RerunSeriesSingleResponseModel {
  final bool status;
  final String message;
  final RerunSeriesData data;

  RerunSeriesSingleResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory RerunSeriesSingleResponseModel.fromJson(Map<String, dynamic> json) {
    return RerunSeriesSingleResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: RerunSeriesData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data.toJson(),
      };
}

class RerunSeriesData {
  final RerunSeriesVideo video;
  final List<RerunSeriesVideo> relatedEp;
  final List<RerunSeriesVideo> relatedOther;

  RerunSeriesData({
    required this.video,
    required this.relatedEp,
    required this.relatedOther,
  });

  factory RerunSeriesData.fromJson(Map<String, dynamic> json) {
    return RerunSeriesData(
      video: RerunSeriesVideo.fromJson(json['video']),
      relatedEp: List<RerunSeriesVideo>.from(
        (json['related_ep'] ?? []).map((x) => RerunSeriesVideo.fromJson(x)),
      ),
      relatedOther: List<RerunSeriesVideo>.from(
        (json['related_other'] ?? []).map((x) => RerunSeriesVideo.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        'video': video.toJson(),
        'related_ep': relatedEp.map((x) => x.toJson()).toList(),
        'related_other': relatedOther.map((x) => x.toJson()).toList(),
      };
}

class RerunSeriesVideo {
  final String id;
  final String title;
  final String thumbnail;
  final String htmlThumbnail;
  final String stream;
  final String streamAndroid;
  final bool drmAndroid;
  final String streamIos;
  final bool drmIos;

  RerunSeriesVideo({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.htmlThumbnail,
    required this.stream,
    required this.streamAndroid,
    required this.drmAndroid,
    required this.streamIos,
    required this.drmIos,
  });

  factory RerunSeriesVideo.fromJson(Map<String, dynamic> json) {
    return RerunSeriesVideo(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      htmlThumbnail: json['html_thumbnail'] ?? '',
      stream: json['stream'] ?? '',
      streamAndroid: json['stream_android'] ?? '',
      drmAndroid: json['drm_android'] ?? false,
      streamIos: json['stream_ios'] ?? '',
      drmIos: json['drm_ios'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'thumbnail': thumbnail,
        'html_thumbnail': htmlThumbnail,
        'stream': stream,
        'stream_android': streamAndroid,
        'drm_android': drmAndroid,
        'stream_ios': streamIos,
        'drm_ios': drmIos,
      };
}
