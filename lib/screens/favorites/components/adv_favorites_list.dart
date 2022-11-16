import 'package:flutter/material.dart';
import 'package:yarsi/data/data.dart';
import 'package:yarsi/models/models.dart';

import 'favorite_card.dart';

class AdvFavoritesList extends StatefulWidget {
  const AdvFavoritesList({Key? key}) : super(key: key);

  @override
  State<AdvFavoritesList> createState() => _AdvFavoritesListState();

}

class _AdvFavoritesListState extends State<AdvFavoritesList> {
  @override
  void initState() {
    super.initState();
    setState(() {
      print('init State');
    });
  }
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final Post post = posts[index];
        return FavoriteCard(post, context);
      } ,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 1.5,
      ),
    );
  }
}
class ItemTile extends StatelessWidget {
  final int itemNo;

  const ItemTile(
      this.itemNo,
      );

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.primaries[itemNo % Colors.primaries.length];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: color.withOpacity(0.3),
        onTap: () {},
        leading: Container(
          width: 50,
          height: 30,
          color: color.withOpacity(0.5),
          child: Placeholder(
            color: color,
          ),
        ),
        title: Text(
          'Product $itemNo',
          key: Key('text_$itemNo'),
        ),
      ),
    );
  }
}
