import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;

  CustomButton({
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        foregroundColor: textColor,
        backgroundColor: backgroundColor,
        minimumSize: Size(screenHeight*0.60, 45),
        fixedSize: Size(screenHeight*0.60, 50),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: screenHeight *0.016, color: textColor, fontFamily: 'Montserrat',
            // screenWidth *0.036
            letterSpacing: 1,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}