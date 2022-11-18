import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yarsi/config/size_config.dart';

class AboutUsForm extends StatelessWidget {
  const AboutUsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text('اپلیکیشن یارسی، شبکه اجتماعی هوشمند برای معرفی کسب و کار شما می باشد که با ارائه امکانات جدید بازاریابی، تبلیغات و مکانیزم کسب پاداش برای کاربران، سعی در افزایش سود و کسب درآمد می باشد.',
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 13.0
            ),),
          SizedBox(height: 50,),
          SvgPicture.asset(
            'assets/svg/about_design.svg',
            matchTextDirection: true,
            width: getProportionateScreenWidth(200),
          ),
        ],
      ),
    );
  }
}
