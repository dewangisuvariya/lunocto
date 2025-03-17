// import 'package:flutter/material.dart';
// import '../view/student_signup_screen.dart';
//
// class PinEntryScreen extends StatefulWidget {
//   final TextEditingController controller;
//
//   const PinEntryScreen({Key? key, required this.controller}) : super(key: key);
//
//   @override
//   _PinEntryScreenState createState() => _PinEntryScreenState();
// }
//
// class _PinEntryScreenState extends State<PinEntryScreen> {
//   String firstPin = "";
//   String enteredPin = "";
//   bool isConfirming = false;
//
//   void addDigit(String digit) {
//     if (enteredPin.length < 4) {
//       setState(() {
//         enteredPin += digit;
//       });
//     }
//     if (enteredPin.length == 4) {
//       if (!isConfirming) {
//         firstPin = enteredPin;
//         setState(() {
//           isConfirming = true;
//           enteredPin = "";
//         });
//       } else {
//         if (firstPin == enteredPin) {
//           widget.controller.text = enteredPin;
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => StudentSignupScreen()),
//           );
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("PINs do not match! Try again.")),
//           );
//           setState(() {
//             enteredPin = "";
//             isConfirming = false;
//           });
//         }
//       }
//     }
//   }
//
//   void removeDigit() {
//     if (enteredPin.isNotEmpty) {
//       setState(() {
//         enteredPin = enteredPin.substring(0, enteredPin.length - 1);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF071330),
//       appBar: AppBar(
//         backgroundColor: Color(0xFF071330),
//         elevation: 0,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.lock,
//               color: Colors.white,
//               size: 50,
//             ),
//             SizedBox(height: 20),
//             Text(
//               isConfirming ? "Confirm PIN" : "Choose PIN Code",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(
//                 4,
//                     (index) => Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: CircleAvatar(
//                     radius: 8,
//                     backgroundColor:
//                     index < enteredPin.length ? Colors.white : Colors.white24,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 30),
//             GridView.builder(
//               shrinkWrap: true,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 childAspectRatio: 2,
//               ),
//               itemCount: 12,
//               itemBuilder: (context, index) {
//                 String label;
//                 if (index < 9) {
//                   label = (index + 1).toString();
//                 } else if (index == 9) {
//                   label = "";
//                 } else if (index == 10) {
//                   label = "0";
//                 } else {
//                   return IconButton(
//                     onPressed: removeDigit,
//                     icon: Icon(Icons.backspace, color: Colors.white),
//                   );
//                 }
//                 return GestureDetector(
//                   onTap: () => addDigit(label),
//                   child: Center(
//                     child: Text(
//                       label,
//                       style: TextStyle(
//                         fontSize: 24,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PinEntryScreen extends StatefulWidget {
  @override
  _PinEntryScreenState createState() => _PinEntryScreenState();
}

class _PinEntryScreenState extends State<PinEntryScreen> {

  bool isConfirming = false;
  final List<TextEditingController> pinControllers =
  List.generate(4, (_) => TextEditingController());
  final List<TextEditingController> confirmPinControllers =
  List.generate(4, (_) => TextEditingController());
  final List<FocusNode> pinFocusNodes = List.generate(4, (_) => FocusNode());
  final List<FocusNode> confirmPinFocusNodes = List.generate(4, (_) => FocusNode());


  void _onDigitEntered(int index, String value) {
    // setState(() {});
    if (value.isNotEmpty) {
      if (index < 3) {
        (isConfirming ? confirmPinFocusNodes : pinFocusNodes)[index + 1].requestFocus();
      } else {
        if (isConfirming) {
          _verifyPin();
        } else {
          setState(() {
            isConfirming = true;
          });
          confirmPinFocusNodes[0].requestFocus();
        }
      }
    }
    else if (value.isEmpty && index > 0) {
      // Move focus to the previous field and clear it when backspace is pressed
      (isConfirming ? confirmPinControllers : pinControllers)[index - 1].clear();
      (isConfirming ? confirmPinFocusNodes : pinFocusNodes)[index - 1].requestFocus();
    }
    setState(() {});
  }

  void _verifyPin() {
    String pin = pinControllers.map((c) => c.text).join();
    String confirmPin = confirmPinControllers.map((c) => c.text).join();

    if (pin == confirmPin) {
      Navigator.pop(context, pin); // PIN matches, return to sign-up
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("PINs do not match. Try again!")),
      );

      for (var controller in pinControllers + confirmPinControllers) {
        controller.clear();
      }

      setState(() {
        isConfirming = false;
      });

      pinFocusNodes[0].requestFocus();
    }
  }

  Widget _buildPinFields(bool confirming) {
    List<TextEditingController> controllers =
    confirming ? confirmPinControllers : pinControllers;
    List<FocusNode> focusNodes =
    confirming ? confirmPinFocusNodes : pinFocusNodes;

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
                  if (controllers[index].text.isEmpty && index > 0) {
                    // Move focus to previous field, clear it, and update UI
                    controllers[index - 1].clear();
                    focusNodes[index - 1].requestFocus();
                  } else {
                    // Clear current field and update UI
                    controllers[index].clear();
                  }
                });
              }
            },
            child: StatefulBuilder( // This ensures real-time color updates
              builder: (context, setState) {
                return CircleAvatar(
                  radius: 8, // Adjusted for better visibility
                  backgroundColor: controllers[index].text.isNotEmpty
                  ? Colors.white : Colors.white24, // Default color when empty
                  child: TextField(
                    controller: controllers[index],
                    focusNode: focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    style: TextStyle(fontSize: 17, color: Colors.black),
                    decoration: InputDecoration(
                      counterText: "",
                      filled: true,
                      fillColor: Colors.transparent, // Input background remains transparent
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
        if (value.isNotEmpty) {
            if (index < 3) {
              pinFocusNodes[index + 1].requestFocus(); // Move to the next field
            }
          } else if (index > 0) {
            pinFocusNodes[index - 1].requestFocus(); // Move back to the previous field
          }
                      _onDigitEntered(index, value);
        setState(() {}); // Refresh UI for dynamic color update
                    },
                    // onChanged: (value) {
                    //   if (value.isNotEmpty) {
                    //     if (index < 3) {
                    //       pinFocusNodes[index + 1].requestFocus(); // Move to the next field
                    //     }
                    //   } else if (index > 0) {
                    //     pinFocusNodes[index - 1].requestFocus(); // Move back to the previous field
                    //   }
                    //   setState(() {}); // Refresh UI for dynamic color update
                    // },
                    onSubmitted: (_) => _onDigitEntered(index, controllers[index].text),
                  ),
                );
              },
            ),
          ),
        );
      }),
    );

  }
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      FocusScope.of(context).requestFocus(pinFocusNodes[0]);
    });
  }


  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF071330),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20,),

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
          Text(
            isConfirming ? "Repeat PIN Code" : "Choose PIN Code",
            style: TextStyle(fontSize: screenWidth*0.055, color: Colors.white,
              wordSpacing: 2,
              letterSpacing: 1.2,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w800,),
          ),
          SizedBox(height: 20),
          _buildPinFields(isConfirming),
        ],
      ),
    );
  }
}
void openPinScreen(BuildContext context, TextEditingController pinInputController) async {
  final pin = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PinEntryScreen()),
  );

  if (pin != null) {
    pinInputController.text = pin; // Store the entered PIN
  }
}

