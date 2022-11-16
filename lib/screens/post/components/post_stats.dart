import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yarsi/models/models.dart';
import 'package:yarsi/widgets/widgets.dart';

class PostStats extends StatelessWidget {
  final Post post;
  final int shares;
  final int visits;
  final bool Liked;
  final Color color;
  final Function(bool) onSwitchLike;

  const PostStats(
      {Key? key,
      required this.post,
      required this.shares,
      required this.visits,
      required this.Liked,
      required this.onSwitchLike,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '۳.۵ امتیاز',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 13.0,
                glow: false,
                itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                itemBuilder: (context, _) => Icon(
                  MdiIcons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
            Text(
              ' بازدید',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(
              width: 2.0,
            ),
            Text(
              '${post.comments}',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              'اشتراک گذاری',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(
              width: 4.0,
            ),
            Text(
              '${post.shares}',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
        const Divider(
          thickness: 1.0,
        ),
        Row(
          children: [
            _PostButton(
                icon: Icon(
                  Icons.headset_outlined,
                  color: Colors.black,
                  size: 20.0,
                ),
                label: '',
                color: color,
                onTap: () => showChatWithStoreDialog(context)),
            _PostButton(
                icon: Icon(
                  MdiIcons.commentOutline,
                  color: Colors.black,
                  size: 20.0,
                ),
                label: '3',
                color: color,
                onTap: () => print('3')),
            _PostButton(
                icon: Icon(
                  Liked ? Icons.favorite : Icons.favorite_outline,
                  color: Liked ? Colors.redAccent : Colors.black,
                  size: 25.0,
                ),
                label: '',
                color: color,
                onTap: () => {onSwitchLike(true)}),
            _PostButton(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                  size: 25.0,
                ),
                label: '3',
                color: color,
                onTap: () => print('Comment')),
            _PostButton(
                icon: Icon(
                  Icons.bookmark_outline,
                  color: Colors.black,
                  size: 25.0,
                ),
                label: '',
                color: color,
                onTap: () => {})
          ],
        ),
      ],
    );
  }
}
class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _PostButton(
      {Key? key, required this.icon, required this.label, required this.onTap, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Material(
          color: color,
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              height: 25.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  Text(
                    label,
                    style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w900),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

showChatWithStoreDialog(BuildContext context) {
  showDialog(
    builder: (context) => ShowCustomDialog(title: 'گفتگو با فروشنده', type: 'chat-with-store',),
    context: context,
    barrierDismissible: true,
  );
}