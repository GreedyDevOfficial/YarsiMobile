import 'package:flutter/material.dart';
import 'package:yarsi/widgets/widgets.dart';

Widget TransformCoin(BuildContext context) {
  final yarsiIdController = TextEditingController();
  final coinCountController = TextEditingController();
  return (
      Column(
        children: [
          SizedBox(
            height: 25.0,
          ),
          Focus(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 10.0),
                child: CustomTextField(
                  hintText: 'شناسه یارسی',
                  maxLines: 1,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                  onChange: (value) => {},
                  controller: yarsiIdController,
                ),
              )
          ),
          Focus(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 10.0),
                child: CustomTextField(
                  hintText: 'تعداد سکه',
                  maxLines: 1,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                  onChange: (value) => {},
                  controller: coinCountController,
                ),
              )
          ),
          SizedBox(height: 50.0,),
          Container(
            alignment: Alignment.center,
            child: NormalButton(
              text: "انتقال",
              press: () {
                Navigator.pop(context);
                SuccessDialog(context, 'انتقال با موفقیت انجام پذیرفت');
              },
              width: 200,
            ),
          ),
        ],
      )
  );
}
