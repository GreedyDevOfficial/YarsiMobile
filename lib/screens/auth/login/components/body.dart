import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yarsi/components/components.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/config/size_config.dart';

import 'sign_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Stack(
                children: [
                  ClipPath(
                    clipper: LoginClipper(),
                    child: Image(
                        image: AssetImage('assets/png/header_design.png'),
                        fit: BoxFit.cover,
                        height: size.height / 3,
                        width: double.infinity,
                        color: Color(0xFF000000).withOpacity(0.1)),
                  ),
                  CustomPaint(
                    size: Size(size.width, size.height / 3),
                    painter: LoginPainter(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50.0),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/yarsi_logo.svg',
                              matchTextDirection: true,
                              width: getProportionateScreenWidth(100),
                              color: kPrimaryDarkColor,
                            ),
                            Text(
                              'یارسی -ویرایش ۱.۰.۰',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12.0,
                                  color: kPrimaryDarkColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
                  child: SignForm()
              ),
            ),
          ],
        ),
      ),
    );
  }
}
