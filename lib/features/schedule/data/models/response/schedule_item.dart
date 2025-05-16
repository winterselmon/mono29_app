import 'package:json_annotation/json_annotation.dart';

part 'schedule_item.g.dart';

@JsonSerializable()
class ScheduleItem {
  final String id;
  final String dayNum;
  final String monthName;
  final String yearNum;
  final String dayOfTheWeek;
  final String startTime;
  final String endTime;
  final String startClock;
  final String endClock;

  @JsonKey(name: 'program_id')
  final String programId;

  final String description;

  @JsonKey(name: 'program_name')
  final String programName;

  @JsonKey(name: 'term_name')
  final String termName;

  final String excerpt;
  final String image;
  final String image2;

  ScheduleItem({
    required this.id,
    required this.dayNum,
    required this.monthName,
    required this.yearNum,
    required this.dayOfTheWeek,
    required this.startTime,
    required this.endTime,
    required this.startClock,
    required this.endClock,
    required this.programId,
    required this.description,
    required this.programName,
    required this.termName,
    required this.excerpt,
    required this.image,
    required this.image2,
  });

  factory ScheduleItem.fromJson(Map<String, dynamic> json) =>
      _$ScheduleItemFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleItemToJson(this);
}
