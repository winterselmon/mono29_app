import 'package:json_annotation/json_annotation.dart';

part 'rerun_yt_playlist_request_model.g.dart';

@JsonSerializable()
class RerunYtPlaylistRequestModel {
  String? playlistId;

  RerunYtPlaylistRequestModel({this.playlistId});

  RerunYtPlaylistRequestModel.fromJson(Map<String, dynamic> json) {
    playlistId = json['playlist_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['playlist_id'] = playlistId;
    return data;
  }
}
