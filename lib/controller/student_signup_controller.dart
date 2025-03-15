import 'package:get/get.dart';
import 'package:flutter/material.dart';

class StudentSignupController extends GetxController {
  // TextEditingControllers
  var userNameInputController = TextEditingController().obs;
  var firstNameInputController = TextEditingController().obs;
  var surNameInputController = TextEditingController().obs;
  var dobInputController = TextEditingController().obs;
  var nameOfProviderInputController = TextEditingController().obs;
  var passwordInputController = TextEditingController().obs;
  var confirmPasswordInputController = TextEditingController().obs;
  var emailInputController = TextEditingController().obs;
  var emergencyInputController = TextEditingController().obs;
  var relationshipToThisPersonInputController = TextEditingController().obs;

  // Password visibility flags
  var _obscureTextField1 = true.obs;
  var _obscureTextField2 = true.obs;

  bool get obscureTextField1 => _obscureTextField1.value;
  bool get obscureTextField2 => _obscureTextField2.value;

  // Toggle password visibility
  void togglePasswordVisibility1() {
    _obscureTextField1.value = !_obscureTextField1.value;
  }

  void togglePasswordVisibility2() {
    _obscureTextField2.value = !_obscureTextField2.value;
  }

  // Method to prepend +91 to emergency contact
  void onEmergencyContactTap() {
    String currentText = emergencyInputController.value.text;
    if (!currentText.startsWith('+91')) {
      emergencyInputController.value.text = '+91 $currentText';  // Prepend +91 to the text
      emergencyInputController.value.selection = TextSelection.fromPosition(
        TextPosition(offset: emergencyInputController.value.text.length), // Move the cursor to the end
      );
    }
  }

  // Password validation
  String? validatePassword(String value) {
    String pattern = r'^(?=.*[a-z])(?=.*[!@#\$&*~]).{8,}$'; // Minimum 8 chars, 1 lowercase, 1 special char
    RegExp regExp = RegExp(pattern);

    if (value.isEmpty) {
      return "Password cannot be empty";
    } else if (!regExp.hasMatch(value)) {
      return "Password must have at least 8 characters and one special character.";
    }
    return null;
  }

  // Confirm password validation
  String? validateConfirmPassword(String value) {
    if (value.isEmpty) {
      return "Confirm password cannot be empty";
    } else if (value != passwordInputController.value.text) {
      return "Passwords do not match";
    }
    return null;
  }

  // List of relationship dropdown items
  final List<String> _dropdownItems = [
    'Family',
    'Friend',
    'Partner',
    'Other Relative'
  ];

  List<String> get dropdownItems => _dropdownItems;

  // Clear all form fields
  void clearForm() {
    userNameInputController.value.clear();
    firstNameInputController.value.clear();
    surNameInputController.value.clear();
    dobInputController.value.clear();
    nameOfProviderInputController.value.clear();
    passwordInputController.value.clear();
    confirmPasswordInputController.value.clear();
    emailInputController.value.clear();
    emergencyInputController.value.clear();
    relationshipToThisPersonInputController.value.clear();
  }
}
