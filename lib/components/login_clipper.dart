import 'package:flutter/material.dart';

class LoginClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    Path path = Path()..moveTo(0, 0);
    print('Height::::=${size.height}');
    print('Width::::=${size.width}');

    path.lineTo(0, size.height - 40.0 );
    path.quadraticBezierTo(size.width / 3, size.height , size.width, (size.height  - 30.0));
    path.lineTo(size.width, 0.0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}