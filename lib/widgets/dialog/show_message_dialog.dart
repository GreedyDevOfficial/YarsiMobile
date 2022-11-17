import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/widgets/widgets.dart';

class ShowMessageDialog extends StatelessWidget {
  const ShowMessageDialog({Key? key,  this.backgroundColor = Palette.primaryLightBackground, required this.title, this.height = 350, required this.message, required this.dateTime}) : super(key: key);

  final Color backgroundColor;
  final String title;
  final String message;
  final String dateTime;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Container(
              height: height,
              child: Column(
                children: [
                  Container(
                    height: 40.0,
                    child: Stack(children: [
                      Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                              splashRadius: 15.0,
                              onPressed: () => {Navigator.of(context).pop()},
                              icon: Icon(FontAwesomeIcons.close))),
                      Center(
                        child: Text(
                          'مشاهده پیام',
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
                  ShowMessage(title, message, dateTime)
                ],
              ),
            ),
          ),
        )
    );
  }

}
