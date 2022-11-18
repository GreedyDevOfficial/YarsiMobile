import 'package:flutter/material.dart';
import 'package:yarsi/widgets/widgets.dart';

import 'components/body.dart';


class DiscountsScreen extends StatefulWidget {

  static String routeName = "/discounts";

  const DiscountsScreen({Key? key}) : super(key: key);

  @override
  State<DiscountsScreen> createState() => _DiscountsScreenState();
}

class _DiscountsScreenState extends State<DiscountsScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: Size(screenSize.width, 100.0),
        child: SingleAppBar(onTap: () =>  {
        },),
      ) ,
      body: Body(),
    );
  }
}
