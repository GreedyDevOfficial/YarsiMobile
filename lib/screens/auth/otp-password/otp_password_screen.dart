import 'package:flutter/material.dart';

import 'components/body.dart';

class OTPPasswordScreen extends StatelessWidget {

  static String routeName = "/opt-password";

  const OTPPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
