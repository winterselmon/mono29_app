import 'package:json_annotation/json_annotation.dart';
import 'schedule_item.dart';

part 'schedule_data.g.dart';

@JsonSerializable()
class ScheduleData {
  @JsonKey(name: 'Sun')
  final DailySchedule? sun;
  @JsonKey(name: 'Mon')
  final DailySchedule? mon;
  @JsonKey(name: 'Tue')
  final DailySchedule? tue;
  @JsonKey(name: 'Wed')
  final DailySchedule? wed;
  @JsonKey(name: 'Thu')
  final DailySchedule? thu;
  @JsonKey(name: 'Fri')
  final DailySchedule? fri;
  @JsonKey(name: 'Sat')
  final DailySchedule? sat;

  ScheduleData({
    this.sun,
    this.mon,
    this.tue,
    this.wed,
    this.thu,
    this.fri,
    this.sat,
  });

  factory ScheduleData.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDataFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleDataToJson(this);
}

@JsonSerializable()
class DailySchedule {
  /// ดึงเฉพาะ 0-30 เพื่อรองรับ 31 วัน (index 0 ถึง 30)
  @JsonKey(defaultValue: [])
  final List<ScheduleItem?> items;

  final String headSchedule;
  final String indexDate;

  DailySchedule({
    required this.items,
    required this.headSchedule,
    required this.indexDate,
  });

  factory DailySchedule.fromJson(Map<String, dynamic> json) {
    final items = List<ScheduleItem?>.generate(
      31,
      (i) => json["$i"] != null ? ScheduleItem.fromJson(json["$i"]) : null,
    );
    return DailySchedule(
      items: items,
      headSchedule: json['head_schedule'] ?? '',
      indexDate: json['index_date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'head_schedule': headSchedule,
      'index_date': indexDate,
    };
    for (int i = 0; i < items.length; i++) {
      if (items[i] != null) {
        map['$i'] = items[i]!.toJson();
      }
    }
    return map;
  }
}
