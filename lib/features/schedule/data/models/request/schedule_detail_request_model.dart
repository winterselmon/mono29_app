import 'package:json_annotation/json_annotation.dart';

part 'schedule_detail_request_model.g.dart';

@JsonSerializable()
class ScheduleDetailRequestModel {
  String? postId;

  ScheduleDetailRequestModel({this.postId});

  ScheduleDetailRequestModel.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['post_id'] = postId;
    return data;
  }
}
