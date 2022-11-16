import 'package:flutter/widgets.dart';

import 'user_model.dart';

class Post {
  final int id;
  final User user;
  final String caption;
  final String timeAgo;
  final String imageUrl;
  final int likes;
  final int comments;
  final int shares;
  final int postType;
  final double discountPercentage;
  final double priceWithoutDiscount;
  final double priceWithDiscount;
  final bool hasAffiliate;
  final bool hasDiscount;

  const Post({
    required this.id,
    required this.user,
    required this.caption,
    required this.timeAgo,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.postType,
    required this.hasDiscount,
    required this.discountPercentage,
    required this.priceWithoutDiscount,
    required this.priceWithDiscount,
    required this.hasAffiliate,
  });
}