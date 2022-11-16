import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/models/models.dart';

Widget SearchPersonCard(User user, BuildContext context) {
  return InkWell(
    borderRadius: BorderRadius.circular(10),
    onTap: () =>{
      //Navigator.pushNamed(context, ViewPostScreen.routeName, arguments: {
      //  'title': 'مشاهده پست'
      //})
    },
    child: Card(
      semanticContainer: true,
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
                  color: Colors.white10
              ),
              child: ClipRRect(borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                          child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(user.bio, maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 10.0),)
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius:  20.0,
                              backgroundColor: Colors.grey[200],
                              backgroundImage: CachedNetworkImageProvider(user.imageUrl),
                            ),
                            Center(
                              child: Text(user.name, style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w700),),
                            )
                          ],
                        ),
                      )

                    ],
                  ),
                )
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
