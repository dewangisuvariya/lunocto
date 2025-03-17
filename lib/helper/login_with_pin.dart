import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/login_model.dart';

class ApiService {
  static const String baseUrl = "https://phplaravel-1298719-4771829.cloudwaysapps.com/api/academia";

  static Future<LoginModel?> loginWithPin(int id, String pin) async {
    final String url = "$baseUrl/student/pin-login?id=$id&pin=$pin";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse['status'] == "success") {
          return LoginModel.fromJson(jsonResponse['student']);
        }
      }
    } catch (e) {
      print("Error: $e");
    }

    return null;
  }
}
//
// class LocalStorage {
//   static Future<void> saveUserId(int id) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setInt('user_id', id);
//   }
//
//   static Future<int?> getUserId() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getInt('user_id');
//   }
//
//   static Future<void> clearUserId() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('user_id');
//   }
// }


