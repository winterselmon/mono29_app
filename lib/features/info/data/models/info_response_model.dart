
import 'package:json_annotation/json_annotation.dart';

part 'info_response_model.g.dart';

@JsonSerializable()
class InfoResponseModel {
  bool? status;
  String? message;
  Data? data;

  InfoResponseModel({this.status, this.message, this.data});

  InfoResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? youtube;
  String? facebook;
  String? instagram;
  String? x;
  String? address;
  String? tel;
  String? fax;
  String? map;
  String? reportUrl;
  String? policyUrl;
  String? cookieUrl;
  String? userAgreement;

  Data(
      {this.youtube,
      this.facebook,
      this.instagram,
      this.x,
      this.address,
      this.tel,
      this.fax,
      this.map,
      this.reportUrl,
      this.policyUrl,
      this.cookieUrl,
      this.userAgreement});

  Data.fromJson(Map<String, dynamic> json) {
    youtube = json['youtube'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    x = json['x'];
    address = json['address'];
    tel = json['tel'];
    fax = json['fax'];
    map = json['map'];
    reportUrl = json['report_url'];
    policyUrl = json['policy_url'];
    cookieUrl = json['cookie_url'];
    userAgreement = json['user_agreement'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['youtube'] = youtube;
    data['facebook'] = facebook;
    data['instagram'] = instagram;
    data['x'] = x;
    data['address'] = address;
    data['tel'] = tel;
    data['fax'] = fax;
    data['map'] = map;
    data['report_url'] = reportUrl;
    data['policy_url'] = policyUrl;
    data['cookie_url'] = cookieUrl;
    data['user_agreement'] = userAgreement;
    return data;
  }
}
