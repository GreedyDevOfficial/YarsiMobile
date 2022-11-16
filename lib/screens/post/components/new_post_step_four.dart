import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/widgets/widgets.dart';

class NewPostStepFour extends StatefulWidget {
  const NewPostStepFour({Key? key}) : super(key: key);

  @override
  State<NewPostStepFour> createState() => _NewPostStepFourState();
}

class _NewPostStepFourState extends State<NewPostStepFour> {

  double totalCoinsFee = 2400;
  double totalTomansFee = 100000;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 15.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(' ${totalTomansFee}', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14),),
              Text(' یارسی معادل با ', style: TextStyle(fontSize: 12),),
              Text(' ${totalCoinsFee}', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14), ),
              SizedBox(width: 10.0,),
              Icon(FontAwesomeIcons.coins, color: Palette.primaryLightColor,),
            ],
          ),
          SizedBox(height: 35.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NormalButton(
                text: "پرداخت با سکه",
                backgroundColor: Palette.primaryLightColor ,
                borderRadius: 25,
                press: () {

                },
              ),
              NormalButton(
                text: "پرداخت نقدی",
                backgroundColor: Palette.primaryLightColor ,
                borderRadius: 25,
                press: () {

                },
              ),
            ],
          ),
          SizedBox(height: 35.0,),
        ],
      ),
    );
  }
}
