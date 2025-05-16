import 'package:flutter/material.dart';

class GradientUnderlineTabIndicator extends Decoration {
  final Gradient gradient;
  final double strokeWidth;

  const GradientUnderlineTabIndicator({
    required this.gradient,
    this.strokeWidth = 4.0,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _GradientUnderlinePainter(this, onChanged);
  }
}

class _GradientUnderlinePainter extends BoxPainter {
  final GradientUnderlineTabIndicator decoration;

  _GradientUnderlinePainter(this.decoration, VoidCallback? onChanged)
      : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint()
      ..shader = decoration.gradient.createShader(
        Rect.fromLTWH(
          offset.dx,
          configuration.size!.height - decoration.strokeWidth,
          configuration.size!.width,
          decoration.strokeWidth,
        ),
      )
      ..style = PaintingStyle.fill;

    final Rect rect = Rect.fromLTWH(
      offset.dx,
      configuration.size!.height - decoration.strokeWidth,
      configuration.size!.width,
      decoration.strokeWidth,
    );

    canvas.drawRect(rect, paint);
  }
}
