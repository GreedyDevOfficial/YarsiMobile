import 'package:flutter/material.dart';
import 'package:yarsi/config/keyboard.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/config/size_config.dart';
import 'package:yarsi/screens/screens.dart';
import 'package:yarsi/widgets/widgets.dart';



class OTPForm extends StatefulWidget {

  const OTPForm({Key? key}) : super(key: key);

  @override
  State<OTPForm> createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {

  late Color _color = kPrimaryBackgroundColor;
  final _formKey = GlobalKey<FormState>();
  late  int _seconds = 120;
  String? otpPassword;
  var reset;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10.0),
            Container(
              // width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                'کد چهار رقمی پیامک شده را وارد نمایید',
                style: TextStyle(
                  fontFamily: 'IRANSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 12.0,
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: getProportionateScreenWidth(50), child: buildTextFieldOTP(true, false)),
                  Container(width: getProportionateScreenWidth(50), child: buildTextFieldOTP(false, false)),
                  Container(width: getProportionateScreenWidth(50), child: buildTextFieldOTP(false, false)),
                  Container(width: getProportionateScreenWidth(50), child: buildTextFieldOTP(false, true)),
                ],
              ),
            ),
            CountdownTimer(callback: (val) => {
              setState(() => _seconds = val),
            },),
            Container(
              alignment: Alignment.center,
              child: DefaultButton(
                text: "ارسال کد",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // if all are valid then go to success screen
                    KeyboardUtil.hideKeyboard(context);
                    Navigator.pushNamed(context, NewPasswordScreen.routeName);
                  }
                },
              ),
            ),
            Container(
                alignment: Alignment.centerRight,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 8.0, 25.0, 0.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.black87,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('بازگشت'),
                    )
                )
            )
          ],
        ));
  }

  TextFormField buildTextFieldOTP(bool first, last) {
    return TextFormField(
      autofocus: true,
      onChanged: (value) => {
        if (value.length == 1 && last == false)
          {FocusScope.of(context).nextFocus()}
        else if (value.length == 0 && first == false)
          {FocusScope.of(context).previousFocus()}
      },
      showCursor: false,
      readOnly: false,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24.0),
      keyboardType: TextInputType.number,
      maxLength: 1,
      decoration: InputDecoration(
          counter: Offstage(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: Colors.black12),
              borderRadius: BorderRadius.circular(12.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: Colors.brown),
              borderRadius: BorderRadius.circular(12.0))),
    );
  }
}
