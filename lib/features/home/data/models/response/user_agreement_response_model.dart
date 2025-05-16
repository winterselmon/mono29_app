
import 'package:json_annotation/json_annotation.dart';

part 'user_agreement_response_model.g.dart';

@JsonSerializable()
class UserAgreementResponseModel {
  bool? status;
  String? message;
  Data? data;

  UserAgreementResponseModel({this.status, this.message, this.data});

  UserAgreementResponseModel.fromJson(Map<String, dynamic> json) {
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
  bool? isShow;
  String? title;
  String? descriptionHtml;

  Data({this.isShow, this.title, this.descriptionHtml});

  Data.fromJson(Map<String, dynamic> json) {
    isShow = json['is_show'];
    title = json['title'];
    descriptionHtml = json['description_html'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_show'] = isShow;
    data['title'] = title;
    data['description_html'] = descriptionHtml;
    return data;
  }
}
