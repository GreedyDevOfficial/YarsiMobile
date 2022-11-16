import 'package:flutter/material.dart';
import 'package:yarsi/config/palette.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isButtonIndicator;

  const CustomTabBar(
      {Key? key,
        required this.icons,
        required this.selectedIndex,
        required this.onTap,
        this.isButtonIndicator = false}
      )
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
          border: isButtonIndicator ? Border(
              bottom: BorderSide(
                  color: Palette.primaryDarkColor
              )
          ) :
          Border(
              top: BorderSide(
                width: 5.0,
                color: Palette.primaryLightColor,
              )

          )
      ),
      tabs: icons
          .asMap()
          .map(
            (i, e) => MapEntry(
            i,
            Tab(
                icon: Icon(
                  e,
                  color: i == selectedIndex
                      ? Palette.primaryDarkColor
                      : Colors.black45,
                  size: 30.0,
                ))),
      )
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
