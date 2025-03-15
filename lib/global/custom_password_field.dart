import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final Color fillColor;
  final Color labelColor;
  final Color textColor;

  const CustomPasswordField({
    required this.controller,
    required this.labelText,
    required this.fillColor,
    required this.labelColor,
    required this.textColor,
    required this.keyboardType,
    Key? key,
  }) : super(key: key);

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: _obscureText,
        obscuringCharacter: '*',
        style: TextStyle(color: widget.textColor, fontSize: 15, fontFamily: "Montserrat", fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: widget.labelColor,
            fontSize: 14,
            fontWeight: FontWeight.w300,
            letterSpacing: 1.1,
            wordSpacing: 2.0,
            fontFamily: "Montserrat",
          ),
          filled: true,
          fillColor: widget.fillColor,
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide.none,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: widget.labelColor,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
      ),
    );
  }
}
