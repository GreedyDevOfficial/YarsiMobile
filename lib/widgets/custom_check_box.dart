import 'package:flutter/material.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/models/models.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({Key? key, required this.checkBox}) : super(key: key);

  final CheckBoxState checkBox;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          checkboxTheme: CheckboxThemeData(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)))),
      child: CheckboxListTile(
        dense: true,
        activeColor: Palette.primaryLightColor,
        value: widget.checkBox.value,
        title: Text(
          widget.checkBox.title,
          textAlign: TextAlign.end,
          style: TextStyle(
              fontFamily: 'IRANSans',
              fontSize: 14.0,
              fontWeight: FontWeight.w500),
        ),
        onChanged: (value) => setState(() => widget.checkBox.value = value!),
      ),
    );
  }
}
