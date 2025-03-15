import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lunocto/global/global.dart';
import '../global/custom_button.dart';
import '../global/custom_password_field.dart';
import '../global/custom_textfield.dart';
import '../helper/login_helper.dart';
import '../model/login_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameInputController = TextEditingController();
  TextEditingController firstNameInputController = TextEditingController();
  TextEditingController surNameInputController = TextEditingController();
  TextEditingController dobInputController = TextEditingController();
  TextEditingController uniqueIdInputController = TextEditingController();
  TextEditingController nameOfProviderInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();
  TextEditingController confirmPasswordInputController =
      TextEditingController();
  TextEditingController emailInputController = TextEditingController();
  TextEditingController emergencyInputController = TextEditingController();
  TextEditingController pinInputController = TextEditingController();
  TextEditingController relationshipToThisPersonInputController =
      TextEditingController();
  DateTime? selectedDate;
  bool _isLoading = false;
  final Color backgroundColor = Color(0xFF071330);

  void submitData() async {
    LoginModel loginModel = LoginModel(
      studentName: userNameInputController.text,
      firstName: firstNameInputController.text,
      surname: surNameInputController.text,
      dateOfBirth:
          selectedDate != null
              ? DateFormat('yyyy-MM-dd').format(selectedDate!)
              : '',
      uniqueID: uniqueIdInputController.text,
      password: passwordInputController.text,
      pin: pinInputController.text,
      email: emailInputController.text,
      //studentImage: studentImageController.text,
      emergencyContact: emergencyInputController.text,
      relationshipToThisPerson: relationshipToThisPersonInputController.text,
      nameOfProvider: nameOfProviderInputController.text,
      passwordConfirmation: confirmPasswordInputController.text,
    );

    bool success = await ApiHelper.submitStudentData(loginModel);
    if (success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Data submitted successfully!")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Failed to submit data")));
    }
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });

    final response = await ApiHelper.loginStudent(
      context,
      userNameInputController.text,
      uniqueIdInputController.text,
      passwordInputController.text,
    );

    setState(() {
      _isLoading = false;
    });

    print("Response: $response");

    // Check the response status and handle accordingly
    if (response['status'] == 'success') {
      LoginModel userData = LoginModel.fromJson(response['student']);

      // var studentData = response['student'];
      // String userName = studentData['student_name'] ?? '';
      // String email = studentData['email'] ?? '';
      // String emergencyContact = studentData['emergency_contact'] ?? '';
      // String firstName= studentData['first_name'] ?? '';
      // String  surName= studentData['surname'] ?? '';
      // String dob= studentData['date_of_birth'] ?? '';
      // String uniqueId= studentData['unique_id'] ?? '';
      // String  password= studentData['password'] ?? '';
      // String nameOfProvider= studentData['name_of_provider'] ?? '';
      // String confirmPassword= studentData['password_confirmation'] ?? '';
      // String  pin= studentData['pin'] ?? '';
      // String relationshipToThisPerson= studentData['relationship_to_this_person'] ?? '';
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => HomeScreen(
      //       userName: userName,
      //       email: email,
      //       emergencyContact: emergencyContact,
      //         firstName:firstName,
      //         surName:surName,
      //         dob:dob,
      //         uniqueId:uniqueId,
      //         password:password,
      //         nameOfProvider:nameOfProvider,
      //         confirmPassword:confirmPassword,
      //         pin:pin,
      //         relationshipToThisPerson:relationshipToThisPerson,
      //       telephone:"",
      //     ),
      //   ),
      // );
      Navigator.pushNamed(
        context,
        'WelcomeScreen',
        arguments: userData, // Pass user data using ModalRoute
      );

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login successful!"),backgroundColor: Colors.green));
      // Navigate to the next screen or perform any other action
    } else {
      // Handle failure case
      String message = response['message'] ?? 'An unknown error occurred';
      Global().showSnackBar(context, message, status: "fail");
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,

      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: screenHeight * 0.13,
                    width: screenHeight * 0.13,
                    child: Image(
                      image: AssetImage("assets/images/lunOcto_Logo_BG1.png"),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.0008),
                  Text(
                    "Your wellness is our \n primary mission. ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white30,
                      fontSize: screenWidth * 0.06,
                      //fontSize: 30,
                      wordSpacing: 2,
                      fontFamily: "Montserrat",
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    "Welcome to the lunOcto Wellness \n Platform",
                    style: TextStyle(
                      color: Color(0xFFEAEBED),
                      fontSize: screenWidth * 0.04,
                      wordSpacing: 2,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat",
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomTextField(
                    labelColor: Colors.black87,
                    textColor: Colors.black,
                    controller: userNameInputController,
                    labelText: "Username",
                    fillColor: Color(0xFFEAEBED),
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                  ),
                  SizedBox(height: screenHeight * 0.011),
                  CustomPasswordField(
                    controller: passwordInputController,
                    labelText: "Password",
                    fillColor: Color(0xFFEAEBED),
                    labelColor:  Colors.black87,
                    textColor: Colors.black,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                SizedBox(height: screenHeight * 0.002),

                  CustomTextField(
                    textColor: Colors.black,
                    labelColor: Colors.black87,
                    controller: uniqueIdInputController,
                    labelText: "Unique ID",
                    fillColor: Color(0xFFEAEBED),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: screenHeight * 0.028),
                  CustomButton(
                    text: "SIGN IN",
                    onPressed: loginUser,
                    backgroundColor: Color(0xFFE17055), // Orange
                    textColor: Colors.white,
                  ),

                  SizedBox(height: screenHeight * 0.020),
                  Row(
                    children: [
                      Expanded(
                        flex: 18,
                        child: Container(
                          child: Divider(
                            color: Colors.white38,
                            endIndent: 25,
                            indent: 0,
                            thickness: 0.6,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Center(
                            child: Text(
                              "or",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 18,
                        child: Container(
                          child: Divider(
                            color: Colors.white38,
                            endIndent: 0,
                            indent: 25,
                            thickness: 0.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.020),
                  CustomButton(
                    text: "LOGIN WITH PIN",
                    onPressed: () {},
                    backgroundColor: Color(0xFFEAEBED), // Light gray
                    textColor: Colors.black,
                  ),

                  SizedBox(height: screenHeight * 0.018),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "StudentSignupScreen");
                        },
                        child: Text(
                          "Register for Student",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFE17055),
                            wordSpacing: 3,
                            fontSize: screenHeight * 0.018,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                        },
                        child: Text(
                          "Register for Life Coach",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFE17055),
                            wordSpacing: 3,
                            fontSize: screenHeight * 0.018,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Register for Therapist",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFE17055),
                            wordSpacing: 3,
                            fontSize: screenHeight * 0.018,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.008),
                  Text(
                    "Interested in using our service?",
                    style: TextStyle(
                      color: Colors.white30,
                      wordSpacing: 3,
                      fontSize: screenHeight * 0.017,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_isLoading) // Show loading indicator if loading
            Container(
              color: Colors.black.withOpacity(0.5),
              // Semi-transparent background
              child: Center(
                child: LoadingAnimationWidget.discreteCircle(
                  secondRingColor: Color(0xFFE17055),
                  thirdRingColor: Color(0xFFE17055),
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

