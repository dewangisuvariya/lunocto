import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../global/custom_button.dart';
import '../global/custom_password_field.dart';
import '../global/custom_textfield.dart';
import '../global/open_set_pinDialog.dart';
import '../model/login_model.dart';

class AccountTab extends StatefulWidget {


  final LoginModel userData;
  AccountTab({required this.userData});
  @override
  _AccountTabState createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  late TextEditingController firstNameController;
  late TextEditingController surNameController;
  late TextEditingController dobController;
  late TextEditingController pinController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;


  LoginModel? currentUser;
  bool _obscureTextField1 = true;
  bool _obscureTextField2 = true;
  DateTime? selectedDate;
  bool shareEntriesToAdmin = false;
  // String? _validatePassword(String value) {
  //   // Regular expression for validating password with at least 8 chars, 1 lowercase 1 special char
  //   String pattern =
  //       r'^(?=.*[a-z])(?=.*[!@#\$&*~]).{8,}$'; // Minimum 8 chars, 1 lowercase , 1 special char
  //   RegExp regExp = RegExp(pattern);
  //
  //   if (value.isEmpty) {
  //     return "Password cannot be empty";
  //   } else if (!regExp.hasMatch(value)) {
  //     return "Password must have at least 8 characters and one special character.";
  //   }
  //   return null;
  // }
  //
  // String? _validateConfirmPassword(String value) {
  //   if (value.isEmpty) {
  //     return "Confirm password cannot be empty";
  //   } else if (value != passwordController.text) {
  //     return "Passwords do not match";
  //   }
  //   return null;
  // }
  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController(text: widget.userData.firstName);
    surNameController = TextEditingController(text: widget.userData.surname);
    dobController = TextEditingController(text: widget.userData.dateOfBirth);
    pinController = TextEditingController(text: widget.userData.pin);
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    // fetchUser();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    surNameController.dispose();
    dobController.dispose();
    pinController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void saveChanges() {
    print("Updated UserName: ${firstNameController.text}");
    print("Updated Email: ${surNameController.text}");
    print("Updated Email: ${dobController.text}");
    print("Updated Email: ${pinController.text}");
    print("Updated Email: ${passwordController.text}");
    print("Updated Email: ${confirmPasswordController.text}");
  }

  String? _validatePassword(String value) {
    String pattern = r'^(?=.*[a-z])(?=.*[!@#\$&*~]).{8,}$'; // Minimum 8 chars, 1 lowercase, 1 special char
    RegExp regExp = RegExp(pattern);

    if (value.isEmpty) {
      return "Password cannot be empty";
    } else if (!regExp.hasMatch(value)) {
      return "Password must have at least 8 characters and one special character.";
    }
    return null;
  }

  String? _validateConfirmPassword(String value) {
    if (value.isEmpty) {
      return "Confirm password cannot be empty";
    } else if (value != passwordController.text.trim()) {
      return "Passwords do not match";
    }
    return null;
  }



  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light(),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        dobController.text = DateFormat('yyyy-MM-dd').format(pickedDate); // Formatting Date
      });
    }
  }
  @override
  Widget build(BuildContext context) {

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    double titleFontSize;
    double subtitleFontSize;
    double labelFontSize;
    if (screenWidth < 600) {
      titleFontSize = 17; // Small screen
      subtitleFontSize = 14;
      labelFontSize =12;// Small screen
    } else if (screenWidth < 1200) {
      titleFontSize = 20; // Medium screen
      subtitleFontSize = 16;
      labelFontSize = 13;// Medium screen
    } else {
      titleFontSize = 23; // Large screen
      subtitleFontSize = 18;
      labelFontSize= 14;// Large screen
    }

    return Scaffold(
      backgroundColor: Color(0xFF111c38),
      body: ClipRRect(
        borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(15)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                color: Color(0xFFEAEBED),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 0.9, color: Colors.black26),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: CustomTextField(
                                  textColor: Colors.black,
                                  labelColor: Colors.black,
                                  fillColor: Color(0xFFF6F8FC),
                                  labelText: "Firstname",
                                  textCapitalization: TextCapitalization.words,
                                  keyboardType: TextInputType.text,
                                  controller: firstNameController,
                                ),
                              ),
                              SizedBox(width: 17),
                              Expanded(
                                flex: 1,
                                child: CustomTextField(
                                  textColor: Colors.black,
                                  labelColor: Colors.black,
                                  fillColor: Color(0xFFF6F8FC),
                                  labelText: "Surname",
                                  textCapitalization: TextCapitalization.words,
                                  controller: surNameController,
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 9),
                          TextFormField(
                            controller: dobController,
                            decoration: InputDecoration(
                              filled: true,
                              labelText: "DOB",
                              suffixIcon: IconButton(
                                icon: Icon(Icons.calendar_month_outlined),
                                color: Colors.black,
                                onPressed: () => _selectDate(context),
                              ),
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 1.1,
                                wordSpacing: 2.0,
                                fontFamily: "Montserrat",
                              ),
                              fillColor: const Color(0xFFF6F8FC),
                              focusedBorder: InputBorder.none,
                              border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            readOnly: true,
                          ),
                          SizedBox(height: 9),
                          Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex:14,
                                child: Container(
                                  child: Text(
                                    'Share journal entries with admin',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize:subtitleFontSize,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),

                              Expanded(
                                child: Container(
                                  child: Checkbox(
                                    value: shareEntriesToAdmin,
                                    activeColor: Colors.blue,
                                    checkColor: Colors.white,
                                    side: BorderSide(color: Colors.grey, width: 2),
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        shareEntriesToAdmin = newValue!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Use Pin to login",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: subtitleFontSize,
                                  wordSpacing: 2,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              OutlinedButton(
                                onPressed: () => openSetPinDialog(context,pinController),
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  backgroundColor: Color(0xFFEAEBED),
                                  foregroundColor: Colors.black,
                                  padding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.010,
                                    horizontal: screenWidth * 0.030,
                                  ),
                                  side: BorderSide(color: Colors.black12,width: 1.2),
                                ),
                                child: Text(
                                  "Set Pin",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    wordSpacing: 2,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 9),
                          Text(
                            "Change Password",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: titleFontSize,
                              wordSpacing: 1.5,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 9),
                          CustomPasswordField(
                            controller: passwordController,
                            labelText: "Change Password",
                            fillColor: Color(0xFFF6F8FC),
                            labelColor: Colors.black,
                            textColor: Colors.black,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          CustomPasswordField(
                            controller: confirmPasswordController,
                            labelText: "Confirm Change ",
                            fillColor: Color(0xFFF6F8FC),
                            labelColor: Colors.black,
                            textColor: Colors.black,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomButton(
                      text: "SAVE CHANGES",
                      onPressed: () {
                        print("is change");
                        saveChanges();
                      },
                      backgroundColor: Color(0xFFE17055), // Orange
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}