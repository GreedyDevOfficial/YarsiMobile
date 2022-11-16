import 'package:flutter/material.dart';
import 'package:yarsi/widgets/dialog/dialogs/dialogs.dart';
import 'package:yarsi/widgets/widgets.dart';

Widget ChatWithStore(BuildContext context) {

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
                  hintText: 'سوال خود را از فروشنده بنویسید',
                  maxLines: 7,
                  onChange: (value) => {},
                  controller: captionController,
                ),
              )),
          Container(
            alignment: Alignment.center,
            child: NormalButton(
              text: "ارسال سوال",
              press: () {
                Navigator.pop(context);
                SuccessDialog(context, 'سوال شما ثبت گردید');
              },
              width: 200,
            ),
          ),
        ],
      )
  );
}

