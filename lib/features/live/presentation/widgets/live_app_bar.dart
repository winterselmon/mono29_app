import 'package:flutter/material.dart';
import 'package:MONO29/widgets/custom_app_bar.dart';

class LiveAppBar extends StatelessWidget {
  final String title;

  const LiveAppBar({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: title,
      currentIndex: 0,
    );
  }
}
