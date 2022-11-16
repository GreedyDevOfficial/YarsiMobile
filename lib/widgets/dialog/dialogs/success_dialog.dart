import 'package:flutter/material.dart';
import 'package:yarsi/config/palette.dart';


ScaffoldFeatureController<SnackBar, SnackBarClosedReason> SuccessDialog(
    BuildContext context, String title) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Container(
          height: 90,
          decoration: BoxDecoration(
              color: Palette.primaryLightBackground,
              borderRadius: BorderRadius.circular(15.0)),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Palette.primarySuccessBackground,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0))),
                width: 25.0,
                height: double.infinity,
              ),
              SizedBox(
                width: 15.0,
              ),
              Icon(
                Icons.check_circle,
                size: 50.0,
                color: Palette.primarySuccessBackground,
              ),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '! تبریک',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'IRANSans'),
                      ),
                      Text(
                        title,
                        style: TextStyle(
                            color: Palette.primaryDarkColor,
                            fontSize: 12.0,
                            fontFamily: 'IRANSans'),
                      )
                    ],
                  ))
            ],
          )),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    )
);
