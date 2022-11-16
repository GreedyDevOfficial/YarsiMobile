import 'package:flutter/material.dart';

class CouponClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {


    Path path = Path()..moveTo(0, 20);

    path.quadraticBezierTo(0, 0 , 20, 0);
    path.lineTo(size.width - 20, 0.0);
    path.quadraticBezierTo(size.width, 0 , size.width, 20);
    path.lineTo(size.width , (size.height / 2) - 15);
    path.arcToPoint(
      Offset(size.width , (size.height / 2) + 15),
      clockwise: false,
      radius: Radius.circular(1),
    );
    path.lineTo(size.width , size.height - 20);
    path.quadraticBezierTo(size.width , size.height , size.width - 20, size.height);
    path.lineTo(20 , size.height );
    path.quadraticBezierTo(0 , size.height , 0, size.height - 20);
    path.lineTo(0 , (size.height / 2) + 15 );
    path.arcToPoint(
      Offset(0 , (size.height / 2) - 15),
      clockwise: false,
      radius: Radius.circular(1),
    );


    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
