import 'package:flutter/material.dart';
import 'package:yarsi/data/data.dart';
import 'package:yarsi/models/models.dart';

import 'repost_card.dart';

class ProfileRepostList extends StatelessWidget {
  const ProfileRepostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.5,
          ),
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              final Post post = posts[index];
              return RePostCard(post, context);
            },
            childCount: posts.length,
          )
      )
    ]);
  }
}
