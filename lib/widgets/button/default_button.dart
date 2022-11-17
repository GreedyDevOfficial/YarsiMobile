import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/config/size_config.dart';


class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(250.0),
      height: getProportionateScreenHeight(75.0),
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: kPrimaryDarkColor,
          backgroundColor: kPrimaryLightColor,
        ),
        onPressed: press as void Function()?,
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: getProportionateScreenWidth(200.0),
              child: Text(
                text!,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  fontWeight: FontWeight.w500,
                  color: kPrimaryDarkColor,
                ),
              ),
            ),
            SvgPicture.asset(
              'assets/svg/default_buttom_sign.svg',
              height: 35.0,
              color: kPrimaryDarkColor,
            ),
          ],
        ),
      ),
    );
  }
}
