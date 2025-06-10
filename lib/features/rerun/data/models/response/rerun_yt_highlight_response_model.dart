import 'package:json_annotation/json_annotation.dart';

part 'rerun_yt_highlight_response_model.g.dart';

@JsonSerializable()
class RerunYtHighlightResponseModel {
  final bool status;
  final String message;
  final RerunYtHighlightData data;

  RerunYtHighlightResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory RerunYtHighlightResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RerunYtHighlightResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RerunYtHighlightResponseModelToJson(this);
}

@JsonSerializable()
class RerunYtHighlightData {
  final RerunYtCategory mono29;
  final RerunYtCategory mononews;

  RerunYtHighlightData({
    required this.mono29,
    required this.mononews,
  });

  factory RerunYtHighlightData.fromJson(Map<String, dynamic> json) =>
      _$RerunYtHighlightDataFromJson(json);

  Map<String, dynamic> toJson() => _$RerunYtHighlightDataToJson(this);
}

@JsonSerializable()
class RerunYtCategory {
  @JsonKey(name: 'yt_shorts')
  final List<RerunYtVideo> ytShorts;

  @JsonKey(name: 'yt_videos')
  final List<RerunYtVideo> ytVideos;

  RerunYtCategory({
    required this.ytShorts,
    required this.ytVideos,
  });

  factory RerunYtCategory.fromJson(Map<String, dynamic> json) =>
      _$RerunYtCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$RerunYtCategoryToJson(this);
}

@JsonSerializable()
class RerunYtVideo {
  final String videoId;
  final String title;
  final String description;
  final String thumbnails;
  final String url;

  RerunYtVideo({
    required this.videoId,
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.url,
  });

  factory RerunYtVideo.fromJson(Map<String, dynamic> json) =>
      _$RerunYtVideoFromJson(json);

  Map<String, dynamic> toJson() => _$RerunYtVideoToJson(this);
}
