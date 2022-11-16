import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yarsi/config/palette.dart';

import 'new_post_image_gallery.dart';

class PostMediaBody extends StatefulWidget {
  const PostMediaBody({Key? key}) : super(key: key);

  @override
  State<PostMediaBody> createState() => _PostMediaBodyState();
}

class _PostMediaBodyState extends State<PostMediaBody> {

  int _selectedIndex = 0;

  static  List<Widget> _views = [
    Column(
      children: [
        Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () => {print('tapped')},
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(12),
                  padding: EdgeInsets.all(0),
                  dashPattern: [4, 2],
                  child: Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Palette.primaryLightColor.withOpacity(0.5),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            size: 75.0,
                          ),
                          Text(
                            'ویدیوی پست',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, color: Colors.black),
                          )
                        ],
                      )),
                ),
              ),
            ),
        Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
          child: Container(
            height: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Color(0XFF7BC58C).withOpacity(0.2)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '''
                  نکته: سعی کنید زمان ویدیو ارسالی بیشتر از ۵ دقیقه
                   و حجم آن بیشتر از ۵۰ مگابایت نباشد
                  '''
                  ,
                  maxLines: 2,
                  style: TextStyle(fontSize: 10.0, color: Colors.black),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Icon(FontAwesomeIcons.exclamationCircle),
                SizedBox(width: 15.0,),
              ],
            ),

          ),
        ),
      ],
    ),
    Container(child: NewPostImageGallery()),
  ];
  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;
    return  ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(35.0, 35.0, 35.0, 10.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () => {print('tapped')},
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(12),
                padding: EdgeInsets.all(0),
                dashPattern: [4, 2],
                child: Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Palette.primaryLightColor.withOpacity(0.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: 75.0,
                        ),
                        Text(
                          'کاور مدیا',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.black),
                        )
                      ],
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(35.0, 5.0, 35.0, 10.0),
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0XFF7BC58C).withOpacity(0.2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'نکته: سعی کنید حجم عکس ارسالی بیشتر از ۱ مگابایت نباشد',
                    style: TextStyle(fontSize: 10.0, color: Colors.black),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(FontAwesomeIcons.exclamationCircle),
                  SizedBox(width: 15.0,),
                ],
              ),

            ),
          ),
          DefaultTabController(
            length: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 65.0),
              child: Container(
                decoration: BoxDecoration(
                  color:
                  Palette.primaryLightColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: TabBar(
                  onTap: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  //controller: _tabController,
                  indicator: BoxDecoration(
                      color: Palette.primaryDarkColor,
                      borderRadius:
                      BorderRadius.circular(25.0)),
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: 'IRANSans'),
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.white,
                  tabs: [
                    Tab(
                      text: 'ویدیو',
                    ),
                    Tab(
                      text: 'گالری عکس',
                    )
                  ],
                ),
              ),
            ),

          ),
          Container(
              height: screenSize.height / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                child: IndexedStack(
                  index: _selectedIndex,
                  children: _views,
                ),
              )
          )
        ],
      );
  }
}
