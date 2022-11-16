import 'package:flutter/material.dart';
import 'package:yarsi/widgets/widgets.dart';

import 'components/new_post_body.dart';


class NewPostScreen extends StatelessWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  static String routeName = "/new-post";

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
      body: NewPostBody(),
    );
  }
}
