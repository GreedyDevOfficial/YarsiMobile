import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/widgets/widgets.dart';

class MessageCard extends StatelessWidget {
  final String messageTitle;
  final String messageText;
  final String date;
  final String time;

  const MessageCard(
      {Key? key,
        required this.messageTitle,
        required this.messageText,
        required this.date,
        required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane:  const ActionPane(
        extentRatio: 0.2,
        dragDismissible: false,
        motion: ScrollMotion(),
        children: [
          SizedBox(
            width: 10,
          ),
          SlidableAction(
            // An action can be bigger than the others.
            onPressed: doNothing,
            backgroundColor: Color(0XFFBE1931),
            foregroundColor: Colors.white,
            icon: FontAwesomeIcons.trash,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            label: 'حذف',
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () => {
          showMessageDialog(context)
        },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 4,
                  offset: Offset(1, 2), // Shadow position
                ),
              ],
            ),
            height: 70,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Positioned(
                  right: 15.0,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Palette.primaryLightBackground),
                    height: 55,
                    width: 55,
                  ),
                ),
                Positioned(
                  right: 17.0,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Palette.primaryLightColor.withOpacity(0.5)),
                    height: 50,
                    width: 50,
                  ),
                ),
                Positioned(
                    right: 30,
                    child: Icon(
                      FontAwesomeIcons.solidBell,
                      color: Palette.primaryDarkColor,
                    )),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 5.0, 70.0, 5.0),
                    child: Text(this.messageTitle, textDirection: TextDirection.rtl, style: TextStyle(fontSize: 11),),
                  ),
                ),
                Positioned(
                    left: 10.0,
                    bottom: 5,
                    child: Text(
                      this.date + '-' + this.time,
                      style: TextStyle(
                          fontSize: 9.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ))
              ],
            )),
      ),
    );
  }
  showMessageDialog(BuildContext context) {
    showDialog(
      builder: (context) => ShowMessageDialog(title: messageTitle, message: messageText, dateTime: date + '-' + time),
      context: context,
      barrierDismissible: true,
    );
  }
}

void doNothing(BuildContext context) {}
