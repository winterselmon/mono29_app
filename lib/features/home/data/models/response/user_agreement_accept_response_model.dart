import 'package:json_annotation/json_annotation.dart';

part 'user_agreement_accept_response_model.g.dart';

@JsonSerializable()
class UserAgreementAcceptResponseModel {
  bool? status;
  String? message;

  UserAgreementAcceptResponseModel({this.status, this.message});

  UserAgreementAcceptResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
