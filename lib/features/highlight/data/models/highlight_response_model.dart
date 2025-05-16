import 'package:json_annotation/json_annotation.dart';

part 'highlight_response_model.g.dart';

@JsonSerializable()
class HighlightResponseModel {
  @JsonKey(name: 'status')
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'data')
  final List<HighlightItem>? data;

  HighlightResponseModel({this.status, this.message, this.data});

  factory HighlightResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HighlightResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$HighlightResponseModelToJson(this);
}

@JsonSerializable()
class HighlightItem {
  final String? id;
  final String? title;
  final String? url;
  final String? thumbnail;
  final String? firstshow;
  final String? created;
  final String? priority;
  final String? mode;

  HighlightItem({
    this.id,
    this.title,
    this.url,
    this.thumbnail,
    this.firstshow,
    this.created,
    this.priority,
    this.mode,
  });

  factory HighlightItem.fromJson(Map<String, dynamic> json) =>
      _$HighlightItemFromJson(json);

  Map<String, dynamic> toJson() => _$HighlightItemToJson(this);
}
