import 'package:json_annotation/json_annotation.dart';

part 'rerun_yt_news_response_model.g.dart';

@JsonSerializable()
class RerunYtNewsResponseModel {
  bool? status;
  String? message;
  List<PlaylistData>? data;

  RerunYtNewsResponseModel({this.status, this.message, this.data});

  RerunYtNewsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PlaylistData>[];
      json['data'].forEach((v) {
        data!.add(PlaylistData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlaylistData {
  String? id;
  String? playlistName;
  String? playlistId;
  String? thumbnailUrl;
  String? playlistActive;

  PlaylistData(
      {this.id,
      this.playlistName,
      this.playlistId,
      this.thumbnailUrl,
      this.playlistActive});

  PlaylistData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playlistName = json['playlist_name'];
    playlistId = json['playlist_id'];
    thumbnailUrl = json['thumbnail_url'];
    playlistActive = json['playlist_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['playlist_name'] = playlistName;
    data['playlist_id'] = playlistId;
    data['thumbnail_url'] = thumbnailUrl;
    data['playlist_active'] = playlistActive;
    return data;
  }
}
