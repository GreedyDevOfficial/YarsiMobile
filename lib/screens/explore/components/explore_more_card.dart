import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yarsi/config/palette.dart';

import 'explore_view_more.dart';

class ExploreMoreCard extends StatelessWidget {
  const ExploreMoreCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          width: 110,
          height: double.infinity ,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Palette.primaryLightBackground,
          ),
          child: Material(
            color: Palette.primaryLightBackground,
            borderRadius: BorderRadius.circular(15.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(15.0),
              onTap: ()=>{
                  Navigator.pushNamed(context, ExploreViewMore.routeName, arguments: {
                    'type': 'نام دسته بندی'
                  })
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.ellipsisH),
                  SizedBox(height: 35,),
                  Text('مشاهده بیشتر', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 10, color: Colors.black),)
                ],
              ),
            ),
          ) ,
      );
  }
}
