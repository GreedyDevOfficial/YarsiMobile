import 'package:flutter/material.dart';

import 'components/body.dart';

class NewPasswordScreen extends StatelessWidget {

  static String routeName = "new-password";

  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}