import 'package:flutter/material.dart';
import 'package:yarsi/widgets/widgets.dart';

import 'chat_conversation_list.dart';


class ChatConversationScreen extends StatelessWidget {

  static String routeName = "/chat-conversation";


  const ChatConversationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: Size(screenSize.width, 100.0),
        child: SingleAppBar(onTap: () =>  {
        },),
      ) ,
      body: ChatConversationList(),
    );
  }
}
