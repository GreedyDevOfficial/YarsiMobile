import 'package:flutter/material.dart';
import 'package:yarsi/widgets/widgets.dart';

Widget Repost(BuildContext context) {

  final captionController = TextEditingController();

  return(
      Column(
        children: [
          SizedBox(
            height: 25.0,
          ),
          Focus(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 10.0),
                child: CustomTextField(
                  hintText: 'کپشن ری پست',
                  maxLines: 7,
                  onChange: (value) => {},
                  controller: captionController,
                ),
              )),
          Container(
            alignment: Alignment.center,
            child: NormalButton(
              text: "ارسال ری پست",
              press: () {
                Navigator.pop(context);
                SuccessDialog(context, 'ری پست شما ثبت گردید');
              },
              width: 200,
            ),
          ),
        ],
      )
  );
}

