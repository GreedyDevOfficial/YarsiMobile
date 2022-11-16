import 'package:flutter/material.dart';

class DashedDivider extends StatelessWidget {
  const DashedDivider(
      {Key? key,
        this.height = 1,
        this.color = Colors.black,
        this.hpadding = 40.0,
        this.dashWidth = 2.0})
      : super(key: key);
  final double height;
  final Color color;
  final double hpadding;
  final double dashWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hpadding),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxWidth = constraints.constrainWidth();
          final dashHeight = height;
          final dashCount = (boxWidth / (2 * dashWidth)).floor();
          return Flex(
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: color),
                ),
              );
            }),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
          );
        },
      ),
    );
  }
}
