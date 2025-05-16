import 'package:json_annotation/json_annotation.dart';

part 'rerun_news_single_request_model.g.dart';

@JsonSerializable()
class RerunNewsSingleRequestModel {
  String? playlistId;
  String? videoId;

  RerunNewsSingleRequestModel({this.playlistId, this.videoId});

  RerunNewsSingleRequestModel.fromJson(Map<String, dynamic> json) {
    playlistId = json['playlist_id'];
    videoId = json['video_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['playlist_id'] = playlistId;
    data['video_id'] = videoId;
    return data;
  }
}
