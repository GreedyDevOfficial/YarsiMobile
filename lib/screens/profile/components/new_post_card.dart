import 'package:flutter/material.dart';
import 'package:yarsi/screens/screens.dart';

class NewPostCard extends StatelessWidget {
  const NewPostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => {
          Navigator.pushNamed(context, NewPostScreen.routeName, arguments: {
            'title' : 'ایجاد پست جدید'
          })
        },

        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0XFFA3A3A3)),
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
                    'پست جدید',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12.0),
                  ))
            ],
          ),
        )
    );
  }
}
