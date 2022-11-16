import 'package:flutter/material.dart';
import 'package:yarsi/components/components.dart';

Widget ShowMessage(String title, String message, String dateTime) {

  final questionController = TextEditingController();

  return(
      Column(
        children: [
          SizedBox(
            height: 25.0,
          ),
          Text(title, style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 14),),
          Text(message, style: TextStyle(fontSize: 10),),
        ],
      )
  );
}