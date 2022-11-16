import 'package:flutter/material.dart';
import 'package:yarsi/widgets/widgets.dart';

class UpgradeStepFour extends StatefulWidget {
  const UpgradeStepFour({Key? key}) : super(key: key);

  @override
  State<UpgradeStepFour> createState() => _UpgradeStepFourState();
}

class _UpgradeStepFourState extends State<UpgradeStepFour> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Container(
            alignment: Alignment.center,
            child: NormalButton(
              text: "ثبت درخواست",
              height: 50.0,
              press: () {

              },
            ),
          ),
        ),
      ),
    );
  }
}
