import 'package:flutter/material.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/widgets/widgets.dart';

class ConversationCard extends StatelessWidget {
  final String conversationName;
  final String conversationText;
  final String profileImageUrl;
  final String date;
  final String time;
  final String senderType;

  const ConversationCard(
      {Key? key,
      required this.conversationName,
      required this.conversationText,
      required this.profileImageUrl,
      required this.date,
      required this.time,
      required this.senderType
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 10.0),
          child: Container(
              height: 70 ,
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
          ),
        ),
        this.senderType == 'user' ? Positioned(
            top: 7,
            left: 50,
            child: Text(this.date + '-' + this.time, style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: Colors.black),)
        ) : Positioned(
            top: 7,
            right: 50,
            child: Text(this.date + '-' + this.time, style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: Colors.black),)
        ),
        this.senderType == 'user' ? Positioned(
          top: 7,
            right: 50,
            child: Text(this.conversationName, style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: Colors.black),)
        ) : Positioned(
            top: 7,
            left: 50,
            child: Text(this.conversationName, style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: Colors.black),)
        ),
        this.senderType == 'user' ? Positioned(
          right: 5,
          top: 2,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white),
            height: 46,
            width: 46,
          ),
        ) : Positioned(
          left: 2,
          top: 0,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white),
            height: 46,
            width: 46,
          ),
        ),
        this.senderType == 'user' ? Positioned(
            right: -12,
            top: 5,
            width: 60,
            child: ProfileAvatar(
              imageUrl: this.profileImageUrl,
            )
        ) :Positioned(
            left: 5,
            top: 2,
            width: 60,
            child: ProfileAvatar(
              imageUrl: this.profileImageUrl,
            )
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 5.0),
            child: Text(this.conversationText, textDirection: TextDirection.rtl, style: TextStyle(fontSize: 11),),
          ),
        ),
      ],
    );
  }
}
