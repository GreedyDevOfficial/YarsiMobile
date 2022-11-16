import 'package:flutter/material.dart';
import 'package:yarsi/widgets/widgets.dart';

import 'components/post_media_body.dart';

class PostMediaScreen extends StatelessWidget {
  const PostMediaScreen({Key? key}) : super(key: key);

  static String routeName = "/post-media";


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
      body: PostMediaBody(),
    );
  }
}
