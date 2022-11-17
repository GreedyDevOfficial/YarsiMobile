import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/screens/screens.dart';
import 'package:yarsi/widgets/widgets.dart';


class MainAppBar extends StatelessWidget {
  final Function() onTap;

  const MainAppBar({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 8,
                  offset: Offset(1, 2), // Shadow position
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    CircleButton(
                        icon: FontAwesomeIcons.coins,
                        iconSize: 22.0,
                        onPressed: () => {
                          Navigator.pushNamed(context, CoinsScreen.routeName, arguments: {
                            'title' : 'سکه ها'
                          })
                        }),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Text(
                        '125',
                        style: TextStyle(
                            fontSize: 8.0,
                            color: kPrimaryDarkColor,
                            fontWeight: FontWeight.w900),
                      ),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Material(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50.0),
                        onTap: () => {
                          Navigator.pushNamed(context, MessageScreen.routeName, arguments: {
                            'title' : 'پیام ها'
                          })
                        },
                        child: FaIcon(
                          FontAwesomeIcons.solidBell,
                          color: Palette.primaryDarkColor,
                          size: 20.0,
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: Container(
                          height: 7.0,
                          width: 7.0,
                          decoration: BoxDecoration(
                            color: Palette.notification,
                            shape: BoxShape.circle,
                            border: Border.all(width: 1.0, color: Colors.white),
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  width: 10.0,
                ),
                Stack(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(25.0),
                      onTap: () => {
                        Navigator.pushNamed(context, ChatScreen.routeName, arguments: {
                          'title' : 'چت با فروشگاه'
                        })
                      },
                      child: FaIcon(
                        FontAwesomeIcons.solidComment,
                        color: Palette.primaryDarkColor,
                        size: 20.0,
                      ),
                    ),
                    Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: Container(
                          height: 7.0,
                          width: 7.0,
                          decoration: BoxDecoration(
                            color: Palette.notification,
                            shape: BoxShape.circle,
                            border: Border.all(width: 1.0, color: Colors.white),
                          ),
                        ))
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: GestureDetector(
                        onTap: () => {
                          Scaffold.of(context).openEndDrawer()
                        },
                        child: SvgPicture.asset(
                          'assets/svg/yarsi_logo.svg',
                          matchTextDirection: false,
                          width: 35.0,
                          color: kPrimaryDarkColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
        )
    );
  }
}
