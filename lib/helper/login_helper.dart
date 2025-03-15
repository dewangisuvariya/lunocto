
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../global/dialog_box_one.dart';
import '../model/login_model.dart';

class ApiHelper {


  static Future<bool> submitStudentData(LoginModel loginModel) async {
    final String url = "https://phplaravel-1298719-4771829.cloudwaysapps.com/api/academia/student/store";
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(loginModel.toJson()),
      );

      print("Response Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        return true; // Data submitted successfully
      } else {
        return false; // Failed to submit data
      }
    } catch (e) {
      print("Error: $e");
      return false; // Handle network error
    }
  }

  static Future<Map<String, dynamic>> loginStudent(BuildContext context,
      String studentName, String uniqueId, String password) async {
    final String url = "https://phplaravel-1298719-4771829.cloudwaysapps.com/api/academia/student/login";
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "student_name": studentName,
          "unique_id": uniqueId,
          "password": password,
        }),
      );

      print("Response Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 404) {
        showCustomAlertDialog(context, "Network error, please try again");
        return {};
      }

      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return responseData; // Return the response data for further processing
    } catch (e) {
      // showCustomAlertDialog(context, "Network error, please try again");
      return {'status': 'fail', 'message': 'Network error'};
    }
  }


  static void showCustomAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) =>
          CustomAlertDialog(
            dialogBackgroundColor: Colors.white, // or any color you want
            message: message,
          ),
      barrierColor: Colors.black.withOpacity(0.5),
    );
  }
}

