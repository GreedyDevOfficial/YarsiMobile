import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yarsi/components/form_error.dart';
import 'package:yarsi/config/constants.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/screens/screens.dart';
import 'package:yarsi/widgets/default_button.dart';


class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {

  late Color _color = kPrimaryBackgroundColor;
  final _formKey = GlobalKey<FormState>();
  String? userName;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }


  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  'شماره همراه',
                  style: TextStyle(
                      fontFamily: 'IRANSans',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Focus(child: buildMobileFormField()),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  'گذرواژه',
                  style: TextStyle(
                      fontFamily: 'IRANSans',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Focus(child: buildPasswordFormField()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FormError(errors: errors),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            primary: Colors.black87,
                            textStyle: TextStyle(fontWeight: FontWeight.w700, fontFamily: 'IRANSans')
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, RegisterScreen.routeName);
                        },
                        child: Text('ثبت نام عضو جدید'),
                      )
                  )
              ),
              Container(
                alignment: Alignment.center,
                child: DefaultButton(
                  text: "ورود",
                  press: () {
                    // if (_formKey.currentState!.validate()) {
                    //   _formKey.currentState!.save();
                    //   // if all are valid then go to success screen
                    //   KeyboardUtil.hideKeyboard(context);
                    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => NavScreen()));
                    // }
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => NavScreen()));

                  },
                ),
              ),
              Container(
                  alignment: Alignment.centerRight,
                  child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            primary: Colors.black45,
                            textStyle: TextStyle(fontWeight: FontWeight.w700, fontFamily: 'IRANSans', fontSize: 11.0)
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
                        },
                        child: Text('! گذرواژه را فراموش کرده ام'),
                      )
                  )
              ),
            ]
        )
    );
  }
  TextFormField buildMobileFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      autocorrect: false,
      maxLength: 9,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onSaved: (newValue) => userName = newValue,
      style: const TextStyle(
          fontSize: 22.0,
          fontFamily: 'IRANSans',
          fontWeight: FontWeight.w700,
          letterSpacing: 7.0,
          height: 1.9),
      onChanged: (value) {
        if (value.isNotEmpty) {
          print('isNotEmpty');
          removeError(error: kMobileNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        print(value);
        if (value!.isEmpty) {
          addError(error: kMobileNullError);
          return '';
        } else if (value.length < 9) {
          addError(error: kMobileNullError);
          return '';
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          //addError(error: kInvalidEmailError);
          //return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "",
        counterText: "",
        focusColor: Colors.white,
        errorText: null,
        errorStyle: TextStyle(
          fontSize: 10.0,
        ),
        prefixIcon: SizedBox(
          width: 100.0,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15.0, 0.0, 25.0, 0.0),
                child: SvgPicture.asset('assets/svg/iran_flag.svg'),
              ),
              Center(
                widthFactor: 0.8,
                child: Text(
                  '09',
                  style: TextStyle(
                      fontFamily: 'IRANSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 22.0,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        fillColor: _color,
        prefixStyle: TextStyle(color: Colors.grey),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      autocorrect: false,
      obscureText: true,
      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
      onSaved: (newValue) => password = newValue,
      style: const TextStyle(
          fontSize: 22.0,
          fontFamily: 'IRANSans',
          fontWeight: FontWeight.w700,
          letterSpacing: 7.0,
          height: 1.9),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return '';
        } else if (value.length < 5) {
          addError(error: kShortPassError);
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "",
        focusColor: Colors.white,
        errorText: null,
        errorStyle: TextStyle(
          fontSize: 4.0,
        ),
        fillColor: _color,
        prefixStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}
