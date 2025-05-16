import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/core/utils/function_widgets.dart';
import 'package:MONO29/core/utils/log.dart';
import 'package:MONO29/features/live/presentation/widgets/live_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:better_player_plus/better_player_plus.dart';

import 'package:MONO29/core/network/api_service.dart';
import 'package:MONO29/features/live/bloc/live_bloc.dart';
import 'package:MONO29/features/live/data/live_data_source.dart';
import 'package:MONO29/features/live/data/live_repository_impl.dart';
import 'package:MONO29/features/live/presentation/widgets/live_controls_row.dart';

class LiveScreen extends StatefulWidget {
  final VoidCallback onBack;
  const LiveScreen({required this.onBack, super.key});

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  final ApiService apiService = ApiService();

  BetterPlayerController? _controller;

  // เก็บ selected lang/quality ไว้ที่นี่
  String selectedLanguage = 'TH';
  String selectedQuality = '240P';

  @override
  void initState() {
    if (_controller != null) {
      _controller!.dispose();
      _controller = null;
    }
    super.initState();
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller!.dispose();
      _controller = null;
    }
    super.dispose();
  }

  Future<void> _initializePlayer(String url) async {
    if (_controller != null) {
      _controller!.dispose();
      _controller = null;
    }

    final dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      url,
      liveStream: true,
      videoFormat: BetterPlayerVideoFormat.hls,
    );

    _controller = BetterPlayerController(
      BetterPlayerConfiguration(
        aspectRatio: 16 / 9,
        autoDispose: true,
        autoPlay: true,
        handleLifecycle: true,
        controlsConfiguration: BetterPlayerControlsConfiguration(
          enablePlaybackSpeed: false,
        ),
      ),
      betterPlayerDataSource: dataSource,
    );

    setState(() {}); // รีเฟรช UI เพื่อแสดง player
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
                final lang = selectedLanguage;
                final quality = selectedQuality;

                final key = quality.replaceAll('P', '') + lang;
                final streamUrl =
                    state.videoStreamResponse.data.hls[key]?.url ?? '';
                    
                printLog(streamUrl);

                // เริ่ม player ใหม่ทุกครั้งที่ stream url เปลี่ยน
                _initializePlayer(streamUrl);
              }
            },
            child: BlocBuilder<LiveBloc, LiveState>(
              builder: (context, state) {
                if (state is LiveLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is LiveError) {
                  return Center(child: Text('Error: ${state.message}'));
                } else if (state is LiveLoaded) {
                  return Column(
                    children: [
                      // Controls
                      LiveControlsRow(
                        onBack: () {
                          _controller?.dispose();
                          Navigator.pop(context);
                          widget.onBack();
                        },
                        onReplay: () {
                          _controller?.seekTo(const Duration(seconds: 0));
                          _controller?.play();
                        },
                        selectedLanguage: selectedLanguage,
                        selectedQuality: selectedQuality,
                        onLanguageChanged: (lang) {
                          setState(() {
                            selectedLanguage = lang;
                          });
                          // บอก Bloc ด้วยถ้าต้องการ sync state
                          context.read<LiveBloc>().add(ChangeLanguage(lang));
                        },
                        onQualityChanged: (quality) {
                          setState(() {
                            selectedQuality = quality;
                          });
                          context.read<LiveBloc>().add(ChangeQuality(quality));
                        },
                      ),
                      addVerticalSpace(60),
                      // Video Player
                      if (_controller != null)
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: BetterPlayer(controller: _controller!),
                        )
                      else
                        const SizedBox(
                          height: 200,
                          child: Center(child: CircularProgressIndicator()),
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
