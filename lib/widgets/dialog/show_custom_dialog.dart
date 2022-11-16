import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/widgets/widgets.dart';

import 'dialogs/dialogs.dart';


class ShowCustomDialog extends StatelessWidget {
  const ShowCustomDialog(
      {Key? key,
        this.backgroundColor = Palette.primaryLightBackground,
        required this.title,
        required this.type,
        this.height = 350,
        this.code = 'yarsi'
      })
      : super(key: key);

  final Color backgroundColor;
  final String title;
  final String type;
  final String code;

  final double height;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Container(
              height: height,
              child: Column(
                children: [
                  Container(
                    height: 40.0,
                    child: Stack(children: [
                      Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                              splashRadius: 15.0,
                              onPressed: () => {Navigator.of(context).pop()},
                              icon: Icon(FontAwesomeIcons.close))),
                      Center(
                        child: Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                              fontSize: 13.0),
                        ),
                      )
                    ]),
                  ),
                  DashedDivider(
                    height: 1.0,
                    color: Colors.grey,
                    hpadding: 20.0,
                  ),
                  if (type == "report") ...[
                    Report(context)
                  ] else if (type == "coupon") ...[
                    Coupon(context)
                  ] else if (type == "repost") ...[
                    Repost(context)
                  ] else if (type == "message") ...[
                    Message(context)
                  ] else if (type == "transformCoin") ...[
                    TransformCoin(context)
                  ] else if (type == "exchangeCoin") ...[
                    ExchangeCoin()
                  ] else if (type == "location") ...[
                    Location(context)
                  ] else if (type == "chargeWallet") ...[
                    ChargeWallet()
                  ] else if (type == "moneyToCoin") ...[
                    ExchangeMoney()
                  ] else if (type == "moneyRequest") ...[
                    MoneyRequest()
                  ] else if (type == "chat-with-store") ...[
                    ChatWithStore(context)
                  ] else if (type == "discount-qr-code") ...[
                    DiscountQRCode(context, code)
                  ]
                ],
              ),
            ),
          ),
        ));
  }
}
