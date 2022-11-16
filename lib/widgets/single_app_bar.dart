import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yarsi/config/palette.dart';

class SingleAppBar extends StatelessWidget {
  final Function() onTap;

  const SingleAppBar({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    //final arguments = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
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
                GestureDetector(
                  onTap: () => {
                    print('Back to main page'),
                    Navigator.pop(context)
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        child: Icon(Icons.arrow_back, color: Palette.primaryDarkColor,)
                    ),
                  ),
                ),
                Text(arguments['title'] , style: TextStyle(fontWeight: FontWeight.w800, color: Palette.primaryDarkColor),),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.pop(context)
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
