// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_agreement_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAgreementResponseModel _$UserAgreementResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserAgreementResponseModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserAgreementResponseModelToJson(
        UserAgreementResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
