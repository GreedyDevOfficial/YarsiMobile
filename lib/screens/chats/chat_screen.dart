import 'package:flutter/material.dart';
import 'package:yarsi/widgets/widgets.dart';

import 'components/chat_list.dart';

class ChatScreen extends StatelessWidget {

  static String routeName = "/chats";

  const ChatScreen({Key? key}) : super(key: key);

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
      body: ChatList(),
    );
  }
}
