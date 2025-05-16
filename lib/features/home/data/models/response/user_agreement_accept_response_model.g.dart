// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_agreement_accept_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAgreementAcceptResponseModel _$UserAgreementAcceptResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserAgreementAcceptResponseModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$UserAgreementAcceptResponseModelToJson(
        UserAgreementAcceptResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
