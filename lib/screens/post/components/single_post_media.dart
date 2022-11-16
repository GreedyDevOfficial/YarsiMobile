import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/models/models.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
];

class SinglePostMedia extends StatefulWidget {
  final Post post;

  const SinglePostMedia({Key? key, required this.post}) : super(key: key);

  @override
  State<SinglePostMedia> createState() => _SinglePostMediaState();
}

class _SinglePostMediaState extends State<SinglePostMedia> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    if (widget.post.postType == 1){
      _controller = VideoPlayerController.network(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
        ..initialize().then((_) {
          setState(() {
            _controller.play();
            _controller.setLooping(true);
          });
        });
    }

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                child: ClipRRect(
                    //borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                  children: <Widget>[
                    //Image.network(item, fit: BoxFit.contain),
                    CachedNetworkImage(
                      imageUrl: item,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Container(
                        width: double.infinity,
                        height: 220,
                        color: Colors.black12,
                        child: Lottie.asset('assets/json/loading.json'),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            ))
        .toList();

    return widget.post.postType == 2
        ? CarouselSlider(
            items: imageSliders,
            //Slider Container properties
            options: CarouselOptions(
              height: 220.0,
              enlargeCenterPage: false,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              // viewportFraction: 0.8,
            ),
          )
        : Center(
            child: Container(
              width: double.infinity,
              height: 280,
              child: _controller.value.isInitialized
                  ? GestureDetector(
                      child: VideoPlayer(_controller),
                      onTap: () => {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play()
                      },
                    )
                  : Container(
                      height: 220,
                      color: Colors.black12,
                      child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: 250,
                              child: Lottie.asset('assets/json/loading.json')
                          ),
                        ],
                      )),
                    ),
            ),
          );
    ;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
