import 'package:flutter/material.dart';
import 'package:yarsi/widgets/widgets.dart';

class ExchangeMoney extends StatefulWidget {
  const ExchangeMoney({Key? key}) : super(key: key);

  @override
  State<ExchangeMoney> createState() => _ExchangeMoneyState();
}

class _ExchangeMoneyState extends State<ExchangeMoney> {
  double coins = 0;
  final coinController = TextEditingController();
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
                hintText: 'مبلغ به تومان',
                maxLines: 1,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
                controller: coinController,
                onChange: (value) =>{
                  setState(() {
                    coins = double.parse(value) / 100;
                  })
                },
              ),
            )
        ),
        SizedBox(height: 50.0,),
        Text('معادل(سکه یارسی)'),
        Text('$coins', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 23.0),),
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
