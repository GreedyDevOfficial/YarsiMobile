import 'package:flutter/material.dart';

class AddNewImageCard extends StatelessWidget {
  const AddNewImageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Color(0XFFA3A3A3)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              child: Center(
                  child: Icon(
            Icons.add,
            color: Colors.white,
            size: 50.0,
          ))),
          Positioned(
              bottom: 15,
              child: Text(
                'عکس جدید',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 12.0),
              ))
        ],
      ),
    );
  }
}
