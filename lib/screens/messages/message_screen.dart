import 'package:flutter/material.dart';
import 'package:yarsi/widgets/widgets.dart';

import 'components/message_list.dart';

class MessageScreen extends StatelessWidget {

  static String routeName = "/messages";

  const MessageScreen({Key? key}) : super(key: key);

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
      body: MessageList(),
    );
  }
}
