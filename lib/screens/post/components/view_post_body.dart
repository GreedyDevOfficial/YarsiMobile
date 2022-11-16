import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/data/data.dart';
import 'package:yarsi/models/models.dart';
import 'package:yarsi/screens/post/components/post_comments.dart';
import 'package:yarsi/screens/post/components/post_header.dart';
import 'package:yarsi/screens/post/components/post_stats.dart';
import 'package:yarsi/widgets/widgets.dart';

import 'single_post_media.dart';

class ViewPostBody extends StatefulWidget {
  const ViewPostBody({Key? key}) : super(key: key);

  @override
  State<ViewPostBody> createState() => _ViewPostBodyState();
}

class _ViewPostBodyState extends State<ViewPostBody> {
  bool _isLiked = false;

  void _switchLike() {
    print('Like Switched');
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    var postType = [1,2,2,1,2];
    final _random = new Random();
    final Post post = posts[postType[_random.nextInt(postType.length)]];
    return Container(
      color: Palette.primaryLightBackground,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: PostHeader(
                post: post,
              ),
            ),
          ),
          SliverToBoxAdapter(child: PostComments(post: post,),),
          SliverToBoxAdapter(child: SinglePostMedia(post: post)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0 ),
              child: PostStats(
                key: UniqueKey(),
                post: post,
                shares: 10,
                visits: 25,
                Liked: _isLiked,
                onSwitchLike: (bool) {
                  _switchLike();
                },
                color: Palette.primaryLightBackground,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(comments[index].userName),
                      SizedBox(
                        width: 5.0,
                      ),
                      ProfileAvatar(
                        imageUrl: comments[index].profileUrl,
                        radius: 15.0,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.white),
                    child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            comments[index].description,
                            style: TextStyle(fontSize: 11.0),
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                )
              ],
            ));
          }, childCount: 3)),
        ],
      ),
    );
  }
}
