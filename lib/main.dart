import 'dart:io';

import 'package:MONO29/core/di.dart';
import 'package:MONO29/core/services/nielsen_bridge.dart';
import 'package:MONO29/core/services/nielsen_config.dart';
import 'package:MONO29/core/utils/app_preferences.dart';
import 'package:MONO29/core/utils/custom_behavior.dart';
import 'package:MONO29/core/utils/log.dart';
import 'package:MONO29/features/home/presentation/screen/home_screen.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:firebase_core/firebase_core.dart';
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

  // try {
  //   // await NielsenBridge.init(NielsenConfig.appIdAndroid);
  //   if (Platform.isAndroid) {
  //     await NielsenBridge.init(NielsenConfig.appIdAndroid);
  //     printLog('Nielsen initialized for Android');
  //   } else if (Platform.isIOS) {
  //     await NielsenBridge.init(NielsenConfig.appIdIos);
  //   }
  // } catch (e) {
  //   printLog("Error NielsenBridge: $e");
  // }

  await Firebase.initializeApp();
  await setupLocator();

  runApp(const MyApp());
}

Future<void> initPlugin() async {
  await Future.delayed(const Duration(milliseconds: 1000));

  if (Platform.isIOS &&
      int.parse(Platform.operatingSystemVersion.split(' ')[1].split('.')[0]) >=
          14) {
    final TrackingStatus status =
        await AppTrackingTransparency.trackingAuthorizationStatus;

    if (status == TrackingStatus.notDetermined) {
      final newStatus =
          await AppTrackingTransparency.requestTrackingAuthorization();

      if (newStatus == TrackingStatus.authorized) {
        final uuid = await AppTrackingTransparency.getAdvertisingIdentifier();
        printLog("UUID: $uuid");
      } else {
        printLog("Tracking permission denied or restricted: $newStatus");
      }
    } else if (status == TrackingStatus.authorized) {
      final uuid = await AppTrackingTransparency.getAdvertisingIdentifier();
      printLog("UUID: $uuid");
    } else {
      printLog("Tracking permission denied or restricted: $status");
    }
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initPlugin();
    });
  }

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

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'MONO29',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//         fontFamily: 'Kanit',
//       ),
//       scrollBehavior: CustomScrollBehavior(),
//       home: const HomeScreen(),
//       builder: EasyLoading.init(),
//     );
//   }
// }
