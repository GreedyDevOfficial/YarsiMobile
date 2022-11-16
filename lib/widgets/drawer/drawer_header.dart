import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/models/models.dart';

class DrawerHeader extends StatefulWidget {

  final Post post;

  const DrawerHeader({Key? key, required this.post}) : super(key: key);

  @override
  State<DrawerHeader> createState() => _DrawerHeaderState();
}

class _DrawerHeaderState extends State<DrawerHeader> {

  String dropdownvalue = 'کاربر معمولی';
  var items =  ['کاربر معمولی','فروشگاه', 'بازارچه'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
        color: kPrimaryLightColor,
      ),
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "محسن احمدی",
                      style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.0,),
                    Text(
                      "تاریخ عضویت: ۱۴۰۱/۰۵/۰۶",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 0.0, right: 25.0),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Palette.facebookBlue,
                  child: CircleAvatar(
                    radius:  30.0,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: CachedNetworkImageProvider(widget.post.user.imageUrl),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          SizedBox(
            width: 200,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: DropdownButtonFormField(
                isExpanded: true,
                style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black, fontFamily: 'IRANSans'),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(width: 3.0, color: Colors.white)
                    )
                ),
                alignment: AlignmentDirectional.bottomEnd,
                value: dropdownvalue,
                icon: Icon(Icons.keyboard_arrow_down_rounded),
                items:items.map((String items) {
                  return DropdownMenuItem(
                      enabled: items == 'بازارچه' ? false : true,
                      value: items,
                      child: Text(items)
                  );
                }
                ).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
