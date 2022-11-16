import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/models/models.dart';
import 'package:yarsi/screens/screens.dart';


Widget SearchPostCard(Post post, BuildContext context) {
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
          

        ],
      ),
    ),
  );
}