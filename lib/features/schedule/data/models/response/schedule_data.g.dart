// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleData _$ScheduleDataFromJson(Map<String, dynamic> json) => ScheduleData(
      sun: json['Sun'] == null
          ? null
          : DailySchedule.fromJson(json['Sun'] as Map<String, dynamic>),
      mon: json['Mon'] == null
          ? null
          : DailySchedule.fromJson(json['Mon'] as Map<String, dynamic>),
      tue: json['Tue'] == null
          ? null
          : DailySchedule.fromJson(json['Tue'] as Map<String, dynamic>),
      wed: json['Wed'] == null
          ? null
          : DailySchedule.fromJson(json['Wed'] as Map<String, dynamic>),
      thu: json['Thu'] == null
          ? null
          : DailySchedule.fromJson(json['Thu'] as Map<String, dynamic>),
      fri: json['Fri'] == null
          ? null
          : DailySchedule.fromJson(json['Fri'] as Map<String, dynamic>),
      sat: json['Sat'] == null
          ? null
          : DailySchedule.fromJson(json['Sat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScheduleDataToJson(ScheduleData instance) =>
    <String, dynamic>{
      'Sun': instance.sun,
      'Mon': instance.mon,
      'Tue': instance.tue,
      'Wed': instance.wed,
      'Thu': instance.thu,
      'Fri': instance.fri,
      'Sat': instance.sat,
    };

DailySchedule _$DailyScheduleFromJson(Map<String, dynamic> json) =>
    DailySchedule(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : ScheduleItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      headSchedule: json['headSchedule'] as String,
      indexDate: json['indexDate'] as String,
    );

Map<String, dynamic> _$DailyScheduleToJson(DailySchedule instance) =>
    <String, dynamic>{
      'items': instance.items,
      'headSchedule': instance.headSchedule,
      'indexDate': instance.indexDate,
    };
