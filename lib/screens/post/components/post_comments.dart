import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:yarsi/models/models.dart';

class PostComments extends StatelessWidget {
  final Post post;

  const PostComments({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ReadMoreText(
        post.caption,
        trimLines: 2,
        colorClickableText: Colors.pink,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'بیشتر',
        trimExpandedText: 'کمتر',
        moreStyle: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.bold),
        style: TextStyle(
            color: Colors.black,
            fontSize: 11.0,
            fontWeight: FontWeight.w400),
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
