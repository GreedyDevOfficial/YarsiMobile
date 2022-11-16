import 'package:flutter/material.dart';
import 'package:yarsi/config/size_config.dart';
import 'package:yarsi/screens/screens.dart';
import 'package:yarsi/widgets/dialog/dialogs/dialogs.dart';
import 'package:yarsi/widgets/widgets.dart';


class BottomModalUpgradeAccount extends StatelessWidget {
  const BottomModalUpgradeAccount({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: 180,
      child: Column(
        children: [
          Container(
            height: 40.0,
            child: Stack(children: [
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      fontSize: 13.0),
                ),
              )
            ]),
          ),
          DashedDivider(
            height: 1.0,
            color: Colors.grey,
            hpadding: 20.0,
          ),
          SizedBox(height: 25.0,),
          Container(
            alignment: Alignment.center,
            child: NormalButton(
              text: "ارتقاء به فروشگاه",
              press: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, UpgradeScreen.routeName, arguments: {
                  'title' : 'ارتقاء به فروشگاه'
                });
              },
              width: SizeConfig.screenWidth / 1.5,
              height: 50.0,
            ),
          ),
          SizedBox(height: 25.0,),
          Container(
            alignment: Alignment.center,
            child: NormalButton(
              text: "ارتقاء به بازارچه",
              press: () {
                Navigator.pop(context);
                FailDialog(context, 'ارتقاء به بازارچه فعلا امکان پذیر نمی باشد');
              },
              width: SizeConfig.screenWidth / 1.5,
              height: 50.0,
            ),
          ),
        ],
      ),
    );
  }
}
