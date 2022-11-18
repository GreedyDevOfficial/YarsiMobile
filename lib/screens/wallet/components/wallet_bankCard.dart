import 'package:flutter/material.dart';
import 'package:yarsi/data/data.dart';

class WalletBankCard extends StatelessWidget {
  final int index;
  final String cardNumber;
  final String nameFamily;

  const WalletBankCard(
      {Key? key,
        required this.index,
        required this.cardNumber,
        required this.nameFamily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return index != 0
        ? Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: banks[index].color),
      child: Stack(
        children: [
          Positioned(
              top: 5,
              right: 5,
              child: Image(
                image: AssetImage(banks[index].logo),
                width: 50,
                height: 50,
              )),
          Positioned(
              child: Center(
                  child: Text(
                    cardNumber,
                    style: TextStyle(
                        fontFamily: 'Orbitron',
                        color: Colors.white,
                        letterSpacing: 4),
                  ))),
          Positioned(
              bottom: 10,
              left: 20,
              child: Text(
                nameFamily,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    )
        : Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color(0XFFA3A3A3)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              child: Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 80.0,
                  ))),
          Positioned(
              bottom: 15,
              child: Text(
                'کارت جدید',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              )
          )
        ],
      ),
    );
  }
}
