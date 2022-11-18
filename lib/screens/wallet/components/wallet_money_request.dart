import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/data/data.dart';

class WalletMoneyRequest extends StatelessWidget {
  const WalletMoneyRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    intl.NumberFormat myFormat = intl.NumberFormat.decimalPattern('en_us');

    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate((BuildContext context, int index){
            return Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 3.0, 25.0, 3.0),
              child: Container(
                height: 35.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: Palette.primaryLightBackground,
                ),
                child: Center(
                  child: Row(
                    //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: FractionallySizedBox(
                          widthFactor: 1,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              myFormat.format(moneyRequests[index].amount),
                              style: TextStyle(
                                fontWeight: FontWeight.w600, color: Colors.black,),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: FractionallySizedBox(
                          widthFactor: 1,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              moneyRequests[index].status,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: FractionallySizedBox(
                          widthFactor: 1,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              moneyRequests[index].date,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
            childCount: moneyRequests.length,
          ),
        ),
      ],
    );
  }
}
