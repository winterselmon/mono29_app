import 'package:flutter/material.dart';
import 'package:better_player_plus/better_player_plus.dart';

class LivePlayer extends StatelessWidget {
  final BetterPlayerController controller;

  const LivePlayer({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: BetterPlayer(controller: controller),
    );
  }
}
