
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../global/dialog_box_one.dart';
import '../model/student_signup_model.dart';


class ApiHelper {

  static Future<Map<String, dynamic>> submitStudentData(BuildContext context, Student student) async {
    final String url = "https://phplaravel-1298719-4771829.cloudwaysapps.com/api/academia/student/store";
    try {
      // final response = await http.post(
      //   Uri.parse(url),
      //   headers: {"Content-Type": "application/json"},
      //   body: jsonEncode(student.toJson()),
      // );
      var request = http.MultipartRequest("POST", Uri.parse(url));

      // Add text fields
      request.fields.addAll(student.toJson());

      // Alternative way to add the student image
      if (student.studentImage != null) {
        var imageFile = await http.MultipartFile.fromPath(
          'student_image', // The API field name
          student.studentImage!.path,
        );
        request.files.add(imageFile);
      }

      // Send request and get response
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      print("Response Code: ${response.statusCode}");
      print("Response Body: ${response.body}");
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (response.statusCode == 201) {
        // Data submitted successfully
        return {'status': 'success', 'message': responseData["message"] ?? "Student created successfully!"};
        return {};
      } else if (response.statusCode == 404) {
        // Show custom alert dialog for 404 error
        showCustomAlertDialog(context, "Network error, please try again");
        return {};
      } else {
        // Handle other errors
        //showCustomAlertDialog(context, "Network error, please try again");

        return {'status': 'fail', 'message': responseData["message"]};
      }
    } catch (e) {
      print("Error: $e");
      //showCustomAlertDialog(context, "Network error, please try again");
      return {'status': 'fail', 'message': 'Network error'};
    }
  }

  static void showCustomAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        dialogBackgroundColor: Colors.white, // or any color you want
        message: message,
      ),
      barrierColor: Colors.black.withOpacity(0.5),
    );
  }

}