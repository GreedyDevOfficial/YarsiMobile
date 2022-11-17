import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/data/data.dart';
import 'package:yarsi/models/models.dart';

import 'conversation_card.dart';

class ChatConversationList extends StatefulWidget {
  const ChatConversationList({Key? key}) : super(key: key);

  @override
  State<ChatConversationList> createState() => _ChatConversationListState();
}

class _ChatConversationListState extends State<ChatConversationList> {

  final messageController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery
        .of(context)
        .size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 70.0),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final Conversation conversation = conversationList[index];
                        return  ConversationCard(
                              conversationText: conversation.conversationText,
                              conversationName: conversation.conversationName,
                              profileImageUrl: conversation.profileImageUrl,
                              date: conversation.date,
                              time: conversation.time,
                              senderType: conversation.senderType
                            );
                      }, childCount: conversationList.length)
                  ),
                ],
              ),
            ),
                Positioned(
                    bottom: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: 60,
                            child: Icon(FontAwesomeIcons.telegram, size: 50, color: Palette.primaryDarkColor,)
                        ),
                        Container(
                          width: screenSize.width - 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 4,
                                offset: Offset(1, 2), // Shadow position
                              ),
                            ],
                          ),
                          child: buildTextFormField(
                              "nameFamily",
                              TextDirection.rtl,
                              "پیام خود را وارد کنید",
                              messageController),
                        ),

                      ],
                    )
                )
          ],
        ),
      ),
    );
  }
  TextFormField buildTextFormField(
      String field,
      TextDirection direction,
      String hintText,
      TextEditingController controller) {
    return TextFormField(
      keyboardType: TextInputType.text,
      autocorrect: false,
      textDirection: direction,
      controller: controller,
      textAlign: TextAlign.right,
      maxLines: 1,
      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
      style: const TextStyle(
          fontSize: 18.0,
          fontFamily: 'IRANSans',
          fontWeight: FontWeight.normal,
          height: 1.9),
      onChanged: (value) {},
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 14.0, color: Colors.black26, fontWeight: FontWeight.bold),
        focusColor: Colors.white,
        errorText: null,
        errorStyle: TextStyle(
          fontSize: 4.0,
        ),
        fillColor: Colors.white,
        prefixStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.brown, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
