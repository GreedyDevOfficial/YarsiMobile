import 'package:flutter/material.dart';
import 'package:yarsi/widgets/widgets.dart';


class SuggestedStoreCard extends StatelessWidget {

  final String storeName;
  final String storeImageUrl;

  const SuggestedStoreCard({Key? key, required this.storeName, required this.storeImageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: Container(
        width: 80,
        padding: EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Color(0xFFD9D9D9).withOpacity(0.2),
        ),
        child: Column(
          children: [
            ProfileAvatar(imageUrl: storeImageUrl),
            Text(storeName, style: TextStyle(fontSize: 8.0, color: Colors.black, fontWeight: FontWeight.w700),),
            SizedBox(height: 5.0,),
            NormalButton(
              text: 'دنبال کردن',
              fontSize: 8.0,
              width: 60,
              height: 33,
              borderRadius: 7.0,
              press: () => {

              },
            )
          ],
        ),
      ),
    );
  }
}

