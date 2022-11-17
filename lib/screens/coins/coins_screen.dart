import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/widgets/widgets.dart';

import 'components/body.dart';


class CoinsScreen extends StatelessWidget {

  static String routeName = "/coins";

  const CoinsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  PreferredSize(
        preferredSize: Size(screenSize.width, 100.0),
        child: SingleAppBar(onTap: () =>  {
        },),
      ),
      floatingActionButton: SpeedDial(
        overlayOpacity: 0.6,
        overlayColor: Colors.black,
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Palette.primaryDarkColor,
        buttonSize: const Size(50.0, 50.0),
        childrenButtonSize: const Size(55.0, 55.0),
        children: [
          SpeedDialChild(
              backgroundColor: Palette.primaryLightColor,
              child: Icon(FontAwesomeIcons.exchangeAlt, color: Colors.white, size: 20.0,),
              label: 'تبدیل سکه به پول',
              labelStyle: TextStyle(fontSize: 8.0, fontWeight: FontWeight.w800),
              labelBackgroundColor: Palette.tablePrimary,
              onTap: () => { showExchangeCoinDialog(context)}
          ),
          SpeedDialChild(
              backgroundColor: Palette.primaryLightColor,
              child: Icon(FontAwesomeIcons.coins, color: Colors.white, size: 20.0,),
              label: 'انتقال سکه به دیگران',
              labelStyle: TextStyle(fontSize: 8.0, fontWeight: FontWeight.w800),
              labelBackgroundColor: Palette.tablePrimary,
              onTap: () => { showTransformCoinDialog(context)}
          ),
        ],
      ),
      body: Body(),
    );
  }
  showTransformCoinDialog(BuildContext context) {
    showDialog(
      builder: (context) => ShowCustomDialog(title: 'انتقال سکه به دیگران', type: 'transformCoin',),
      context: context,
      barrierDismissible: true,
    );
  }
  showExchangeCoinDialog(BuildContext context) {
    showDialog(
      builder: (context) => ShowCustomDialog(title: 'تبدیل سکه به پول', type: 'exchangeCoin',),
      context: context,
      barrierDismissible: true,
    );
  }
}
