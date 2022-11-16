import 'package:flutter/material.dart';
import 'package:yarsi/data/data.dart';
import 'package:yarsi/models/models.dart';

import 'components.dart';
import 'explore_more_card.dart';

class ExploreCategory extends StatelessWidget {

  final String categoryTitle;

  const ExploreCategory({Key? key, required this.categoryTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: ExploreTitle(categoryTitle: categoryTitle),
          ),
        ),
        Container(
          height: 170,
          color: Colors.white70,
          child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 8.0
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount:  posts.length,
                    itemBuilder: (BuildContext context, int index){
                      final Post post = posts[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: index != posts.length - 1  ?  ExploreCard(post: post) : ExploreMoreCard() ,
                      );
                    },
                  ),
          ),
        )
      ],
    );
  }
}
