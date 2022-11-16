import 'package:flutter/material.dart';
import 'package:yarsi/data/data.dart';
import 'package:yarsi/models/models.dart';
import 'package:yarsi/widgets/widgets.dart';

class ExploreTopStores extends StatelessWidget {
  const ExploreTopStores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.0,
      width: double.infinity,
      color: Colors.white,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
            scrollDirection: Axis.horizontal,
            itemCount: suggestedStores.length,
            itemBuilder: (BuildContext context, int index) {
              final SuggestedStore store = suggestedStores[index];
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ProfileAvatar(
                      imageUrl: store.imageUrl,
                      isActive: true,
                    ),
                  ),
                  Text(store.name, style: TextStyle(fontSize: 8), overflow: TextOverflow.ellipsis,)
                ],
              );
            }
        ),
      ),
    );
  }
}
