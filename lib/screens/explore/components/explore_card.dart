import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yarsi/models/models.dart';
import 'package:yarsi/screens/screens.dart';
import 'package:yarsi/widgets/widgets.dart';
import 'package:intl/intl.dart' as intl;


class ExploreCard extends StatelessWidget {

  final Post? post;
  const ExploreCard({Key? key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    intl.NumberFormat myFormat = intl.NumberFormat.decimalPattern('en_us');

    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () =>{
        Navigator.pushNamed(context, ViewPostScreen.routeName, arguments: {
          'title': 'مشاهده پست'
        })
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: (post!.imageUrl != '') ?
            CachedNetworkImage(
              imageUrl: post!.imageUrl,
              width: 110.0,
              height: double.infinity,
              fit: BoxFit.cover,
            ) : Image.asset("assets/jpg/post_placeholder.jpg"),
          ),
          Positioned(
            top: 8.0,
            right: 8.0,
            child: ProfileAvatar(
              imageUrl: post!.user.imageUrl,
              hasBorder: false,
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                  color: Color(0xFF3B3B3B).withOpacity(0.7),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12))
              ),
              height: 35,
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      post!.user.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    Stack(
                      children: [
                        SvgPicture.asset(
                            'assets/svg/discount_post.svg', width: 20, height: 25,),
                        Positioned(
                            top: 8.0,
                            right: 5.0,
                            child: Text(
                              myFormat.format(post!.discountPercentage),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.0,
                                  fontWeight:
                                  FontWeight.w800),
                            )
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
