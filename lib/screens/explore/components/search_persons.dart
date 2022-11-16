import 'package:flutter/material.dart';
import 'package:yarsi/data/data.dart';
import 'package:yarsi/models/models.dart';

import 'search_person_card.dart';

class SearchPersons extends StatelessWidget {
  const SearchPersons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(slivers: [
      SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              final User user = onlineUsers[index];
              return SearchPersonCard(user, context);
            },
            childCount: onlineUsers.length,
          )
      )
    ]);
  }
}
