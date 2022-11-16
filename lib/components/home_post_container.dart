import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart' as intl;
import 'package:lottie/lottie.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/models/models.dart';
import 'package:yarsi/screens/post/components/post_comments.dart';
import 'package:yarsi/screens/post/components/post_header.dart';
import 'package:yarsi/screens/post/components/post_stats.dart';
import 'package:yarsi/widgets/widgets.dart';

import '../screens/screens.dart';

class HomePostContainer extends StatefulWidget {
  final Post post;

  HomePostContainer({Key? key, required this.post}) : super(key: key);

  @override
  State<HomePostContainer> createState() => _HomePostContainerState();
}

class _HomePostContainerState extends State<HomePostContainer> {
  bool _isLiked = false;

  void _switchLike() {
    print('Like Switched');
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    intl.NumberFormat myFormat = intl.NumberFormat.decimalPattern('en_us');

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PostHeader(post: widget.post),
                SizedBox(
                  height: 4.0,
                ),
                PostComments(
                  post: widget.post,
                ),
                widget.post.imageUrl != null
                    ? const SizedBox.shrink()
                    : const SizedBox(
                  height: 6.0,
                )
              ],
            ),
          ),
          widget.post.imageUrl.length != 0
              ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: GestureDetector(
              onTap: () => {
                Navigator.pushNamed(context, ViewPostScreen.routeName,
                    arguments: {'title': 'مشاهده پست'})
              },
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.post.imageUrl,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                    // CircularProgressIndicator(
                    //     value: downloadProgress.progress),
                    Container(
                      width: double.infinity,
                      height: 220,
                      color: Colors.black12,
                      child: Lottie.asset('assets/json/loading.json'),
                    ),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error),
                  ),
                  Positioned(
                    top: 20.0,
                    child: Container(
                      width: 90,
                      height: 35,
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
                              widget.post.hasAffiliate
                                  ? FontAwesomeIcons.cubes
                                  : FontAwesomeIcons.cube,
                              size: 15.0,
                              color: Colors.white,
                            ),
                          ),
                          Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                myFormat.format(widget
                                    .post.priceWithoutDiscount) +
                                    'ت',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    decoration: widget.post.hasDiscount
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none),
                              ))
                        ],
                      ),
                    ),
                  ),
                  widget.post.hasDiscount
                      ? Positioned(
                    bottom: 20.0,
                    child: Container(
                      width: 90,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(7.0),
                              bottomRight: Radius.circular(7.0)),
                          color: Colors.black.withOpacity(0.5)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5.0),
                            child: Stack(
                              children: [
                                SvgPicture.asset(
                                    'assets/svg/discount_post.svg'),
                                Positioned(
                                    top: 10.0,
                                    right: 5.0,
                                    child: Text(
                                      myFormat.format(widget
                                          .post.discountPercentage),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0,
                                          fontWeight:
                                          FontWeight.w800),
                                    ))
                              ],
                            ),
                          ),
                          Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                myFormat.format(widget
                                    .post.priceWithDiscount) +
                                    'ت',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12),
                              ))
                        ],
                      ),
                    ),
                  )
                      : SizedBox.shrink()
                ],
              ),
            ),
          )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: PostStats(
              key: UniqueKey(),
              post: widget.post,
              shares: 10,
              visits: 25,
              Liked: _isLiked,
              onSwitchLike: (bool) {
                _switchLike();
              },
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

showRepostDialog(BuildContext context) {
  showDialog(
    builder: (context) => const ShowCustomDialog(
      title: 'ری پست',
      type: 'repost',
    ),
    context: context,
    barrierDismissible: true,
  );
}

showReportDialog(BuildContext context) {
  showDialog(
    builder: (context) => const ShowCustomDialog(
      title: 'گزارش تخلف',
      type: 'report',
    ),
    context: context,
    barrierDismissible: true,
  );
}

showDiscountCouponDialog(BuildContext context) {
  showDialog(
    builder: (context) => const ShowCustomDialog(
      title: 'دریافت کد تخفیف',
      type: 'coupon',
    ),
    context: context,
    barrierDismissible: true,
  );
}

showMessageDialog(BuildContext context) {
  showDialog(
    builder: (context) => const ShowCustomDialog(
      title: 'پیام شخصی',
      type: 'message',
    ),
    context: context,
    barrierDismissible: true,
  );
}
