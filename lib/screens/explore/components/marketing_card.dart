import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/models/models.dart';

import 'package:intl/intl.dart' as intl;
import 'package:yarsi/screens/screens.dart';
import 'package:yarsi/widgets/widgets.dart';


class MarketingCard extends StatelessWidget {
  final Post? post;

  const MarketingCard({Key? key, this.post}) : super(key: key);

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
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ) : Image.asset("assets/jpg/post_placeholder.jpg" , width: double.infinity, fit: BoxFit.cover,),
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
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 20.0,
            child: Container(
              width: 70,
              height: 25,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(7.0),
                      bottomRight: Radius.circular(7.0)),
                  color: Palette.primaryDarkColor),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0),
                    child: Icon(
                          post!.hasAffiliate
                          ? FontAwesomeIcons.cubes
                          : FontAwesomeIcons.cube,
                      size: 13.0,
                      color: Colors.white,
                    ),
                  ),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        myFormat.format(
                            post!.priceWithoutDiscount) +
                            'ت',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            decoration: post!.hasDiscount
                                ? TextDecoration.lineThrough
                                : TextDecoration.none),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
