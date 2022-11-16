import 'package:flutter/material.dart';
import 'package:yarsi/widgets/widgets.dart';

class MoneyRequest extends StatefulWidget {
  const MoneyRequest({Key? key}) : super(key: key);

  @override
  State<MoneyRequest> createState() => _MoneyRequestState();
}

class _MoneyRequestState extends State<MoneyRequest> {
  double tomans = 0;
  String accountBank = '';

  final tomansController = TextEditingController();
  final accountBankController = TextEditingController();

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
                hintText: 'مقدار وجه به تومان',
                maxLines: 1,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
                controller: tomansController,
                onChange: (value) =>{
                  setState(() {
                    tomans = double.parse(value) / 100;
                  })
                },
              ),
            )
        ),
        SizedBox(height: 5,),
        Focus(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 10.0),
              child: CustomTextField(
                hintText: 'حساب بانکی',
                maxLines: 1,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
                controller: accountBankController,
                onChange: (value) =>{
                  setState(() {
                    tomans = double.parse(value) / 100;
                  })
                },
              ),
            )
        ),
        SizedBox(height: 15.0,),
        Text('معادل(سکه یارسی)'),
        Text('$tomans', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 23.0),),
        Container(
          alignment: Alignment.center,
          child: NormalButton(
            text: "درخواست واریز",
            press: () {
              Navigator.pop(context);
              SuccessDialog(context, 'تبدیل با موفقیت انجام پذیرفت');
            },
            width: 200,
            height: 50,
          ),
        ),
      ],
    );
  }
  Widget gander_options(BuildContext context) => SingleChildScrollView(
    child: Column(
      children: [
        BottomModalOption(
            label: 'مونث',
            onTap: () => {

            }),
        DashedDivider(
          height: 1.0,
          color: Colors.grey,
        ),
        BottomModalOption(
          label: 'مذکر',
          onTap: () => {
          },
        ),
        DashedDivider(
          height: 1.0,
          color: Colors.grey,
        ),
        BottomModalOption(
          label: 'سایر',
          onTap: () => {
          },
        ),
      ],
    ),
  );

}
