import 'dart:async';
import 'dart:io';

import 'package:MONO29/core/analytics/analytics_service.dart';
import 'package:MONO29/core/analytics/injection.dart';
import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/core/services/nielsen_bridge.dart';
import 'package:MONO29/core/services/nielsen_config.dart';
import 'package:MONO29/core/utils/function_widgets.dart';
import 'package:MONO29/core/utils/log.dart';
import 'package:MONO29/features/live/presentation/widgets/live_app_bar.dart';
import 'package:byteark_player_flutter/data/byteark_player_config.dart';
import 'package:byteark_player_flutter/data/byteark_player_item.dart';
import 'package:byteark_player_flutter/data/byteark_player_license_key.dart';
import 'package:byteark_player_flutter/domain/byteark_player_listener.dart';
import 'package:byteark_player_flutter/presentation/byteark_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:better_player_plus/better_player_plus.dart';

import 'package:MONO29/core/network/api_service.dart';
import 'package:MONO29/features/live/bloc/live_bloc.dart';
import 'package:MONO29/features/live/data/live_data_source.dart';
import 'package:MONO29/features/live/data/live_repository_impl.dart';
import 'package:MONO29/features/live/presentation/widgets/live_controls_row.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LiveScreen extends StatefulWidget {
  final VoidCallback onBack;
  const LiveScreen({required this.onBack, super.key});

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> with WidgetsBindingObserver {
  final ApiService apiService = ApiService();

  BetterPlayerController? _controller;

  // เก็บ selected lang/quality ไว้ที่นี่
  String selectedLanguage = 'TH';
  String selectedQuality = '240P';

  String liveUrlTH = '', liveUrlEN = '';

  // Declare required variables
  late ByteArkPlayerItem _item;
  late ByteArkPlayerConfig _config;
  late ByteArkPlayerListener _listener;
  late ByteArkPlayer _player;

  late Key _playerKey; // เพิ่ม key
  final analytics = getIt<AnalyticsService>();

  Timer? _playheadTimer; // ✅ สำหรับส่ง setPlayheadPosition
  bool _isPlaying = false;
  bool _isInAd = false;
  bool _sessionStarted = false;

  @override
  void initState() {
    super.initState();

    if (_controller != null) {
      _controller!.dispose();
      _controller = null;
    }
    WidgetsBinding.instance.addObserver(this);

    // ✅ init Nielsen SDK
    NielsenBridge.init(
      Platform.isAndroid ? NielsenConfig.appIdAndroid : NielsenConfig.appIdIos,
    );

    analytics.logScreenView('live');
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    _stopPlayheadTimer();
    NielsenBridge.stop();
    NielsenBridge.end(); // ✅ ปิด Nielsen

    // Clean up player instance.
    _player.dispose();

    if (_controller != null) {
      _controller!.dispose();
      _controller = null;
    }

    super.dispose();
  }

  void _startPlayheadTimer() {
    _stopPlayheadTimer(); // 🔒 ปิดของเก่าก่อนเสมอ

    // _playheadTimer?.cancel();
    _playheadTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      final ts = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      NielsenBridge.setPlayheadPosition(ts);
    });

    printLog("[Nielsen] Start playhead timer");
  }

  void _stopPlayheadTimer() {
    _playheadTimer?.cancel();
    _playheadTimer = null;
    printLog("[Nielsen] Stop playhead timer");
  }

  Future<void> _nielsenPlayContent() async {
    if (_isInAd) return;
    if (_sessionStarted) return;

    _sessionStarted = true;
    _isPlaying = true;

    debugPrint('[Nielsen] Play content (session start)');

    await NielsenBridge.play();
    await NielsenBridge.loadMetadata(_buildContentMetadata());
    _startPlayheadTimer();
  }

  Future<void> _nielsenResumeContent() async {
    if (_isInAd) return;
    if (_isPlaying) return; // กันยิงซ้ำ

    debugPrint('[Nielsen] Resume content');

    _isPlaying = true;

    await NielsenBridge.loadMetadata(
      _buildContentMetadata(),
    );

    _startPlayheadTimer();
  }

  Future<void> _nielsenPauseContent() async {
    if (!_isPlaying) return;

    _isPlaying = false;
    _stopPlayheadTimer();
    debugPrint("[Nielsen] Pause content");
    await NielsenBridge.stop();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      // App ปิด / จอ lock
      // await NielsenBridge.stop();
      // _stopPlayheadTimer();
      await _nielsenPauseContent();
    }

    if (state == AppLifecycleState.resumed) {
      // กลับเข้ามา
      // await NielsenBridge.play();

      // await NielsenBridge.loadMetadata(_buildContentMetadata());
      // _startPlayheadTimer();
      await _nielsenResumeContent();
    }
  }

  Map<String, String> _buildContentMetadata() {
    return {
      "assetid": "mono29-live",
      "type": "content",
      "isfullepisode": "y",
      "program": "Livestream",
      "title": "mono29-Livestream",
      "length": "86400",
      "segB": "Live",
      "segC": "",
      "vcid": "c01",
      "adloadtype": "2",
    };
  }

  Map<String, String> _buildPrerollMetadata() {
    return {
      "assetid": "ad-preroll",
      "type": "preroll",
      "title": "preroll-ad",
      "length": "30",
    };
  }

  initializePlayer(String url) {
    _playerKey = UniqueKey(); // สร้าง key ใหม่ทุกครั้ง

    // Step 1: Create a listener to handle player and ad events
    _listener = ByteArkPlayerListener(
      onPlayerReady: () async {
        debugPrint("[PLAYER] READY");

        // await NielsenBridge.play();

        // await NielsenBridge.loadMetadata(_buildContentMetadata());

        // _startPlayheadTimer();
        await _nielsenPlayContent();
      },
      onPlaybackPause: () async {
        debugPrint("[PLAYER] PAUSE");
        if (_isInAd) return;
        await _nielsenPauseContent();
      },
      onPlaybackPlay: () async {
        debugPrint("[PLAYER] PLAY");
        if (_isInAd) return;
        await _nielsenResumeContent();
      },
      onAdsStart: (data) async {
        debugPrint("[AD] START Data: ${data.toMap()}");
        _isInAd = true;

        await _nielsenPauseContent(); // stop content

        // await NielsenBridge.stop(); // stop content
        // _stopPlayheadTimer();

        await NielsenBridge.play();

        await NielsenBridge.loadMetadata(_buildPrerollMetadata());

        _startPlayheadTimer();
      },
      onAdsCompleted: (data) async {
        debugPrint("[AD] COMPLETED Data: ${data.toMap()}");
        _isInAd = false;

        _stopPlayheadTimer();
        await NielsenBridge.stop(); // stop ad

        await _nielsenResumeContent(); // ✅ สำคัญ

        // await NielsenBridge.play(); // play content ก่อน
        // await NielsenBridge.loadMetadata(_buildContentMetadata());
        // _startPlayheadTimer(); // resume content tracking
      },
    );

    // Step 2: Define the video source using ByteArkPlayerItem
    _item = ByteArkPlayerItem(
      url: url,
    );

    // Step 3: Configure the player using ByteArkPlayerConfig
    _config = ByteArkPlayerConfig(
      settingButton: false,
      seekButtons: false,
      fullScreenButton: true,

      // Optional : Set up ads if needed.
      // adsSettings: ByteArkAdsSettings(
      //   adTagUrl:
      //       'https://pubads.g.doubleclick.net/gampad/live/ads?sz=640x480&iu=/10983686/Mono29/Mono29(App)_Preroll(Live)/Mono29(App)_Pre(Live)_Android&impl=s&gdfp_req=1&env=vp&output=vast&unviewed_position_start=1&url=[referrer_url]&description_url=[description_url]&correlator=&cust_params=video_channel%3Dmono29&msid=com.monobroadcast.mono29',
      //   // adTagUrl:
      //   //     'https://pubads.g.doubleclick.net/gampad/ads?iu=/21775744923/external/single_ad_samples&sz=640x480&cust_params=sample_ct%3Dlinear&ciu_szs=300x250%2C728x90&gdfp_req=1&output=vast&unviewed_position_start=1&env=vp&impl=s&correlator='
      // ),
      licenseKey: ByteArkPlayerLicenseKey(
        // android:
        //     "E5BDB0-11C1F9-D0EA1A-4A2516-D4657B-V3", // Replace with your Android license key
        // iOS:
        //     "96284B-4A7F9E-E3F4C3-364271-BF13B6-V3", // Replace with your iOS license key
        android: dotenv.env['LICENSEKEY_ANDROID'] ?? '',
        iOS: dotenv.env['LICENSEKEY_IOS'] ?? '',
      ),

      playerItem: _item,
    );

    // Step 4: Initialize the ByteArkPlayer with the config and listener
    _player = ByteArkPlayer(
      key: _playerKey,
      playerConfig: _config,
      listener: _listener,
    );
  }

  Future<void> reloadPlayer() async {
    EasyLoading.show();

    await _nielsenPauseContent(); // 🔴 สำคัญ
    _sessionStarted = false; // 🔴 สำคัญ
    _isInAd = false;
    // 1. Dispose player เก่า
    _player.dispose();

    printLog(liveUrlTH);
    printLog(liveUrlEN);

    // 2. เลือก URL ตามภาษา
    final url = selectedLanguage == 'TH' ? liveUrlTH : liveUrlEN;

    // 3. Delay เพื่อให้แน่ใจว่า dispose แล้ว
    await Future.delayed(const Duration(milliseconds: 300));

    // 4. สร้าง player ใหม่
    setState(() {
      initializePlayer(url);
    });

    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LiveBloc(LiveRepositoryImpl(LiveDataSource(apiService)))
            ..add(FetchLiveStream()),
      child: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          _controller?.dispose();
        },
        child: Scaffold(
          backgroundColor: AppColors.appBarHightLight,
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: LiveAppBar(title: 'ดูทีวีสด'),
          ),
          body: BlocListener<LiveBloc, LiveState>(
            listener: (context, state) {
              if (state is LiveLoaded) {
                String url = '', adsUrl = '';
                printLog(
                    'Live URL (TH): ${state.videoStreamResponse.data!.hls!.tH}');
                printLog(
                    'Live URL (EN): ${state.videoStreamResponse.data!.hls!.eN}');

                liveUrlTH = state.videoStreamResponse.data!.hls!.tH ?? '';
                liveUrlEN = state.videoStreamResponse.data!.hls!.eN ?? '';

                if (selectedLanguage == 'TH') {
                  url = liveUrlTH;
                } else {
                  url = liveUrlEN;
                }

                if (Platform.isAndroid) {
                  adsUrl =
                      state.videoStreamResponse.data!.googleima!.android ?? '';
                } else {
                  adsUrl = state.videoStreamResponse.data!.googleima!.ios ?? '';
                }

                initializePlayer(url);
              }
            },
            child: BlocBuilder<LiveBloc, LiveState>(
              builder: (context, state) {
                if (state is LiveLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is LiveError) {
                  return Center(child: Text(''));
                } else if (state is LiveLoaded) {
                  return Column(
                    children: [
                      // Controls
                      LiveControlsRow(
                        onBack: () {
                          _controller?.dispose();
                          _player.dispose();
                          Navigator.pop(context);
                          widget.onBack();
                        },
                        onReplay: () async {
                          analytics.logEvent('live_replay');
                          await reloadPlayer();
                        },
                        selectedLanguage: selectedLanguage,
                        // selectedQuality: selectedQuality,
                        onLanguageChanged: (lang) async {
                          printLog("Change language to: $lang");
                          analytics
                              .logEvent('change_live_language', parameters: {
                            'language': lang,
                          });
                          setState(() {
                            selectedLanguage = lang;
                          });

                          await reloadPlayer();
                        },
                      ),
                      addVerticalSpace(60),
                      // Video Player
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        // child: BetterPlayer(controller: _controller!),
                        child: _player,
                      ),
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
