import 'package:flutter/material.dart';
import 'package:yarsi/widgets/widgets.dart';

import 'components/view_post_body.dart';


class ViewPostScreen extends StatelessWidget {
  static String routeName = "/view-post";

  const ViewPostScreen({Key? key}) : super(key: key);

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
      body: ViewPostBody(),
    );
  }
}
