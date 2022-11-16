import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/widgets/widgets.dart';

class NewPostStepOne extends StatefulWidget {
  const NewPostStepOne({Key? key}) : super(key: key);

  @override
  State<NewPostStepOne> createState() => _NewPostStepOneState();
}

class _NewPostStepOneState extends State<NewPostStepOne> {

  TextEditingController postTitleController = TextEditingController();
  TextEditingController postCaptionController = TextEditingController();
  TextEditingController postPinnedMessageController = TextEditingController();

  String postType = 'adv';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              'عنوان پست',
              style: TextStyle(
                  fontFamily: 'IRANSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Focus(
              child: buildPostTitleTextFormField(
                  "postTitle",
                  Icons.person,
                  TextDirection.rtl,
                  "",
                  postTitleController)
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              'کپشن پست',
              style: TextStyle(
                  fontFamily: 'IRANSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
              ),
            ),
          ),
          Focus(
              child: buildPostTitleTextFormField(
                  "postCaption",
                  Icons.person,
                  TextDirection.rtl,
                  "",
                  postCaptionController,
                  4
              )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              'پیام پین شده(اختیاری)',
              style: TextStyle(
                  fontFamily: 'IRANSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Focus(
              child: buildPostTitleTextFormField(
                  "postPinnedMessage",
                  Icons.person,
                  TextDirection.rtl,
                  "",
                  postPinnedMessageController)
          ),
          SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              'نوع پست',
              style: TextStyle(
                  fontFamily: 'IRANSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NormalButton(
                text: "بازاریابی",
                width: 75,
                borderRadius: 25,
                backgroundColor: postType == "marketing" ? Palette.primaryDarkColor : Palette.primaryLightColor ,
                press: () {
                  setState(() {
                    postType = "marketing";
                  });
                },
              ),
              SizedBox(width: 15.0,),
              NormalButton(
                text: "تبلیغاتی",
                backgroundColor: postType == "adv" ? Palette.primaryDarkColor : Palette.primaryLightColor ,
                width: 75,
                borderRadius: 25,
                press: () {
                    setState(() {
                       postType = "adv";
                    });
                },
              ),
            ],
          ),
          SizedBox(height: 35.0,)
        ],
      ),
    );
  }
  TextFormField buildPostTitleTextFormField(
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
          fontFamily: 'IRANSans',
          fontWeight: FontWeight.normal,
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
        fillColor: kPrimaryBackgroundColor,
        prefixStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}
