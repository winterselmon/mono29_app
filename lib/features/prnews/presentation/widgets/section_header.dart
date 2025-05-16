import 'package:MONO29/features/prnews/utils/diagonal_clipper.dart';
import 'package:MONO29/features/prnews/utils/section_enum.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final SectionHeaderStyle style;

  const SectionHeader({
    super.key,
    required this.icon,
    required this.title,
    this.style = SectionHeaderStyle.light,
  });

  @override
  Widget build(BuildContext context) {
    // Define style colors
    final isLight = style == SectionHeaderStyle.light;

    final backgroundColor = isLight ? Colors.grey.shade200 : Colors.black87;
    final iconBackgroundColor = isLight ? Colors.black87 : Colors.white;
    final iconColor = isLight ? Colors.orange : Colors.black87;
    final textColor = isLight ? Colors.black87 : Colors.white;

    return ClipPath(
      clipper: DiagonalClipper(),
      child: Container(
        color: Colors.orange,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          color: backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: iconBackgroundColor,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: Icon(icon, color: iconColor),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
