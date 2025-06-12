import 'package:json_annotation/json_annotation.dart';

part 'user_agreement_accept_request_model.g.dart';

@JsonSerializable()
class UserAgreementAcceptRequestModel {
  String? udid;

  UserAgreementAcceptRequestModel({this.udid});

  UserAgreementAcceptRequestModel.fromJson(Map<String, dynamic> json) {
    udid = json['udid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['udid'] = udid;
    return data;
  }
}
