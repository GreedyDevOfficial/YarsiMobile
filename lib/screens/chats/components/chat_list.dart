import 'package:flutter/material.dart';
import 'package:yarsi/data/data.dart';
import 'package:yarsi/models/models.dart';

import 'chat_card.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              final Chat chat = chatList[index];
              return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                  child: ChatCard(
                    lastChat: chat.lastChat,
                    storeName: chat.storeName,
                    storeImageUrl: chat.storeImageUrl,
                    date: chat.date,
                    time: chat.time,
                  ));
            }, childCount: chatList.length))
          ],
        ),
      ),
    );
  }
}
