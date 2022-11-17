import 'package:flutter/material.dart';
import 'package:yarsi/components/components.dart';
import 'package:yarsi/data/data.dart';
import 'package:yarsi/models/models.dart';

import 'components/suggested_store_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 7.0, bottom: 3.0, right: 15.0),
                    child: Text('کسب و کارهای پیشنهادی', style: TextStyle(fontSize: 11.0, color: Colors.black, fontWeight: FontWeight.w800),),
                  ),
                  Container(
                    height: 105.0,
                    color: Colors.white,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: suggestedStores.length,
                      reverse: true,
                      itemBuilder: (context, index) {
                        final suggestedStore = suggestedStores[index];
                        return SuggestedStoreCard(storeName: suggestedStore.name, storeImageUrl: suggestedStore.imageUrl);
                      },
                    ),
                  )
                ],
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final Post post = posts[index];
                  return HomePostContainer(post: post);
                }, childCount: posts.length)
            )
          ],
        ),
      ),
    );
  }
}
