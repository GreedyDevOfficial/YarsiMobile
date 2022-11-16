import 'package:flutter/material.dart';
import 'package:yarsi/widgets/widgets.dart';

Widget Location(BuildContext context) => Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 25.0,
        ),
        Container(
            alignment: Alignment.center,
            child: const Text(
              'برای دسترسی به پست های تبلیغاتی و بدست آوردن سکه، لازم هست دسترسی گوشی به موقعیت مکانی خود را تایید کنید. آیا مایل به این کار هستید؟',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            )),
        const SizedBox(
          height: 15.0,
        ),
        Container(
          alignment: Alignment.center,
          child: NormalButton(
            text: "بله",
            press: () {
              Navigator.pop(context);
            },
            width: 200,
          ),
        ),
      ],
    );
