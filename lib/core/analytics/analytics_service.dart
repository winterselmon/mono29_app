import 'package:MONO29/core/utils/log.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  // Future<void> logEvent(String name, {Map<String, Object>? parameters}) async {
  //   await _analytics.logEvent(name: name, parameters: parameters);
  // }

  // Future<void> logScreenView(String screenName) async {
  //   await _analytics.logScreenView(screenName: screenName);
  // }
  logEvent(String name, {Map<String, Object>? parameters}) {
    printLog(name);
  }

  logScreenView(String screenName) {
    printLog(screenName);
  }
}
