import 'package:flutter/material.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/widgets/widgets.dart';

class ExploreTitle extends StatelessWidget {

  final String categoryTitle;

  const ExploreTitle({Key? key, required this.categoryTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(categoryTitle, style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w700, color: Palette.primaryDarkColor),),
      ],
    );
  }
}
Widget filter_options(BuildContext context) => Column(
  children: [
    BottomModalOption(
        label: 'زیر گروه یک',
        onTap: () => {}),
    DashedDivider(
      height: 1.0,
      color: Colors.grey,
    ),
    BottomModalOption(
      label: 'زیرگروه دو',
      onTap: () => {},
    ),
    DashedDivider(
      height: 1.0,
      color: Colors.grey,
    ),
    BottomModalOption(
      label: 'زیرگروه سه',
      onTap: () => {},
    ),
    DashedDivider(
      height: 1.0,
      color: Colors.grey,
    ),
    BottomModalOption(
      label: 'زیرگروه چهار',
      onTap: () => {},
    ),
    DashedDivider(
      height: 1.0,
      color: Colors.grey,
    ),
    BottomModalOption(
      label: 'زیرگروه پنج',
      onTap: () => {},
    ),
  ],
);
