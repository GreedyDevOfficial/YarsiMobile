import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yarsi/config/palette.dart';


ScaffoldFeatureController<SnackBar, SnackBarClosedReason> FailDialog(
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
                    color: Palette.primaryFailBackground,
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
                MdiIcons.closeCircle,
                size: 50.0,
                color: Palette.primaryFailBackground,
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '! متاسفیم',
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
