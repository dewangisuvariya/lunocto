// import 'package:flutter/material.dart';
// //
// // class ResponsiveButtonWidget extends StatelessWidget {
// //   final double aspectRatio; // Assume this is passed to the widget
// //
// //   ResponsiveButtonWidget({required this.aspectRatio});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     double buttonFontSize;
// //
// //     // Set font size based on the provided aspect ratio
// //     if ((aspectRatio - (23 / 9)).abs() < 0.01) {
// //       buttonFontSize = 8.0; // Font size for 20:9 aspect ratio
// //     } else {
// //       buttonFontSize = 15; // Font size for other aspect ratios
// //     }
// //
// //     return Row(
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       children: [
// //         Expanded(
// //           child: ElevatedButton(
// //             onPressed: () {
// //               // Your action here
// //             },
// //             style: ElevatedButton.styleFrom(
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.all(Radius.circular(6)),
// //               ),
// //               foregroundColor: Colors.black,
// //               backgroundColor: Color(0xFFEAEBED),
// //               minimumSize: Size(200, 45), // Example size
// //               fixedSize: Size(200, 50), // Example size
// //             ),
// //             child: Text(
// //               "SIGN IN",
// //               style: TextStyle(
// //                 fontSize: buttonFontSize,
// //                 color: Colors.black,
// //                 fontFamily: 'Montserrat',
// //                 letterSpacing: 1,
// //                 fontWeight: FontWeight.w600,
// //               ),
// //             ),
// //           ),
// //         ),
// //         SizedBox(width: 20), // Example spacing
// //         Expanded(
// //           child: ElevatedButton(
// //             onPressed: () {
// //               // Your action here
// //             },
// //             style: ElevatedButton.styleFrom(
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.all(Radius.circular(6)),
// //               ),
// //               foregroundColor: Colors.white,
// //               backgroundColor: Color(0xFFE17055),
// //               minimumSize: Size(200, 45), // Example size
// //               fixedSize: Size(200, 50), // Example size
// //             ),
// //             child: Text(
// //               "CREATE ACCOUNT",
// //               style: TextStyle(
// //                 fontSize: buttonFontSize,
// //                 color: Colors.white,
// //                 fontFamily: 'Montserrat',
// //                 letterSpacing: 1,
// //                 fontWeight: FontWeight.w600,
// //               ),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }


import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ResponsiveButtonWidget extends StatelessWidget {
  final double aspectRatio;

  ResponsiveButtonWidget({required this.aspectRatio});

  @override
  Widget build(BuildContext context) {
    //double buttonFontSize;

    // Set font size based on the provided aspect ratio
    // if ((aspectRatio - (23 / 9)).abs() < 0.01) {
    //   buttonFontSize = 8.0; // Font size for 20:9 aspect ratio
    // } else {
    //   buttonFontSize = 15; // Font size for other aspect ratios
    // }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // Your action here
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              foregroundColor: Colors.black,
              backgroundColor: Color(0xFFEAEBED),
              minimumSize: Size(200, 45),
              fixedSize: Size(200, 50),
            ),
            child: AutoSizeText(
              "SIGN IN",
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
                fontFamily: 'Montserrat',
                letterSpacing: 1,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1, // Ensure it stays on one line
              minFontSize: 8, // Prevent text from being too small
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // Your action here
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              foregroundColor: Colors.white,
              backgroundColor: Color(0xFFE17055),
              minimumSize: Size(200, 45),
              fixedSize: Size(200, 50),
            ),
            child: AutoSizeText(
              "CREATE ACCOUNT",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontFamily: 'Montserrat',
                letterSpacing: 1,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              minFontSize: 11,
            ),
          ),
        ),
      ],
    );
  }
}
