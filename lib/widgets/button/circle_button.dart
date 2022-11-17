import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yarsi/config/palette.dart';

class CircleButton extends StatelessWidget {

  final IconData icon;
  final double iconSize;
  final VoidCallback  onPressed;


  const CircleButton({
    Key? key,
    required this.icon,
    required this.iconSize,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 30.0,
        margin: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: FaIcon(icon),
          iconSize: iconSize,
          color: Palette.primaryLightColor,
          onPressed: onPressed,
        ),
      );
  }
}
