import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/widgets/widgets.dart';

class DiscountCard extends StatelessWidget {

  final String postImageUrl;
  final String discountCode;
  final int discountPercentage;

  const DiscountCard({Key? key, required this.postImageUrl, required this.discountCode, required this.discountPercentage}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery
        .of(context)
        .size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
      child: Container(
        height: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white
        ),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(topRight: Radius.circular(15.0), topLeft: Radius.circular(15.0)),
                child: CachedNetworkImage(
                  height: 180,
                  width: double.infinity,
                  imageUrl: postImageUrl,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder:
                      (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error),
                ),
              ),
              Positioned(
                  top: 3,
                  left: 3,
                  child: RawMaterialButton(
                    onPressed: () {}, //do your action
                    elevation: 1.0,
                    constraints: BoxConstraints(), //removes empty spaces around of icon
                    shape: CircleBorder(), //circular button
                    fillColor: Palette.primaryLightBackground, //background color
                    splashColor: Palette.primaryLightColor,
                    highlightColor: Colors.white,
                    child: Icon(FontAwesomeIcons.close, color: Palette.primaryDarkColor,),
                    padding: EdgeInsets.all(5),
                  )
              ),
              Positioned(
                  top: 3,
                  right: 3,
                  child: RawMaterialButton(
                    onPressed: () =>  {
                      showModalBottomSheet(
                        barrierColor: Colors.black.withOpacity(0.7),
                        enableDrag: false,
                        isDismissible: true,
                        isScrollControlled: false,
                        backgroundColor: Palette.primaryLightBackground,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))),
                        context: context,
                        builder: (context) => BottomModalSelector(
                          heightFactor: 0.4,
                          child: discount_options(context),
                        ),
                      )
                    }, //do your action
                    elevation: 0,
                    constraints: BoxConstraints(), //removes empty spaces around of icon
                    shape: CircleBorder(), //circular button
                    fillColor: Colors.black12, //background color
                    splashColor: Palette.primaryLightColor,
                    highlightColor: Colors.transparent,
                    child: Icon(Icons.more_vert, color: Colors.white,),
                    padding: EdgeInsets.all(5),
                  )
              ),
              Positioned(
                  bottom: 25.0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          bottomLeft: Radius.circular(25.0),
                        ),
                        color: Palette.primaryLightBackground.withOpacity(0.95)
                    ),
                    height: 35.0,
                    width: 100,
                    child: Center(child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(discountPercentage.toString() + "درصد تخفیف", style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 12.0, color: Palette.primaryDarkColor
                        ),)
                    )),
                  )
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(12),
                      padding: EdgeInsets.all(0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: Container(
                          height: screenSize.height * 0.08,
                          width: screenSize.width * 0.5,
                          color: Palette.primarySuccessBackground,
                        ),
                      ),
                    ),
                    Text(discountCode, style: TextStyle(fontFamily: 'Hiragino Sans', color: Colors.black, fontWeight: FontWeight.w900),)
                  ],
                ),
                SizedBox(width: 25.0,),
                GestureDetector(
                  child: Icon(FontAwesomeIcons.qrcode, size: 50, color: Palette.primaryDarkColor,),
                  onTap: () => {
                    showQRCodeDialog(context, discountCode )
                  },
                )
              ],
            ),
          )
        ],),
      ),
    );
  }
  showQRCodeDialog(BuildContext context, String discountCode) {
    showDialog(
      builder: (context) =>  ShowCustomDialog(
        title: 'کیوآرکد تخفیف',
        type: 'discount-qr-code',
        code: discountCode,
      ),
      context: context,
      barrierDismissible: true,
    );
  }
  Widget discount_options(BuildContext context) => SingleChildScrollView(
    child: Column(
      children: [
        BottomModalOption(
            label: 'دریافت بارکد تخفیف',
            onTap: () => {
              Navigator.pop(context),
              showQRCodeDialog(context, discountCode )
            }),
        DashedDivider(
          height: 1.0,
          color: Colors.grey,
        ),
        BottomModalOption(
            label: 'انتقال به سایت فروشنده',
            onTap: () => {
              Navigator.pop(context),
              FailDialog(context, 'فروشگاه لینک خریدی ثبت نکرده')
            }),
      ],
    ),

  );
}
