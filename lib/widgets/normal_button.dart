import 'package:flutter/material.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/config/size_config.dart';

class NormalButton extends StatelessWidget {
  const NormalButton(
      {Key? key,
        this.text,
        this.press,
        this.width = 100.0,
        this.height = 40.0,
        this.textColor = const Color(0xFF762C1F),
        this.backgroundColor = const Color(0xFFDFBA70),
        this.borderRadius = 13,
        this.borderWidth = 0,
        this.borderColor = Colors.transparent,
        this.fontWeight = FontWeight.w800,
        this.fontSize = 12,
      })
      : super(key: key);

  final String? text;
  final Function? press;
  final double width;
  final double height;
  final double borderRadius;
  final double borderWidth;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final FontWeight fontWeight;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(width),
      height: getProportionateScreenHeight(height),
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: borderColor, width: borderWidth)  ,
          ),
          primary: kPrimaryDarkColor,
          backgroundColor: backgroundColor.withOpacity(0.5),
        ),
        onPressed: press as void Function()?,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Text(
            text!,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
