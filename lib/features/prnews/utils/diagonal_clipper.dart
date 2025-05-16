
import 'package:flutter/material.dart';

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double cut = 20.0;

    Path path = Path();
    path.moveTo(0, cut); // ซ้ายล่างตัดขึ้นไป
    path.lineTo(cut, 0); // เฉียงไปด้านบนซ้าย

    path.lineTo(size.width - cut, 0); // ขอบบนเกือบสุดขวา
    path.lineTo(size.width, cut); // ขวาล่างตัดขึ้นไปเฉียง

    path.lineTo(size.width, size.height); // ขอบขวาล่าง
    path.lineTo(0, size.height); // กลับมาซ้ายล่าง
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class LeftAngleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class RightAngleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(20, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
