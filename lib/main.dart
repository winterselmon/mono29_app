import 'package:MONO29/core/utils/app_preferences.dart';
import 'package:MONO29/core/utils/custom_behavior.dart';
import 'package:MONO29/core/utils/log.dart';
import 'package:MONO29/features/home/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    printLog("Error loading .env file: $e");
  }

  try {
    await AppPreferences.init();
  } catch (e) {
    printLog("Error initializing AppPreferences: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MONO29',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Kanit',
      ),
      scrollBehavior: CustomScrollBehavior(),
      home: const HomeScreen(),
      builder: EasyLoading.init(),
    );
  }
}
