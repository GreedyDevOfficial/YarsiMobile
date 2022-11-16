import 'package:flutter/material.dart';
import 'package:yarsi/data/data.dart';
import 'package:yarsi/models/models.dart';

import 'add_new_image_card.dart';
import 'galley_card.dart';

class NewPostImageGallery extends StatefulWidget {
  const NewPostImageGallery({Key? key}) : super(key: key);

  @override
  State<NewPostImageGallery> createState() => _NewPostImageGalleryState();
}

class _NewPostImageGalleryState extends State<NewPostImageGallery> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.5,
          ),
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              if (index == 0)
                return AddNewImageCard();
              else {
                final PostPhoto postPhoto = postPhotos[index];
                return GalleryCard(postPhoto, context);
              }
            },
            childCount: postPhotos.length,
          )
      )
    ]);
  }
}
