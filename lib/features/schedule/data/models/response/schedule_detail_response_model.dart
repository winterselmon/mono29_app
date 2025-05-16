import 'package:json_annotation/json_annotation.dart';

part 'schedule_detail_response_model.g.dart';

@JsonSerializable()
class ScheduleDetailResponseModel {
  bool? status;
  String? message;
  Data? data;

  ScheduleDetailResponseModel({this.status, this.message, this.data});

  ScheduleDetailResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? postId;
  String? title;
  String? thumbnail;
  String? onair;
  String? description;

  Data({this.postId, this.title, this.thumbnail, this.onair, this.description});

  Data.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    onair = json['onair'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['post_id'] = postId;
    data['title'] = title;
    data['thumbnail'] = thumbnail;
    data['onair'] = onair;
    data['description'] = description;
    return data;
  }
}
