import 'package:flutter/material.dart';
import 'package:yarsi/data/data.dart';
import 'package:yarsi/models/models.dart';
import 'package:yarsi/widgets/widgets.dart';

Widget Report(BuildContext context) {

  final violentController = TextEditingController();

  return(
      Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          for (CheckBoxState checkBox in reportPostOptions)
            CustomCheckBox(checkBox: checkBox),
          Focus(child: Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 10.0),
            child: CustomTextField(
              hintText: 'ثبت تخلف',
              onChange: (value) => {},
              controller: violentController,
            ),
          )),
          Container(
            alignment: Alignment.center,
            child: NormalButton(
              text: "ثبت تخلف",
              press: () {},
              width: 200,
            ),
          ),
        ],
      )
  );
}