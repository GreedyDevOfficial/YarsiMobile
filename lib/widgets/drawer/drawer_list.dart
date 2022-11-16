import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/screens/screens.dart';
import 'package:yarsi/widgets/widgets.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery
        .of(context)
        .size;
    return  Column(
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child: Container(
              height: screenSize.height - 200,
              child: ListView(
                children: [
                //  menuItem('سکه های من', FontAwesomeIcons.coins, CoinsScreen.routeName, "page", context),
                //  menuItem('کیف پول من', FontAwesomeIcons.wallet, WalletScreen.routeName, "page", context),
                //  menuItem('ثبت کد تخفیف', FontAwesomeIcons.luggageCart, RegisterDiscountScreen.routeName, "page", context),
                //  menuItem('درباره ما', FontAwesomeIcons.circleInfo, AboutUsScreen.routeName, "page", context),
                //  menuItem('سوالات متداول', FontAwesomeIcons.solidCircleQuestion, FaqScreen.routeName, "page", context),
                  // menuItem('حساب کاربری من', FontAwesomeIcons.unlock, ProfileScreen.routeName, "tab", context),
               //   menuItem('ارتقای حساب کاربری', FontAwesomeIcons.certificate, "", "modal", context),
               //   menuItem('لیست تخفیف ها', FontAwesomeIcons.ticket, DiscountsScreen.routeName, "page", context),
               //   menuItem('ارسال لینک دعوت', FontAwesomeIcons.solidCircleUp, "", "page", context),
                  menuItem('خروج از حساب کاربری', FontAwesomeIcons.powerOff, LoginScreen.routeName, "login", context),
                ],
              ),
            ))
      ],
    );
  }

  Widget menuItem(String title, IconData icon, String routeName, String type , BuildContext context) {
    return InkWell(
      highlightColor: Palette.primaryLightColor,
      child: (ListTile(
        trailing: FaIcon(
          icon,
          color: Palette.primaryDarkColor,
          size: 23.0,
        ),
        title: Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            )),
        onTap: () => {
          if (type == "page"){
            Navigator.pop(context),
            Navigator.pushNamed(context, routeName, arguments: {
              'title': title
            })
          }
          else if (type == "login") {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()))
          }
          else if (type == "modal"){
              Navigator.pop(context),
              showModalBottomSheet(
                  barrierColor: Colors.black.withOpacity(0.7),
                  enableDrag: false,
                  isDismissible: true,
                  isScrollControlled: false,
                  backgroundColor: Palette.primaryLightBackground,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15.0))),
                  context: context,
                  builder: (context) => BottomModalSelector(
                    child: BottomModalUpgradeAccount(title: 'ارتقاء حساب کاربری',),
                  )
              )
            }
        },
      )),
    );
  }
}
