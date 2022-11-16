import 'package:flutter/material.dart';

import 'components/components.dart';

class ExploreScreen extends StatelessWidget {

  static String routeName = "/explore";

  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ExploreTopStores(),
          ExploreCategory(categoryTitle: 'مواد غذایی'),
          ExploreCategory(categoryTitle: 'پوشاک'),
          ExploreCategory(categoryTitle: 'خودرو'),
        ],
      ),
    );
  }

}