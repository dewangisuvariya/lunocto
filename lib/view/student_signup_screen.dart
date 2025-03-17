import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lunocto/global/global.dart';
import '../global/custom_button.dart';
import '../global/custom_password_field.dart';
import '../global/custom_textfield.dart';
import '../global/open_set_pinDialog.dart';
import '../helper/student_helper.dart';
import '../model/login_model.dart';
import '../model/login_with_pin.dart';
import '../model/student_signup_model.dart';
import 'package:image_picker/image_picker.dart';

class StudentSignupScreen extends StatefulWidget {

  const StudentSignupScreen( {super.key});

  @override
  State<StudentSignupScreen> createState() => _StudentSignupScreenState();
}

class _StudentSignupScreenState extends State<StudentSignupScreen> {
  TextEditingController userNameInputController = TextEditingController();
  TextEditingController firstNameInputController = TextEditingController();
  TextEditingController surNameInputController = TextEditingController();
  TextEditingController dobInputController = TextEditingController();
  TextEditingController uniqueIdInputController = TextEditingController();
  TextEditingController nameOfProviderInputController =
  TextEditingController();
  TextEditingController passwordInputController = TextEditingController();
  TextEditingController confirmPasswordInputController =
  TextEditingController();
  TextEditingController emailInputController = TextEditingController();
  TextEditingController emergencyInputController = TextEditingController();
  TextEditingController pinInputController = TextEditingController();
  TextEditingController relationshipToThisPersonInputController =
  TextEditingController();
  DateTime? selectedDate;
  XFile? _pickedImage;
  bool _isLoading = false;
  File? _imageFile;
  void _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _pickedImage = image;
        _imageFile = File(image.path); // Convert XFile to File
      });
    }
  }
  void onTap(BuildContext context) {
    String currentText = emergencyInputController.text;
    if (!currentText.startsWith('+91')) {
      emergencyInputController.text = '+91 $currentText';  // Prepend +91 to the text
      emergencyInputController.selection = TextSelection.fromPosition(
        TextPosition(offset: emergencyInputController.text.length), // Move the cursor to the end
      );
    }
  }
  String? _validatePassword(String value) {
    // Regular expression for validating password with at least 8 chars, 1 lowercase 1 special char
    String pattern =
        r'^(?=.*[a-z])(?=.*[!@#\$&*~]).{8,}$'; // Minimum 8 chars, 1 lowercase , 1 special char
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
    } else if (value != passwordInputController.text) {
      return "Passwords do not match";
    }
    return null;
  }
  final List<String> _dropdownItems = ['Parent', 'Partner', 'Friend', 'Other'];
  String? selectedValue;
  FocusNode _focusNode = FocusNode();
  bool validateForm() {

    if (userNameInputController.text.isEmpty ||
        firstNameInputController.text.isEmpty ||
        surNameInputController.text.isEmpty ||
        dobInputController.text.isEmpty ||
        nameOfProviderInputController.text.isEmpty ||
        passwordInputController.text.isEmpty ||
        confirmPasswordInputController.text.isEmpty ||
        emailInputController.text.isEmpty ||
        emergencyInputController.text.isEmpty ||
        relationshipToThisPersonInputController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("All fields must be filled!"))
      );
      return false;
    }
    if (_imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select an image!")),
      );
      return false;
    }

    String? passwordError = _validatePassword(passwordInputController.text);
    String? confirmPasswordError = _validateConfirmPassword(confirmPasswordInputController.text);

    if (passwordError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(passwordError)),
      );
      return false;
    }

    if (confirmPasswordError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(confirmPasswordError)),
      );
      return false;
    }

    return true; // If all checks pass, return true
  }


    void submitData() async {
      if (validateForm()) {
        setState(() {
          _isLoading = true; // Show loader
        });

        Student student = Student(

          studentName: userNameInputController.text,
          firstName: firstNameInputController.text,
          surname: surNameInputController.text,
          dateOfBirth: dobInputController.text.isNotEmpty
              ? DateFormat('yyyy-MM-dd').format(selectedDate!)
              : '',
          uniqueId: "1234",
          password: passwordInputController.text,
          pin: pinInputController.text,
          email: emailInputController.text,
          studentImage: _imageFile!,
          emergencyContact: emergencyInputController.text,
          relationship: relationshipToThisPersonInputController.text,
          provider: nameOfProviderInputController.text,
          passwordConfirmation: confirmPasswordInputController.text,
        );

        // Call the API and get the response
        Map<String, dynamic> response = await ApiHelper.submitStudentData(context, student);

        setState(() {
          _isLoading = false; // Hide loader after API call
        });

        if (response['status'] == 'success') {
          int studentId = response['studentId'];
          // Show success message with green background
          Global().showSnackBar(context, "Data submitted successfully!", status: "success");

          LoginModel? loginResponse = await ApiHelper.loginWithPin(studentId, pinInputController.text);

          Navigator.of(context).pushNamed("LoginScreen", arguments: {"studentId": studentId},);
          // Navigate to the next screen or perform any other action
        } else {
          // Show failure message with red background
          String message = response['message'] ?? 'An unknown error occurred';
          Global().showSnackBar(context, message, status: "fail");
        }
      }
    }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light(), // Adjust theme if needed
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        dobInputController.text = DateFormat('yyyy-MM-dd').format(pickedDate); // Formatting Date
      });
    }
  }
   final Color backgroundColor = Color(0xFF071330);

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
       // backgroundColor: Color(0xFF071330),
      backgroundColor: backgroundColor,
      body: Stack(
        children:[ SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16,right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                Row(
                  children: [
                    // Back button aligned to the left
                    Expanded(
                      child: GestureDetector(
                        child: Icon(Icons.arrow_back, color: Colors.white, size: 25),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),

                    // Centering the image container
                    Expanded(
                      flex: 2, // Give more space to the image to center it properly
                      child: Container(
                        alignment: Alignment.center, // Ensures the image is centered within the container
                        child: Image.asset(
                          "assets/images/lunOcto_Logo_BG1.png",
                          height: screenHeight * 0.13,
                          width: screenHeight * 0.13,
                        ),
                      ),
                    ),

                    // Empty Expanded to balance the layout
                    Expanded(child: SizedBox()),
                  ],
                ),
                SizedBox(height: screenHeight * 0.010),
                Text("Register Your Account",  style: TextStyle(
                  color: Color(0xFFEAEBED),
                  fontSize: screenWidth * 0.04,
                  wordSpacing: 2,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat",
                ),),
                SizedBox(height: screenHeight * 0.022),
                Container(
                  height: screenHeight * 0.12,
                    width: screenHeight * 0.12,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: _imageFile != null
                          ? DecorationImage(
                        image: FileImage(_imageFile!),
                        fit: BoxFit.cover,
                      )
                          : DecorationImage(
                        image: AssetImage("assets/images/3342_User_Image.png"),
                      ),
                    ),
                  ),


                //SizedBox(height: screenHeight * 0.002),
                TextButton(
                  onPressed:_pickImage,
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: Color(0xFFE17055), // Button background color
                    foregroundColor: Colors.white, // Text color
                    padding: EdgeInsets.symmetric(
                        vertical: 4.5,
                      horizontal: 7,
                    ),
                    minimumSize: Size(0, screenHeight * 0.030 ),
                  ),
                  child: Text(
                    "Change Picture",
                    style: TextStyle(
                      fontSize: screenHeight * 0.010, // Increased font size for visibility
                      fontFamily: 'Montserrat',
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.022),
                CustomTextField(
                  textColor: Colors.white,
                    labelColor:Color(0xFFEAEBED),
                    labelText: "Username",
                    fillColor: Color(0xFF111c38),
                    controller: userNameInputController,
                    keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.words
                  ),
                SizedBox(height: screenHeight * 0.012),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomTextField(
                        textColor: Colors.white,
                        labelColor:Color(0xFFEAEBED),
                        fillColor: Color(0xFF111c38),
                        labelText: "Firstname",
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        controller: firstNameInputController,
                      ),
                    ),
                    SizedBox(width: 17,),
                    Expanded(
                      flex: 1,
                      child: CustomTextField(
                        textColor: Colors.white,
                        labelColor:Color(0xFFEAEBED),
                        fillColor: Color(0xFF111c38),
                        labelText: "Surname",
                        textCapitalization: TextCapitalization.words,
                        controller: surNameInputController,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.012),
                TextFormField(
                    controller: dobInputController,
                    decoration: InputDecoration(
                      filled: true,
                        labelText: "DOB",
                         suffixIcon: IconButton(icon:Icon(Icons.calendar_month_outlined), color: Colors.white,onPressed: () =>_selectDate(context),),
                      labelStyle: TextStyle(
                        color:  Color(0xFFEAEBED),
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1.1,
                        wordSpacing: 2.0,
                        fontFamily: "Montserrat",
                      ),
                      fillColor: const Color(0xFF111c38),
                      focusedBorder: InputBorder.none,
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide.none, // No border in general
                      ),
                    ),
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600
                    ),
                    readOnly: true,
                  ),
                SizedBox(height: screenHeight * 0.012),
                CustomTextField(
                  textColor: Colors.white,
                  labelColor:Color(0xFFEAEBED),
                  labelText: "Name of provider",
                  fillColor: Color(0xFF111c38),
                  controller: nameOfProviderInputController,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: screenHeight * 0.012),
                CustomPasswordField(
                  controller: passwordInputController,
                  labelText: "Password",
                  fillColor:  Color(0xFF111c38),
                  labelColor: Color(0xFFEAEBED),
                  textColor: Colors.white,
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: screenHeight * 0.004),
                CustomPasswordField(
                  controller: confirmPasswordInputController,
                  labelText: "Confirm Password",
                  fillColor: Color(0xFF111c38),
                  labelColor:  Color(0xFFEAEBED),
                  textColor: Colors.white,
                  keyboardType: TextInputType.visiblePassword,
                ),
                // SizedBox(height: screenHeight * 0.008),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text("Use Pin to Login", style: TextStyle(
                        color:  Color(0xFFEAEBED),
                        fontSize: screenHeight *0.016,
                        wordSpacing: 2,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600
                    ),),
                    ElevatedButton(
                      // onPressed: () async {
                      //   final pin = await Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => PinEntryScreen(controller: pinInputController),
                      //     ),
                      //   );
                      //
                      //   if (pin != null) {
                      //     pinInputController.text = pin; // Store the entered PIN
                      //   }
                      // },
                      onPressed: () => openPinScreen(context, pinInputController),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          backgroundColor:Colors.white,
                          foregroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight *  0.010,
                          horizontal: screenHeight *  0.018,
                        ),
                      ),

                      child: Text("Set Pin", style: TextStyle(
                          color: Color(0xFF071330),
                          fontSize: screenHeight *0.014,
                          wordSpacing: 2,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w800
                      ),),
                    ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.010),
                CustomTextField(
                  textColor: Colors.white,
                  labelColor:Color(0xFFEAEBED),
                    keyboardType: TextInputType.emailAddress,
                    controller: emailInputController,
                  fillColor: Color(0xFF111c38),
                  labelText: "Email Address",
                  ),
                SizedBox(height: screenHeight * 0.012),
                CustomTextField(
                  textColor: Colors.white,
                  labelText:  "Emergency Contact",
                  labelColor:Color(0xFFEAEBED),
                  fillColor: Color(0xFF111c38),
              onTap: () => onTap(context),
                    controller: emergencyInputController,
                    keyboardType: TextInputType.number,
                  ),
                SizedBox(height: screenHeight * 0.012),
                DropdownButtonFormField<String>(
                  value: selectedValue,
                  onChanged: (newValue) {
                    setState(() {
                      selectedValue = newValue;
                      relationshipToThisPersonInputController.text = newValue!;
                    });
                  },
                  items: _dropdownItems.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Montserrat",
                          color: Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
                  dropdownColor: Color(0xFF111c38), // Background color of dropdown list
                  icon: SizedBox.shrink(), // Removes the default dropdown icon
                  decoration: InputDecoration(
                    labelText: 'Relationship to this person',
                    suffixIcon: Icon(Icons.keyboard_arrow_down, color: Colors.white), // Custom icon
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none,
                    ),
                    labelStyle: TextStyle(
                      color:  Color(0xFFEAEBED),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1.1,
                      wordSpacing: 1.7,
                      fontFamily: "Montserrat",
                    ),
                    filled: true,
                    fillColor: Color(0xFF111c38), // Background color of the text field
                  ),
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                CustomButton(
                    text: "CREATE MY ACCOUNT",
            onPressed: submitData,
                    backgroundColor: Color(0xFFE17055),
                    textColor: Colors.white,
                  ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: (){
                  Navigator.pushNamed(context, "LoginScreen");
                  //   Color dialogColor = backgroundColor == Color(0xFF071330) ? Colors.white : Color(0xFF071330);
                  // showDialog(
                  //   context: context,
                  //   builder: (context) => DialogBoxTwo(dialogBackgroundColor: dialogColor),
                  //   barrierColor: Colors.black.withOpacity(0.5),
                  // );
                },
                  child: Text("Login" ,style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFE17055),
                    wordSpacing: 3,
                    fontSize: screenHeight *0.019,
                  ),),
                  ),
                SizedBox(
                  height: 20,
                )
              ],
            ),),
          ),
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.5), // Semi-transparent background
              child: Center(
                child: LoadingAnimationWidget.discreteCircle(
                  secondRingColor: Color(0xFFE17055),
                  thirdRingColor:  Color(0xFFE17055),
                  color: Colors.white, // Set color for visibility
                  size: 50,
                ),
              ),
            ),
        ],
      ),
      );
  }
}
