import 'package:flutter/material.dart';
import 'package:yarsi/data/data.dart';
import 'package:yarsi/models/models.dart';

import 'message_card.dart';


class MessageList extends StatefulWidget {
  const MessageList({Key? key}) : super(key: key);

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: 20,),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final Message message = messagesList[index];
                  return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                      child: MessageCard(messageTitle: message.messageTitle, messageText: message.messageText, date: message.date, time: message.time)
                  );
                }, childCount: messagesList.length)
            )
          ],
        ),
      ),
    );
  }

}
