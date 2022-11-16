import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/models/models.dart';
import 'package:yarsi/screens/screens.dart';
import 'package:yarsi/widgets/widgets.dart';

Widget RePostCard(Post post, BuildContext context) {
  return InkWell(
    borderRadius: BorderRadius.circular(10),
    onTap: () =>{
      Navigator.pushNamed(context, ViewPostScreen.routeName, arguments: {
        'title': 'مشاهده پست'
      })
    },
    child: Card(
      color: Colors.blue[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Palette.primaryLightColor
              ),
              child: ClipRRect(borderRadius: BorderRadius.circular(10.0),
                child: CachedNetworkImage(
                  fit: BoxFit.fitWidth,
                  imageUrl: post.imageUrl,
                  progressIndicatorBuilder:
                      (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          ),
          Positioned(
              top: 6,
              right: 6,
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white38.withOpacity(0.6)),
              )
          ),
          Positioned(
            top: -5,
            right: -5,
            child: IconButton(
              color: Colors.blueGrey,
              splashRadius: 10.0,
              icon: Icon(FontAwesomeIcons.ellipsisVertical, size: 15, color: Palette.primaryDarkColor,),
              onPressed: () {
                showModalBottomSheet(
                  barrierColor: Colors.black.withOpacity(0.7),
                  enableDrag: false,
                  isDismissible: true,
                  isScrollControlled: false,
                  backgroundColor: Palette.primaryLightBackground,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))),
                  context: context,
                  builder: (context) => BottomModalSelector(
                    heightFactor: 0.3,
                    child: repost_options(context),
                  ),
                );
              },),
          ),

        ],
      ),
    ),
  );

}
Widget repost_options(BuildContext context) => SingleChildScrollView(
  child: Column(
    children: [
      BottomModalOption(
          label: 'حذف ری پست',
          onTap: () => {

          }),
    ],
  ),
);