import 'package:json_annotation/json_annotation.dart';

part 'check_version_request_model.g.dart';

@JsonSerializable()
class CheckVersionRequestModel {
  String? os;
  String? version;

  CheckVersionRequestModel({this.os, this.version});

  CheckVersionRequestModel.fromJson(Map<String, dynamic> json) {
    os = json['os'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['os'] = os;
    data['version'] = version;
    return data;
  }
}
