//
// import 'package:flutter/material.dart';
//
// import '../global/custom_button.dart';
// import '../global/custom_textfield.dart';
// import '../model/login_model.dart';
//
// class EmergencyContactTab extends StatefulWidget {
//   final LoginModel userData;
//   EmergencyContactTab({required this.userData});
//   @override
//   _EmergencyContactTabState createState() => _EmergencyContactTabState();
// }
//
// class _EmergencyContactTabState extends State<EmergencyContactTab> {
//
//   late TextEditingController emergencyContactController;
//   late TextEditingController telephoneController;
//   late TextEditingController emailController;
//   late TextEditingController relationshipController;
//   final List<String> _dropdownItems = ['Parent', 'Partner', 'Friend', 'Other'];
//   String? selectedValue;
//   FocusNode _focusNode = FocusNode();
//
//   void initState() {
//     super.initState();
//     emergencyContactController = TextEditingController(text: widget.userData.emergencyContact);
//     telephoneController = TextEditingController(text: widget.userData.telephone);
//     emailController = TextEditingController(text: widget.userData.email);
//     relationshipController = TextEditingController(text: widget.userData.relationshipToThisPerson);
//     if (_dropdownItems.contains(widget.userData.relationshipToThisPerson)) {
//       selectedValue = widget.userData.relationshipToThisPerson;
//     }
//     // fetchUser();
//   }
//   @override
//   void dispose() {
//     emergencyContactController.dispose();
//     telephoneController.dispose();
//     emailController.dispose();
//     relationshipController.dispose();
//     super.dispose();
//   }
//
//   void updateEmergencyContact() {
//     String emergencyContact = emergencyContactController.text;
//     String telephone = telephoneController.text;
//     String email = emailController.text;
//     String relationship = relationshipController.text;
//
//     print("Emergency Contact: $emergencyContact");
//     print("Telephone: $telephone");
//     print("Email: $email");
//     print("Relationship: $relationship");
//
//     // You can implement logic to save/update this data
//   }
//
//   @override
//   Widget build(BuildContext context) =>
//   final double screenHeight = MediaQuery.of(context).size.height;
//   final double screenWidth = MediaQuery.of(context).size.width;
//   double titleFontSize;
//   double subtitleFontSize;
//   double labelFontSize;
//   if (screenWidth < 600) {
//   titleFontSize = 16; // Small screen
//   subtitleFontSize = 14;
//   labelFontSize =12;// Small screen
//   } else if (screenWidth < 1200) {
//   titleFontSize = 18; // Medium screen
//   subtitleFontSize = 16;
//   labelFontSize = 13;// Medium screen
//   } else {
//   titleFontSize = 20; // Large screen
//   subtitleFontSize = 18;
//   labelFontSize= 14;// Large screen
//   }
//   Scaffold(
//     backgroundColor: Color(0xFF111c38),
//     body: ClipRRect(
//       borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(15)),
//       child: Container(
//         padding: EdgeInsets.all(16),
//         color: Color(0xFFEAEBED),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.all(17),
//                 decoration: BoxDecoration(
//                   border: Border.all(width: 0.9, color: Colors.black26),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "In case of emergency contact",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 16,
//                         //wordSpacing: 1.5,
//                         fontFamily: "Montserrat",
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     SizedBox(height: 13),
//                     CustomTextField(
//                       textColor: Colors.black,
//                       labelColor: Colors.black,
//                       fillColor: Color(0xFFF6F8FC),
//                       labelText: "Emergency Contact",
//                       textCapitalization: TextCapitalization.words,
//                       keyboardType: TextInputType.text,
//                       controller: emergencyContactController,
//                     ),
//                     SizedBox(height: 9),
//                     CustomTextField(
//                       textColor: Colors.black,
//                       labelColor: Colors.black,
//                       fillColor: Color(0xFFF6F8FC),
//                       labelText: "Telephone",
//                       textCapitalization: TextCapitalization.words,
//                       controller: telephoneController,
//                       keyboardType: TextInputType.phone,
//                     ),
//                     SizedBox(height: 9),
//                     CustomTextField(
//                       textColor: Colors.black,
//                       labelColor: Colors.black,
//                       fillColor: Color(0xFFF6F8FC),
//                       labelText: "Email",
//                       textCapitalization: TextCapitalization.none,
//                       controller: emailController,
//                       keyboardType: TextInputType.emailAddress,
//                     ),
//                     SizedBox(height: 9),
//                     DropdownButtonFormField<String>(
//                       value: selectedValue,
//                       onChanged: (newValue) {
//                         setState(() {
//                           selectedValue = newValue;
//                           relationshipController.text = newValue!;
//                         });
//                       },
//                       items: _dropdownItems.map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(
//                             value,
//                             style: TextStyle(
//                               fontSize: 15,
//                               fontFamily: "Montserrat",
//                               color: Colors.black,
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                       dropdownColor: Color(0xFFf6f8fc),
//                       icon: SizedBox.shrink(),
//                       decoration: InputDecoration(
//                         labelText: 'Relationship to this person',
//                         suffixIcon: Icon(Icons.keyboard_arrow_down, color: Colors.black),
//                         border: UnderlineInputBorder(
//                           borderRadius: BorderRadius.circular(4),
//                           borderSide: BorderSide.none,
//                         ),
//                         labelStyle: TextStyle(
//                           color: Colors.black,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w300,
//                           letterSpacing: 1.1,
//                           wordSpacing: 1.7,
//                           fontFamily: "Montserrat",
//                         ),
//                         filled: true,
//                         fillColor: Color(0xFFf6f8fc),
//                       ),
//                       style: TextStyle(
//                         fontFamily: "Montserrat",
//                         fontSize: 18,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     SizedBox(height: 9),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 10),
//               CustomButton(
//                 text: "UPDATE EMERGENCY CONTACT",
//                 onPressed: updateEmergencyContact,
//                 backgroundColor: Color(0xFFE17055), // Orange
//                 textColor: Colors.white,
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }


import 'package:flutter/material.dart';
import '../global/custom_button.dart';
import '../global/custom_textfield.dart';
import '../model/login_model.dart';

class EmergencyContactTab extends StatefulWidget {
  final LoginModel userData;
  EmergencyContactTab({required this.userData});

  @override
  _EmergencyContactTabState createState() => _EmergencyContactTabState();
}

class _EmergencyContactTabState extends State<EmergencyContactTab> {
  late TextEditingController emergencyContactController;
  late TextEditingController telephoneController;
  late TextEditingController emailController;
  late TextEditingController relationshipController;

  final List<String> _dropdownItems = ['Parent', 'Partner', 'Friend', 'Other'];
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    emergencyContactController = TextEditingController(text: widget.userData.emergencyContact);
    telephoneController = TextEditingController(text: widget.userData.telephone);
    emailController = TextEditingController(text: widget.userData.email);
    relationshipController = TextEditingController(text: widget.userData.relationshipToThisPerson);

    if (_dropdownItems.contains(widget.userData.relationshipToThisPerson)) {
      selectedValue = widget.userData.relationshipToThisPerson;
    }
  }

  @override
  void dispose() {
    emergencyContactController.dispose();
    telephoneController.dispose();
    emailController.dispose();
    relationshipController.dispose();
    super.dispose();
  }

  void updateEmergencyContact() {
    String emergencyContact = emergencyContactController.text;
    String telephone = telephoneController.text;
    String email = emailController.text;
    String relationship = relationshipController.text;

    print("Emergency Contact: $emergencyContact");
    print("Telephone: $telephone");
    print("Email: $email");
    print("Relationship: $relationship");

    // Implement API call or local storage update logic
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
        child: Container(
          padding: EdgeInsets.all(16),
          color: Color(0xFFEAEBED),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(17),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.9, color: Colors.black26),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "In case of emergency contact",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: titleFontSize,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 13),
                      CustomTextField(
                        textColor: Colors.black,
                        labelColor: Colors.black,
                        fillColor: Color(0xFFF6F8FC),
                        labelText: "Emergency Contact",
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        controller: emergencyContactController,
                      ),
                      SizedBox(height: 9),
                      CustomTextField(
                        textColor: Colors.black,
                        labelColor: Colors.black,
                        fillColor: Color(0xFFF6F8FC),
                        labelText: "Telephone",
                        textCapitalization: TextCapitalization.words,
                        controller: telephoneController,
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 9),
                      CustomTextField(
                        textColor: Colors.black,
                        labelColor: Colors.black,
                        fillColor: Color(0xFFF6F8FC),
                        labelText: "Email",
                        textCapitalization: TextCapitalization.none,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 9),
                      DropdownButtonFormField<String>(
                        value: selectedValue,
                        onChanged: (newValue) {
                          setState(() {
                            selectedValue = newValue;
                            relationshipController.text = newValue!;
                          });
                        },
                        items: _dropdownItems.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: subtitleFontSize,
                                fontFamily: "Montserrat",
                                color: Colors.black,
                              ),
                            ),
                          );
                        }).toList(),
                        dropdownColor: Color(0xFFf6f8fc),
                        icon: Icon(Icons.keyboard_arrow_down, color: Colors.black),
                        decoration: InputDecoration(
                          labelText: 'Relationship to this person',
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none,
                          ),
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: labelFontSize,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1.1,
                            wordSpacing: 1.7,
                            fontFamily: "Montserrat",
                          ),
                          filled: true,
                          fillColor: Color(0xFFf6f8fc),
                        ),
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 9),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                CustomButton(
                  text: "UPDATE EMERGENCY CONTACT",
                  onPressed: updateEmergencyContact,
                  backgroundColor: Color(0xFFE17055), // Orange
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
