import 'package:flutter/material.dart';
import 'package:yarsi/data/data.dart';

import 'discount_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: discounts.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final discount = discounts[index];
          return (DiscountCard(
            postImageUrl: discount.postImageUrl,
            discountCode: discount.discountCode,
            discountPercentage: discount.discountPercentage,
          ));
        });
  }
}
