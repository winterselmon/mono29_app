import 'package:json_annotation/json_annotation.dart';

part 'check_version_response_model.g.dart';

@JsonSerializable()
class CheckVersionResponseModel {
  bool? status;
  String? message;
  String? url;

  CheckVersionResponseModel({this.status, this.message, this.url});

  CheckVersionResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['url'] = url;
    return data;
  }
}
