import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yarsi/config/palette.dart';

class UpgradeIdentityCode extends StatefulWidget {
  const UpgradeIdentityCode({Key? key}) : super(key: key);

  @override
  State<UpgradeIdentityCode> createState() => _UpgradeIdentityCodeState();
}

class _UpgradeIdentityCodeState extends State<UpgradeIdentityCode> {


  TextEditingController representativeCodeController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 45.0,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Text(
            'کد دریافتی از نمایندگی',
            style: TextStyle(
                fontFamily: 'IRANSans',
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        Focus(
            child: buildTextFormField(
                "representativeCode",
                TextDirection.rtl,
                false,
                "",
                representativeCodeController,
                TextAlign.right
            )
        ),
        SizedBox(
          height: 5.0,
        ),
      ],
    );
  }
}
TextFormField buildTextFormField(
    String field,
    TextDirection direction,
    bool readOnly,
    String hintText,
    TextEditingController controller,
    [TextAlign textAlign = TextAlign.right, int maxLines = 1]) {
  return TextFormField(
    keyboardType: TextInputType.text,
    autocorrect: false,
    readOnly: readOnly,
    textDirection: direction,
    controller: controller,
    textAlign: textAlign,
    maxLines: maxLines,
    inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
    style: const TextStyle(
        fontSize: 18.0,
        fontFamily: 'IRANSans',
        fontWeight: FontWeight.normal,
        height: 1.9),
    onChanged: (value) {},
    decoration: InputDecoration(
      hintText: hintText,
      hintTextDirection: TextDirection.rtl,
      hintStyle: TextStyle(
          fontSize: 14.0, color: Colors.black26, fontWeight: FontWeight.bold),
      focusColor: Colors.white,
      errorText: null,
      errorStyle: TextStyle(
        fontSize: 4.0,
      ),
      fillColor: kPrimaryBackgroundColor,
      prefixStyle: TextStyle(color: Colors.grey),
    ),
  );
}
