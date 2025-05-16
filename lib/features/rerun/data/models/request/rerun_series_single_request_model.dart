
import 'package:json_annotation/json_annotation.dart';

part 'rerun_series_single_request_model.g.dart';

@JsonSerializable()
class RerunSeriesSingleRequestModel {
  String? playlistId;
  String? videoId;

  RerunSeriesSingleRequestModel({this.playlistId, this.videoId});

  RerunSeriesSingleRequestModel.fromJson(Map<String, dynamic> json) {
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
