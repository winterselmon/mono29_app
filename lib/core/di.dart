import 'analytics/injection.dart';

Future<void> setupLocator() async {
  registerAnalyticsService();

  // ถ้ามี repo / bloc / service อื่น ๆ ก็ register ที่นี่
}
