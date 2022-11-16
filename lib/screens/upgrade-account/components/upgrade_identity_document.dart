import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:yarsi/config/palette.dart';

class UpgradeIdentityDocument extends StatefulWidget {
  const UpgradeIdentityDocument({Key? key}) : super(key: key);

  @override
  State<UpgradeIdentityDocument> createState() => _UpgradeIdentityDocumentState();
}

class _UpgradeIdentityDocumentState extends State<UpgradeIdentityDocument> {
  @override
  Widget build(BuildContext context) {
    return     Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Text(
            'مدرک شناسایی',
            style: TextStyle(
                fontFamily: 'IRANSans',
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
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
                        Icons.photo_camera,
                        size: 75.0,
                      ),
                      Text(
                        'بارگزاری تصویر',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10.0),
                      )
                    ],
                  )),
            ),
          ),
        ),
        SizedBox(height: 5.0,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Text(
            'جواز کسب',
            style: TextStyle(
                fontFamily: 'IRANSans',
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
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
                        Icons.photo_camera,
                        size: 75.0,
                      ),
                      Text(
                        'جواز کسب',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10.0),
                      )
                    ],
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
