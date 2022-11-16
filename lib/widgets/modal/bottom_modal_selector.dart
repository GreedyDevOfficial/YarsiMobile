import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomModalSelector extends StatelessWidget {
  final Widget child;
  final double heightFactor;

  const BottomModalSelector({Key? key, required this.child, this.heightFactor = 0.75}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: heightFactor,
      child: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                  splashRadius: 15.0,
                  onPressed: () => {Navigator.of(context).pop()},
                  icon: Icon(FontAwesomeIcons.close)
              )
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 35),
              child: child
          ),
        ],
      ),
    );
  }

}
