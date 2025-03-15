// import 'package:flutter/material.dart';
//
// // class DialogBoxOne extends StatelessWidget {
// //   final Color dialogBackgroundColor;
// //
// //   const DialogBoxOne({Key? key, required this.dialogBackgroundColor}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final double screenHeight = MediaQuery.of(context).size.height;
// //     final double screenWidth = MediaQuery.of(context).size.width;
// //     Color textColor = dialogBackgroundColor == Colors.white ? Colors.black : Colors.white;
// //
// //     return Scaffold(
// //       backgroundColor: Colors.transparent,
// //       body: Padding(
// //         padding: const EdgeInsets.all(18),
// //         child: Center(
// //           child: Dialog(
// //             child: Container(
// //               height: 270,
// //               width: 350,
// //               decoration: BoxDecoration(
// //                 color: dialogBackgroundColor,
// //                 borderRadius: BorderRadius.circular(10),
// //               ),
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                 children: [
// //                   Image.asset("assets/images/5013_Luno.png", height: 130, width: 120),
// //                   Text(
// //                     "Network error, please try again",
// //                     style: TextStyle(
// //                       fontSize: screenHeight * 0.014,
// //                       fontFamily: 'Montserrat',
// //                       wordSpacing: 2,
// //                       fontWeight: FontWeight.w600,
// //                       color: textColor,
// //                     ),
// //                   ),
// //                   ElevatedButton(
// //                     onPressed: () {
// //                       Navigator.pop(context);
// //                     },
// //                     style: ElevatedButton.styleFrom(
// //                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
// //                       backgroundColor: Color(0xFFE17055),
// //                       foregroundColor: Colors.white,
// //                       padding: EdgeInsets.symmetric(
// //                         vertical: screenHeight * 0.015,
// //                         horizontal: screenWidth * 0.070,
// //
// //                       ),
// //                     ),
// //                     child: Text(
// //                       "Ok",
// //                       style: TextStyle(
// //                         fontSize: screenHeight * 0.019,
// //                         fontFamily: 'Montserrat',
// //                         fontWeight: FontWeight.w600,
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
//
//
// import 'package:flutter/material.dart';
//
// class DialogBoxOne extends StatelessWidget {
//   final Color dialogBackgroundColor;
//   final String message; // Add this line
//
//   const DialogBoxOne({
//     Key? key,
//     required this.dialogBackgroundColor,
//     required this.message, // Add this line
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double screenWidth = MediaQuery.of(context).size.width;
//     Color textColor = dialogBackgroundColor == Colors.white ? Colors.black : Colors.white;
//
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Padding(
//         padding: const EdgeInsets.all(18),
//         child: Center(
//           child: Dialog(
//             child: Container(
//               height: 270,
//               width: 350,
//               decoration: BoxDecoration(
//                 color: dialogBackgroundColor,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               content: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Image.asset("assets/images/5013_Luno.png", height: 130, width: 120),
//                   Text(
//                     message, // Use the message parameter here
//                     style: TextStyle(
//                       fontSize: screenHeight * 0.014,
//                       fontFamily: 'Montserrat',
//                       wordSpacing: 2,
//                       fontWeight: FontWeight.w600,
//                       color: textColor,
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                       backgroundColor: Color(0xFFE17055),
//                       foregroundColor: Colors.white,
//                       padding: EdgeInsets.symmetric(
//                         vertical: screenHeight * 0.015,
//                         horizontal: screenWidth * 0.070,
//                       ),
//                     ),
//                     child: Text(
//                       "Ok",
//                       style: TextStyle(
//                         fontSize: screenHeight * 0.019,
//                         fontFamily: 'Montserrat',
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // import 'package:flutter/material.dart';
// //
// // class DialogBoxOne extends StatelessWidget {
// //   final Color dialogBackgroundColor;
// //   final String message;
// //   final String buttonText;
// //   final VoidCallback onButtonPressed;
// //
// //   const DialogBoxOne({
// //     Key? key,
// //     required this.dialogBackgroundColor,
// //     required this.message,
// //     required this.buttonText,
// //     required this.onButtonPressed,
// //   }) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final double screenHeight = MediaQuery.of(context).size.height;
// //     final double screenWidth = MediaQuery.of(context).size.width;
// //     Color textColor = dialogBackgroundColor == Colors.white ? Colors.black : Colors.white;
// //
// //     return Scaffold(
// //       backgroundColor: Colors.transparent,
// //       body: Padding(
// //         padding: const EdgeInsets.all(18),
// //         child: Center(
// //           child: Dialog(
// //             child: Container(
// //               height: 270,
// //               width: 350,
// //               decoration: BoxDecoration(
// //                 color: dialogBackgroundColor,
// //                 borderRadius: BorderRadius.circular(10),
// //               ),
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                 children: [
// //                   Image.asset("assets/images/5013_Luno.png", height: 130, width: 120),
// //                   Text(
// //                     message,
// //                     style: TextStyle(
// //                       fontSize: screenHeight * 0.014,
// //                       fontFamily: 'Montserrat',
// //                       wordSpacing: 2,
// //                       fontWeight: FontWeight.w600,
// //                       color: textColor,
// //                     ),
// //                     textAlign: TextAlign.center,
// //                   ),
// //                   ElevatedButton(
// //                     onPressed: onButtonPressed,
// //                     style: ElevatedButton.styleFrom(
// //                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
// //                       backgroundColor: Color(0xFFE17055),
// //                       foregroundColor: Colors.white,
// //                       padding: EdgeInsets.symmetric(
// //                         vertical: screenHeight * 0.015,
// //                         horizontal: screenWidth * 0.070,
// //                       ),
// //                     ),
// //                     child: Text(
// //                       buttonText,
// //                       style: TextStyle(
// //                         fontSize: screenHeight * 0.019,
// //                         fontFamily: 'Montserrat',
// //                         fontWeight: FontWeight.w600,
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//


import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final Color dialogBackgroundColor;
  final String message;

  const CustomAlertDialog({
    Key? key,
    required this.dialogBackgroundColor,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    Color textColor = dialogBackgroundColor == Colors.white ? Colors.black : Colors.white;

    return AlertDialog(
      backgroundColor: dialogBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Container(
        height: 270,
        width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/images/5013_Luno.png",
              height: 130,
              width: 120,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenHeight * 0.018,
                  fontFamily: 'Montserrat',
                  wordSpacing: 2,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                backgroundColor: Color(0xFFE17055),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.015,
                  horizontal: screenWidth * 0.070,
                ),
              ),
              child: Text(
                "Ok",
                style: TextStyle(
                  fontSize: screenHeight * 0.019,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}