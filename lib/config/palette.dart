import 'package:flutter/material.dart';


final kPrimaryLightColor = Color(0xFFDFBA70).withOpacity(0.5);
final kPrimaryDarkColor = Color(0xFF762C1F);
final kPrimaryBackgroundColor = Color(0xFFF5F6FA).withOpacity(1.0);

const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);


class Palette {
  static const Color scaffold = Color(0xFFF0F2F5);

  static const Color facebookBlue = Color(0xFF1777F2);

  static  Color accordionColor = Color(0XFFDFBA70).withOpacity(0.5);

  static const Color tablePrimary = Color(0xFFF1F3FC);
  static  Color tableWithdraw = Color(0xFFDA0001).withOpacity(0.2);
  static  Color tableDeposite = Color(0xFF7BC58C).withOpacity(0.2);


  static const Color primaryDarkColor = Color(0xFF762C1F);

  static const Color primaryLightColor = Color(0xFFDFBA70);

  static const Color primaryLightBackground = Color(0xFFF1F3FC);

  static const Color primarySuccessBackground = Color(0xFF7BC58C);

  static const Color primaryFailBackground = Color(0xFFEF6B6B);

  static const Color primaryBlockedCoinsColor = Color(0xFFA31515);

  static const Color primaryAvailableCoinsColor = Color(0xFF186028);

  static const LinearGradient createRoomGradient = LinearGradient(
    colors: [Color(0xFF496AE1), Color(0xFFCE48B1)],
  );

  static const Color online = Color(0xFF4BCB1F);
  static const Color notification = Colors.redAccent;

  static const LinearGradient storyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black26],
  );

}