import 'package:flutter/material.dart';
import 'package:yarsi/widgets/widgets.dart';

Widget Message(BuildContext context) {

  final questionController = TextEditingController();

  return(
      Column(
        children: [
          SizedBox(
            height: 25.0,
          ),
          Focus(child: Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 10.0),
            child: CustomTextField(
              hintText: 'سوال خود را بنویسید',
              maxLines: 7,
              onChange:(value) => {},
              controller: questionController,
            ),
          )),
          Container(
            alignment: Alignment.center,
            child: NormalButton(
              text: "ارسال سوال",
              press: () {
                Navigator.pop(context);
                FailDialog(context, 'خطا');
              },
              width: 200,
            ),
          ),
        ],
      )
  );
}