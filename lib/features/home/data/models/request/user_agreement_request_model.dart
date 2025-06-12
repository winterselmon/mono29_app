import 'package:json_annotation/json_annotation.dart';

part 'user_agreement_request_model.g.dart';

@JsonSerializable()
class UserAgreementRequestModel {
  String? udid;

  UserAgreementRequestModel({this.udid});

  UserAgreementRequestModel.fromJson(Map<String, dynamic> json) {
    udid = json['udid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['udid'] = udid;
    return data;
  }
}
