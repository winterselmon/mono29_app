// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleItem _$ScheduleItemFromJson(Map<String, dynamic> json) => ScheduleItem(
      id: json['id'] as String,
      dayNum: json['dayNum'] as String,
      monthName: json['monthName'] as String,
      yearNum: json['yearNum'] as String,
      dayOfTheWeek: json['dayOfTheWeek'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      startClock: json['startClock'] as String,
      endClock: json['endClock'] as String,
      programId: json['program_id'] as String,
      description: json['description'] as String,
      programName: json['program_name'] as String,
      termName: json['term_name'] as String,
      excerpt: json['excerpt'] as String,
      image: json['image'] as String,
      image2: json['image2'] as String,
    );

Map<String, dynamic> _$ScheduleItemToJson(ScheduleItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dayNum': instance.dayNum,
      'monthName': instance.monthName,
      'yearNum': instance.yearNum,
      'dayOfTheWeek': instance.dayOfTheWeek,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'startClock': instance.startClock,
      'endClock': instance.endClock,
      'program_id': instance.programId,
      'description': instance.description,
      'program_name': instance.programName,
      'term_name': instance.termName,
      'excerpt': instance.excerpt,
      'image': instance.image,
      'image2': instance.image2,
    };
