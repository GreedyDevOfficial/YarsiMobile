import 'package:flutter/material.dart';
import 'components/body.dart';

class ForgetPasswordScreen extends StatelessWidget {

  static String routeName = "/forget-password";

  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}