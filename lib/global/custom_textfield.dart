
import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final VoidCallback? onTap;
  final Color fillColor ;
  final Color labelColor;
  final Color textColor;
  // Constructor to initialize the parameters
  CustomTextField({
    required this.controller,
    required this.labelText,
    required this.fillColor ,
    required this.labelColor,
    required this.textColor,
    this.obscureText = false,
    required this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      textCapitalization: textCapitalization,
      autocorrect: true,
      textAlign: textAlign,

      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color:  labelColor,
          fontSize: 14,
          fontWeight: FontWeight.w300,
          letterSpacing: 1.1,
          wordSpacing: 2.0,
          fontFamily: "Montserrat",
        ),
        filled: true,
        fillColor: fillColor,
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none, // No border in general
        ),
      ),
      style: TextStyle(
        fontFamily: "Montserrat",
        color:textColor,
        fontWeight: FontWeight.w600,
        fontSize: 15,
      ),
      onTap: onTap,
    );
  }
}
