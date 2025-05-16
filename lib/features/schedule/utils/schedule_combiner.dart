import 'package:MONO29/features/schedule/data/models/response/schedule_data.dart';
import 'package:MONO29/features/schedule/data/models/response/schedule_item.dart';
import 'package:MONO29/features/schedule/data/models/response/schedule_response_model.dart';
import 'package:intl/intl.dart';

// List<DailySchedule> getScheduleList(ScheduleResponseModel model) {
//   final List<DailySchedule> allScheduleByDay = [];

//   final scheduleData = model.data;

//   if (scheduleData != null) {
//     final allScheduleDay = [
//       scheduleData.sun,
//       scheduleData.mon,
//       scheduleData.tue,
//       scheduleData.wed,
//       scheduleData.thu,
//       scheduleData.fri,
//       scheduleData.sat,
//     ];

//     for (var day in allScheduleDay) {
//       if (day != null && day.items.isNotEmpty) {
//         allScheduleByDay.add(day);
//       }
//     }
//   }

//   return allScheduleByDay;
// }

String getCurrentDayKey() {
  // Example: "Sun", "Mon", ..., "Sat"
  return DateFormat('EEE').format(DateTime.now());
}

List<DailySchedule> getScheduleList(ScheduleResponseModel model) {
  final scheduleData = model.data;
  if (scheduleData == null) return [];

  final dayMap = {
    'Sun': scheduleData.sun,
    'Mon': scheduleData.mon,
    'Tue': scheduleData.tue,
    'Wed': scheduleData.wed,
    'Thu': scheduleData.thu,
    'Fri': scheduleData.fri,
    'Sat': scheduleData.sat,
  };

  const dayOrder = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  final currentDay = getCurrentDayKey();

  // จัดเรียงใหม่โดยให้ currentDay อยู่ด้านหน้า
  final reorderedDays = [
    ...dayOrder.skipWhile((day) => day != currentDay),
    ...dayOrder.takeWhile((day) => day != currentDay),
  ];

  final result = <DailySchedule>[];

  for (final day in reorderedDays) {
    final daily = dayMap[day];
    if (daily != null) {
      // ลบ null ออกจาก items
      final filteredItems = daily.items.whereType<ScheduleItem>().toList();
      if (filteredItems.isNotEmpty) {
        result.add(DailySchedule(
          items: filteredItems,
          headSchedule: daily.headSchedule,
          indexDate: daily.indexDate,
        ));
      }
    }
  }

  return result;
}

DailySchedule? getTodaySchedule(ScheduleData data) {
  final todayKey = getCurrentDayKey();

  switch (todayKey) {
    case 'Sun':
      return data.sun;
    case 'Mon':
      return data.mon;
    case 'Tue':
      return data.tue;
    case 'Wed':
      return data.wed;
    case 'Thu':
      return data.thu;
    case 'Fri':
      return data.fri;
    case 'Sat':
      return data.sat;
    default:
      return null;
  }
}

DateTime? parseClockTime(String timeStr, DateTime baseDate) {
  try {
    final parts = timeStr.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    return DateTime(baseDate.year, baseDate.month, baseDate.day, hour, minute);
  } catch (e) {
    return null;
  }
}

String getDayOfWeekFromDailySchedule(DailySchedule schedule) {
  // เช็คจาก headSchedule หรือเทียบกับ data list ก็ได้
  // สมมติใช้ headSchedule เช่น "วันจันทร์" → "Mon"
  if (schedule.headSchedule.contains("อาทิตย์")) return "Sun";
  if (schedule.headSchedule.contains("จันทร์")) return "Mon";
  if (schedule.headSchedule.contains("อังคาร")) return "Tue";
  if (schedule.headSchedule.contains("พุธ")) return "Wed";
  if (schedule.headSchedule.contains("พฤ")) return "Thu";
  if (schedule.headSchedule.contains("ศุกร์")) return "Fri";
  if (schedule.headSchedule.contains("เสาร์")) return "Sat";
  return "";
}

DateTime? parseThaiDate(String thaiDateStr) {
  try {
    final regex = RegExp(r'วัน(\S+)ที่\s+(\d+)\s+(\S+)\s+พ\.ศ\.(\d+)');
    final match = regex.firstMatch(thaiDateStr);
    if (match == null) return null;

    final day = int.parse(match.group(2)!);
    final monthName = match.group(3)!;
    final yearBE = int.parse(match.group(4)!);

    // แผนที่เดือนภาษาไทย -> เดือนเลข
    const thaiMonths = {
      'มกราคม': 1,
      'กุมภาพันธ์': 2,
      'มีนาคม': 3,
      'เมษายน': 4,
      'พฤษภาคม': 5,
      'มิถุนายน': 6,
      'กรกฎาคม': 7,
      'สิงหาคม': 8,
      'กันยายน': 9,
      'ตุลาคม': 10,
      'พฤศจิกายน': 11,
      'ธันวาคม': 12,
    };

    final month = thaiMonths[monthName];
    if (month == null) return null;

    final year = yearBE - 543;

    return DateTime(year, month, day);
  } catch (e) {
    return null;
  }
}
