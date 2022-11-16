import 'package:flutter/material.dart';

class LoginPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    Paint paint = Paint()
      ..color = Color(0xFFDFBA70).withOpacity(0.70)
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 0);
    path.lineTo(0, size.height - 40.0 );
    path.quadraticBezierTo(size.width / 3, size.height , size.width, (size.height  - 30.0));
    path.lineTo(size.width, 0.0);

    path.close();

    canvas.drawShadow(path, Colors.black45, 2, true);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}