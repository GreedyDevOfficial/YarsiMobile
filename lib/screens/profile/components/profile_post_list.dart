import 'package:flutter/material.dart';
import 'package:yarsi/data/data.dart';
import 'package:yarsi/models/models.dart';

import 'new_post_card.dart';
import 'post_card.dart';

class ProfilePostList extends StatelessWidget {
  const ProfilePostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool isStore = true;
    return CustomScrollView(slivers: [
      isStore ?  SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.5,
          ),
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              if (index == 0)
                return NewPostCard();
              else {
                final Post post = posts[index];
                return PostCard(post, context);
              }
            },
            childCount: posts.length,
          )
      ) : SliverToBoxAdapter(
          child: Center(
            child: Text('قابلیت پست گذاری فعلا برای فروشگاه فعال می باشد'),
          )
      )
    ]);
  }
}
