import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/screens/screens.dart';
import 'package:yarsi/widgets/widgets.dart';

import 'components/body.dart';

class WalletScreen extends StatelessWidget {

  static String routeName = "/wallet";

  const WalletScreen({Key? key}) : super(key: key);

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
              child: Icon(FontAwesomeIcons.wallet, color: Colors.white, size: 20.0,),
              label: 'شارژ کیف پول',
              labelStyle: TextStyle(fontSize: 8.0, fontWeight: FontWeight.w800),
              labelBackgroundColor: Palette.tablePrimary,
              onTap: () => { showChargeWalletDialog(context)}
          ),
          SpeedDialChild(
              backgroundColor: Palette.primaryLightColor,
              child: Icon(FontAwesomeIcons.exchangeAlt, color: Colors.white, size: 20.0,),
              label: 'تبدیل پول به سکه',
              labelStyle: TextStyle(fontSize: 8.0, fontWeight: FontWeight.w800),
              labelBackgroundColor: Palette.tablePrimary,
              onTap: () => { showMoneyToCoinDialog(context) }
          ),
          SpeedDialChild(
              backgroundColor: Palette.primaryLightColor,
              child: Icon(FontAwesomeIcons.moneyBill, color: Colors.white, size: 20.0,),
              label: 'درخواست وجه',
              labelStyle: TextStyle(fontSize: 8.0, fontWeight: FontWeight.w800),
              labelBackgroundColor: Palette.tablePrimary,
              onTap: () => { showMoneyRequestDialog(context) }
          ),
          SpeedDialChild(
              backgroundColor: Palette.primaryLightColor,
              child: Icon(FontAwesomeIcons.creditCard, color: Colors.white, size: 20.0,),
              label: 'کارت های بانکی',
              labelStyle: TextStyle(fontSize: 8.0, fontWeight: FontWeight.w800),
              labelBackgroundColor: Palette.tablePrimary,
              onTap: () => {
                Navigator.pushNamed(context, DebitCards.routeName, arguments: {
                  'title': 'کارت های بانکی'
                })
              }
          ),
        ],
      ),
      body: Body(),
    );
  }
  showChargeWalletDialog(BuildContext context) {
    showDialog(
      builder: (context) => ShowCustomDialog(title: 'شارژ کیف پول', type: 'chargeWallet',),
      context: context,
      barrierDismissible: true,
    );
  }
  showMoneyToCoinDialog(BuildContext context) {
    showDialog(
      builder: (context) => ShowCustomDialog(title: 'تبدیل پول به سکه', type: 'moneyToCoin',),
      context: context,
      barrierDismissible: true,
    );
  }
  showMoneyRequestDialog(BuildContext context) {
    showDialog(
      builder: (context) => ShowCustomDialog(title: 'درخواست وجه', type: 'moneyRequest',),
      context: context,
      barrierDismissible: true,
    );
  }
}
