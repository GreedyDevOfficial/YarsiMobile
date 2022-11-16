import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:yarsi/components/components.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/config/size_config.dart';
import 'package:yarsi/widgets/widgets.dart';

import 'fail_dialog.dart';

Widget Coupon(BuildContext context) {
  SizeConfig().init(context);
  final Size size = MediaQuery.of(context).size;
  const postDiscount = 10;
  return Column(
    children: [
      Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              height: size.height * 0.25,
              child: ClipPath(
                clipper: CouponClipper(),
                child: Container(
                  color: kPrimaryLightColor,
                ),
              ),
            ),
          ),
          DashedDivider(
            hpadding: 50.0,
            color: Palette.primaryDarkColor,
          ),
          Positioned(
            top: 35.0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(12),
                  padding: EdgeInsets.all(0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      height: size.height * 0.08,
                      width: size.width * 0.5,
                      color: Palette.primarySuccessBackground,
                    ),
                  ),
                ),
                Text('Y30-36548265852', style: TextStyle(fontFamily: 'Hiragino Sans', color: Colors.black),)
              ],
            ),
          ),
          Positioned(
              bottom: 50.0,
              child: Column(
                textDirection: TextDirection.rtl,
                children: [
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        '${postDiscount}درصد',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                            fontSize: 18.0),
                      )),
                  Text('تخفیف خرید شما'),
                ],
              ))
        ],
      ),
      Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            NormalButton(
              text: "انتقال به سایت فروشنده",
              press: () {
                Navigator.pop(context);
                FailDialog(context, 'فعلا امکان فروش اینترنتی فراهم نمی باشد');
              },
              width: 200,
            ),
            SizedBox(height: 10.0,),
            NormalButton(
              text: "کیوآرکد پاداش خرید",
              press: () {
                showQRCodeDialog(context);
              },
              width: 200,
            ),
          ],
        ),
      ),
    ],
  );
}
showQRCodeDialog(BuildContext context) {
  showDialog(
    builder: (context) => const ShowCustomDialog(
      title: 'کیوآرکد تخفیف',
      type: 'discount-qr-code',
    ),
    context: context,
    barrierDismissible: true,
  );
}
