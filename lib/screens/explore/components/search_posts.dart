import 'package:flutter/material.dart';
import 'package:yarsi/data/data.dart';
import 'package:yarsi/models/models.dart';
import 'search_post_card.dart';

class SearchPosts extends StatelessWidget {
  const SearchPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(slivers: [
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
              return SearchPostCard(post, context);
            },
            childCount: posts.length,
          )
      )
    ]);
  }
}
