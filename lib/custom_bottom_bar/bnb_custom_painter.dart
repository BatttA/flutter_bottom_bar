import 'package:flutter/material.dart';

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final Path path = Path();
    path.moveTo(0, 0); // Start
    path.lineTo(size.width * .3, 0);
    path.quadraticBezierTo(
        size.width * .39, 0, size.width * .4, size.height * .5);
    path.quadraticBezierTo(
        size.width * .415, size.height, size.width * .5, size.height - 1);
    path.quadraticBezierTo(
        size.width * .585, size.height - 1, size.width * .59, size.height * .5);
    path.quadraticBezierTo(size.width * .6, 0, size.width * .7, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}