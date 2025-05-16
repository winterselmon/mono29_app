import 'package:json_annotation/json_annotation.dart';

part 'user_agreement_accept_request_model.g.dart';

@JsonSerializable()
class UserAgreementAcceptRequestModel {
  String? uuid;

  UserAgreementAcceptRequestModel({this.uuid});

  UserAgreementAcceptRequestModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    return data;
  }
}
