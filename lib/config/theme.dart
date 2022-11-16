import 'package:flutter/material.dart';
import 'palette.dart';
import 'size_config.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Color.fromRGBO(240, 242, 250, 1.0),
    accentColor: Colors.orange,
    primarySwatch: Colors.orange,
    colorScheme: ColorScheme.light(
        primary: Color(0XFFDFBA70)
    ),
    fontFamily: "IRANSans",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {

  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: BorderSide(color: kTextColor),
    gapPadding: 12,
  );
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    //floatingLabelBehavior: FloatingLabelBehavior.never,
    //floatingLabelAlignment: FloatingLabelAlignment.start,
    contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 1.5),
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.brown, width: 1.5),
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    ),
    focusColor: Colors.white,
    border: outlineInputBorder,
    fillColor:  Color.fromRGBO(245, 246, 250, 1.0),
    filled: true,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Color(0xFF762C1F),
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ),
  );
}

final otpInputDecoration = InputDecoration(
  contentPadding:
  EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);
