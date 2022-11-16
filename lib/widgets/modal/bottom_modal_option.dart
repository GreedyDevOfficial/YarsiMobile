import 'package:flutter/material.dart';
import 'package:yarsi/config/palette.dart';

class BottomModalOption extends StatelessWidget {

  final String label;
  final VoidCallback onTap;

  const BottomModalOption({Key? key,required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Material(
        color: Palette.primaryLightBackground,
        child: InkWell(
            splashColor: Palette.primaryLightColor,
            onTap: onTap,
            child: Container(
              width: double.infinity,
              height: 45.0,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                child: Text(label, style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),),
              ),
            )
        ),
      ),
    );
  }
}