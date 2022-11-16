import 'package:flutter/material.dart';
import 'package:yarsi/widgets/widgets.dart';

import 'success_dialog.dart';

class ExchangeCoin extends StatefulWidget {
  const ExchangeCoin({Key? key}) : super(key: key);

  @override
  State<ExchangeCoin> createState() => _ExchangeCoinState();
}

class _ExchangeCoinState extends State<ExchangeCoin> {
  double tomans = 0;
  final tomansController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25.0,
        ),
        Focus(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 10.0),
              child: CustomTextField(
                hintText: 'تعداد سکه',
                maxLines: 1,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
                controller: tomansController,
                onChange: (value) =>{
                  setState(() {
                    tomans = double.parse(value) * 100;
                  })
                },
              ),
            )
        ),
        SizedBox(height: 50.0,),
        Text('معادل(تومان)'),
        Text('$tomans', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 23.0),),
        Container(
          alignment: Alignment.center,
          child: NormalButton(
            text: "تبدیل",
            press: () {
              Navigator.pop(context);
              SuccessDialog(context, 'تبدیل با موفقیت انجام پذیرفت');
            },
            width: 200,
          ),
        ),
      ],
    );
  }
}
