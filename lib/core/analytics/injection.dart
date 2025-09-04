import 'package:get_it/get_it.dart';
import 'analytics_service.dart';

final getIt = GetIt.instance;

void registerAnalyticsService() {
  getIt.registerLazySingleton<AnalyticsService>(() => AnalyticsService());
}
