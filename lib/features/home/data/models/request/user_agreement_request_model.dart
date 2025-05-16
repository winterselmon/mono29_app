import 'package:json_annotation/json_annotation.dart';

part 'user_agreement_request_model.g.dart';

@JsonSerializable()
class UserAgreementRequestModel {
  String? uuid;

  UserAgreementRequestModel({this.uuid});

  UserAgreementRequestModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    return data;
  }
}
