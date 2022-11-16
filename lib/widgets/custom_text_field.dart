import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yarsi/config/palette.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
        required this.hintText,
        this.maxLines = 1,
        this.fontSize = 12.0,
        this.textDirection = TextDirection.rtl,
        this.textInputType = TextInputType.text,
        this.textAlign = TextAlign.right,
        required this.onChange,
        required this.controller
      })
      : super(key: key);

  final String hintText;
  final int maxLines;
  final double fontSize;
  final TextDirection textDirection;
  final TextInputType textInputType;
  final TextAlign textAlign;
  final Function(String) onChange;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late Color _color = kPrimaryBackgroundColor;

  String? descriptions;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      autocorrect: false,
      textDirection: widget.textDirection,
      textAlign: widget.textAlign,
      maxLines: widget.maxLines,
      controller: widget.controller,
      onSaved: (newValue) => descriptions = newValue,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      style: TextStyle(
          fontSize: widget.fontSize,
          fontFamily: 'IRANSans',
          fontWeight: FontWeight.w700,
          height: 1.9),
      onChanged: (value) {
        widget.onChange(value);
      },
      validator: (value) {},
      decoration: InputDecoration(
        hintText: widget.hintText,
        focusColor: Colors.white,
        errorText: null,
        errorStyle: TextStyle(
          fontSize: 4.0,
        ),
        fillColor: _color,
        prefixStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}
