
import 'package:flutter/material.dart';
class Global {
  TextEditingController userNameInputController = TextEditingController();
  TextEditingController uniqueIdInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();


  void showSnackBar(BuildContext context, String message, {required String status}) {
    Color backgroundColor = (status == 'success') ? Colors.green : Colors.red;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
  }


const backgroundColor = Color(0xFF071330);