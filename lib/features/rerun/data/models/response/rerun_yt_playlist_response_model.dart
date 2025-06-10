import 'package:json_annotation/json_annotation.dart';

part 'rerun_yt_playlist_response_model.g.dart';

@JsonSerializable()
class RerunYtPlaylistResponseModel {
  bool? status;
  String? message;
  List<YtPlaylistData>? data;

  RerunYtPlaylistResponseModel({this.status, this.message, this.data});

  RerunYtPlaylistResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <YtPlaylistData>[];
      json['data'].forEach((v) {
        data!.add(YtPlaylistData.fromJson(v));
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

class YtPlaylistData {
  String? videoId;
  String? title;
  String? description;
  String? thumbnails;
  String? url;

  YtPlaylistData(
      {this.videoId, this.title, this.description, this.thumbnails, this.url});

  YtPlaylistData.fromJson(Map<String, dynamic> json) {
    videoId = json['videoId'];
    title = json['title'];
    description = json['description'];
    thumbnails = json['thumbnails'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['videoId'] = videoId;
    data['title'] = title;
    data['description'] = description;
    data['thumbnails'] = thumbnails;
    data['url'] = url;
    return data;
  }
}
