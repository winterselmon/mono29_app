// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'highlight_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HighlightResponseModel _$HighlightResponseModelFromJson(
        Map<String, dynamic> json) =>
    HighlightResponseModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => HighlightItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HighlightResponseModelToJson(
        HighlightResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

HighlightItem _$HighlightItemFromJson(Map<String, dynamic> json) =>
    HighlightItem(
      id: json['id'] as String?,
      title: json['title'] as String?,
      url: json['url'] as String?,
      thumbnail: json['thumbnail'] as String?,
      firstshow: json['firstshow'] as String?,
      created: json['created'] as String?,
      priority: json['priority'] as String?,
      mode: json['mode'] as String?,
    );

Map<String, dynamic> _$HighlightItemToJson(HighlightItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnail': instance.thumbnail,
      'firstshow': instance.firstshow,
      'created': instance.created,
      'priority': instance.priority,
      'mode': instance.mode,
    };
