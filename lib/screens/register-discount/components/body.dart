import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/screens/register-discount/scan_qrcode_screen.dart';
import 'package:yarsi/widgets/widgets.dart';


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  TextEditingController discountCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NormalButton(text: 'اسکن کیوآرکد',press: () => {
            Navigator.pushNamed(context, ScanQRCodeScreen.routeName, arguments: {
              'title': 'اسکن کیوآرکد'
            })
          },),
          SvgPicture.asset('assets/svg/borcode_scan.svg'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    'کد تخفیف را وارد کنید یا اسکن نمایید',
                    style: TextStyle(
                        fontFamily: 'IRANSans',
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Focus(
                    child: buildTextFormField(
                        "discountCode",
                        Icons.qr_code_outlined,
                        TextDirection.rtl,
                        "",
                        discountCodeController)
                ),
              ],
            ),
          ),
          SizedBox(height: 15.0,),
          NormalButton(text: 'ثبت کد تخفیف',),
          SizedBox(height: 80,)
        ],
      ),
    );
  }
  TextFormField buildTextFormField(
      String field,
      IconData icon,
      TextDirection direction,
      String hintText,
      TextEditingController controller,
      [int maxLines = 1]) {
    return TextFormField(
      keyboardType: TextInputType.text,
      autocorrect: false,
      textDirection: direction,
      controller: controller,
      textAlign: TextAlign.right,
      maxLines: maxLines,
      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
      style: const TextStyle(
          fontSize: 18.0,
          fontFamily: 'Orbitron',
          fontWeight: FontWeight.normal,
          letterSpacing: 2,
          height: 1.9),
      onChanged: (value) {},
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 14.0, color: Colors.black26, fontWeight: FontWeight.bold),
        focusColor: Colors.white,
        errorText: null,

        errorStyle: TextStyle(
          fontSize: 4.0,
        ),
        prefixIcon: SizedBox(
          width: 65.0,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                child: Icon(
                  icon,
                  size: 35.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        fillColor: kPrimaryBackgroundColor,
        prefixStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}
