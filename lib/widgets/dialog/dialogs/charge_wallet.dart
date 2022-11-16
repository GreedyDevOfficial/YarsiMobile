import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yarsi/config/palette.dart';
import 'package:intl/intl.dart' as intl;
import 'package:yarsi/widgets/dialog/dialogs/dialogs.dart';
import 'package:yarsi/widgets/widgets.dart';

class ChargeWallet extends StatefulWidget {
  const ChargeWallet({Key? key}) : super(key: key);

  @override
  State<ChargeWallet> createState() => _ChargeWalletState();
}

class _ChargeWalletState extends State<ChargeWallet> {

  final amountController = TextEditingController();
  intl.NumberFormat myFormat = intl.NumberFormat.decimalPattern('en_us');

  double amount = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                child: NormalButton(
                  text: "۲۰۰۰۰ تومان",
                  borderRadius: 10.0,
                  backgroundColor: Colors.white38,
                  borderColor: Colors.black45,
                  press: () {
                    amountController.text = myFormat.format(20000);
                  },
                  width: 100,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: NormalButton(
                  text: "۱۰۰۰۰ تومان",
                  borderRadius: 10.0,
                  backgroundColor: Colors.white38,
                  borderColor: Colors.black45,
                  press: () {
                    amountController.text = myFormat.format(10000);

                  },
                  width: 100,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                child: NormalButton(
                  text: "۱۰۰۰۰۰ تومان",
                  borderRadius: 10.0,
                  backgroundColor: Colors.white38,
                  borderColor: Colors.black45,
                  press: () {
                      amountController.text = myFormat.format(100000);
                  },
                  width: 100,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: NormalButton(
                  text: "۵۰۰۰۰ تومان",
                  borderRadius: 10.0,
                  backgroundColor: Colors.white38,
                  borderColor: Colors.black45,
                  press: () {
                    amountController.text = myFormat.format(50000);

                  },
                  width: 100,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15.0,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            'مبلغ دلخواه(تومان) ',
            style: TextStyle(
                fontFamily: 'IRANSans',
                fontWeight: FontWeight.w700,
                fontSize: 12.0,
                color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Focus(
              child: buildTextFormField(
                  "amount",
                  TextDirection.ltr,
                  amount.toString(),
                  amountController)
          ),
        ),
        SizedBox(height: 15,),
        Container(
          alignment: Alignment.center,
          child: NormalButton(
            text: "واریز وجه",
            press: () {
              Navigator.pop(context);
              SuccessDialog(context, 'تبدیل با موفقیت انجام پذیرفت');
            },
            width: 200,
            height: 55,
          ),
        ),
      ],
    );
  }
  TextFormField buildTextFormField(
      String field,
      TextDirection direction,
      String hintText,
      TextEditingController controller,
      [int maxLines = 1]) {
    return TextFormField(
      keyboardType: TextInputType.text,
      autocorrect: false,
      textDirection: direction,
      controller: controller,
      textAlign: TextAlign.center,
      maxLines: maxLines,
      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
      style: const TextStyle(
          fontSize: 16.0,
          fontFamily: 'IRANSans',
          fontWeight: FontWeight.normal,
          height: 1.9),
      onChanged: (value) {

      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 12.0, color: Colors.black26, fontWeight: FontWeight.bold),
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
