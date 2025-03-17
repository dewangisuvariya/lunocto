// import 'package:flutter/material.dart';
// import 'package:lunocto/view/home_screen.dart';
//
// class LoginWithPin extends StatefulWidget {
//   const LoginWithPin({super.key});
//
//   @override
//   State<LoginWithPin> createState() => _LoginWithPinState();
// }
//
// class _LoginWithPinState extends State<LoginWithPin> {
//   final List<TextEditingController> pinControllers =
//   List.generate(4, (_) => TextEditingController());
//   final List<FocusNode> pinFocusNodes = List.generate(4, (_) => FocusNode());
//
//   void _onDigitEntered(int index, String value) {
//     setState(() {});
//     if (value.isNotEmpty) {
//       if (index < 3) {
//         pinFocusNodes[index + 1].requestFocus();
//       } else {
//         _verifyPin();
//       }
//     }
//   }
//
//   void _verifyPin() {
//     String pin = pinControllers.map((c) => c.text).join();
//     Navigator.pop(context, pin);
//   }
//
//   Widget _buildPinFields() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(4, (index) {
//         return Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: CircleAvatar(
//             radius: 8,
//             backgroundColor: pinControllers[index].text.isNotEmpty ? Color(0xFFE17055) : Colors.white,
//             child: TextField(
//               controller: pinControllers[index],
//               focusNode: pinFocusNodes[index],
//               keyboardType: TextInputType.number,
//               textAlign: TextAlign.center,
//               maxLength: 1,
//               style: TextStyle(fontSize: 17, color: Colors.black),
//               decoration: InputDecoration(
//                 counterText: "",
//                 filled: true,
//                 fillColor: Colors.transparent, // Input background remains transparent
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//               onChanged: (value) => _onDigitEntered(index, value),
//             ),
//           ),
//         );
//       }),
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(milliseconds: 300), () {
//       FocusScope.of(context).requestFocus(pinFocusNodes[0]);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: const Color(0xFF071330),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const SizedBox(height: 20),
//           Row(
//             children: [
//               Expanded(
//                 child: GestureDetector(
//                   child: Icon(Icons.arrow_back, color: Colors.white, size: 25),
//                   onTap: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ),
//
//               Expanded(
//                 flex: 2,
//                 child: Container(
//                   alignment: Alignment.center,
//                   child: Image.asset(
//                     "assets/images/lunOcto_Logo_BG1.png",
//                     height: screenHeight * 0.13,
//                     width: screenHeight * 0.13,
//                   ),
//                 ),
//               ),
//
//               // Empty Expanded to balance the layout
//               Expanded(child: SizedBox()),
//             ],
//           ),
//           SizedBox(height: 60),
//           Container(
//             height:screenHeight * 0.06,width:screenHeight * 0.06,
//             child: Image(
//               image: AssetImage("assets/images/lock-alt.png"),
//             ),
//           ),
//           SizedBox(height: 20),
//           const SizedBox(height: 20),
//           const Text(
//             "Enter PIN Code to Login",
//             style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 20),
//           _buildPinFields(),
//         ],
//       ),
//     );
//   }
// }
//
// void openPinScreen(BuildContext context, TextEditingController pinInputController) async {
//   final pin = await Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => HomeScreen()),
//   );
//
//   if (pin != null) {
//     pinInputController.text = pin; // Store the entered PIN
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lunocto/view/home_screen.dart';
import '../helper/login_with_pin.dart';

class LoginWithPin extends StatefulWidget {

  const LoginWithPin({ super.key});

  @override
  State<LoginWithPin> createState() => _LoginWithPinState();
}

class _LoginWithPinState extends State<LoginWithPin> {
  final List<TextEditingController> pinControllers =
  List.generate(4, (_) => TextEditingController());
  final List<FocusNode> pinFocusNodes = List.generate(4, (_) => FocusNode());
  bool isLoading = false;
  String? errorMessage;

  void _onDigitEntered(int index, String value) {
    setState(() {});
    if (value.isNotEmpty) {
      if (index < 3) {
        pinFocusNodes[index + 1].requestFocus();
      } else {
        _verifyPin();
      }
    }
  }

    Future<void> _verifyPin() async {

      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      String pin = pinControllers.map((c) => c.text).join();
      final Map<String, dynamic>? args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

      // int? studentId=39;
      int? studentId = args?["studentId"];
      if (studentId == null) {
        setState(() {
          isLoading = false;
          errorMessage = "Invalid PIN. Please try again.";
        });
        return;
      }
      final loginModel = await ApiService.loginWithPin(studentId ,pin);

      setState(() {
        isLoading = false;
      });

      if (loginModel != null) {
        // Navigate to HomeScreen and pass the student data
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
            settings: RouteSettings(arguments: loginModel), // Pass the student data
          ),
        );
      } else {
        setState(() {
          errorMessage = "Incorrect PIN. Please try again.";
          for (var controller in pinControllers) {
            controller.clear();
          }
          FocusScope.of(context).requestFocus(pinFocusNodes[0]);
        });
      }
    }


  Widget _buildPinFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: KeyboardListener(
            focusNode: FocusNode(), // Required for detecting key events
            onKeyEvent:  (KeyEvent event) {
              if (event is KeyDownEvent &&
                  event.logicalKey == LogicalKeyboardKey.backspace) {
                setState(() {
                  if (pinControllers[index].text.isEmpty && index > 0) {
                    // Move focus to previous field, clear it, and update UI
                    pinControllers[index - 1].clear();
                    pinFocusNodes[index - 1].requestFocus();
                  } else {
                    // Clear current field and update UI
                    pinControllers[index].clear();
                  }
                });
              }
            },
            child: StatefulBuilder(
              builder:(context, setState) {
                return CircleAvatar(
                  radius: 8,
                  backgroundColor: pinControllers[index].text.isNotEmpty ? Color(0xFFE17055) : Colors.white,
                  child: TextField(
                    controller: pinControllers[index],
                    focusNode: pinFocusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    style: TextStyle(fontSize: 10, color: Colors.black),
                    decoration: InputDecoration(
                      counterText: "",
                      filled: true,
                      fillColor: Colors.transparent, // Input background remains transparent
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) => _onDigitEntered(index, value),
                  ),
                );
              }
            ),
          ),
        );
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      FocusScope.of(context).requestFocus(pinFocusNodes[0]);
    });
  }

  @override
  Widget build(BuildContext context) {

    final double screenHeight = MediaQuery.of(context).size.height;
   final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF071330),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  child: Icon(Icons.arrow_back, color: Colors.white, size: 25),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),

              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
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
          SizedBox(height: 60),
          Container(
            height:screenHeight * 0.06,width:screenHeight * 0.06,
            child: Image(
              image: AssetImage("assets/images/lock-alt.png"),
            ),
          ),
          SizedBox(height: 20),
          const SizedBox(height: 20),
          const Text(
            "Enter PIN Code to Login",
            style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildPinFields(),
        if (isLoading)
    const CircularProgressIndicator(color: Colors.white),
    if (errorMessage != null)
    Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Text(
    errorMessage!,
    style: const TextStyle(color: Colors.red, fontSize: 16),
    ),
    ),
        ],
      ),
    );
  }
}

