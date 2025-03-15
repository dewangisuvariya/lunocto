// import 'package:flutter/material.dart';
//
// class ExitDialog extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double screenWidth = MediaQuery.of(context).size.width;
//     return Dialog(
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: Padding(
//         padding: const EdgeInsets.all(30.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               "Are you sure you want to exit ?",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                     backgroundColor: Color(0xFFE17055),
//                     foregroundColor: Colors.white,
//                     padding: EdgeInsets.symmetric(
//                       vertical: 15,
//                       horizontal: 40,
//
//                     ),
//                   ),
//                   child: Text(
//                     "Yes",
//                     style: TextStyle(
//                       fontSize: screenHeight * 0.017,
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                     backgroundColor: Color(0xFFE17055),
//                     foregroundColor: Colors.white,
//                     padding: EdgeInsets.symmetric(
//                       vertical: 15,
//                       horizontal: 40,
//
//                     ),
//                   ),
//                   child: Text(
//                     "No",
//                     style: TextStyle(
//                       fontSize: screenHeight * 0.017,
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class ExitDialog extends StatelessWidget {
  final Color backgroundColor;

  const ExitDialog({Key? key, required this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    // Determine text color based on the dialog background color
    Color textColor = backgroundColor == Colors.white ? Colors.black : Colors.white;

    return Dialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Are you sure you want to exit?",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: textColor, // Use the determined text color
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle exit logic here
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    backgroundColor: Color(0xFFE17055),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 40,
                    ),
                  ),
                  child: Text(
                    "Yes",
                    style: TextStyle(
                      fontSize: screenHeight * 0.017,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
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
                      vertical: 15,
                      horizontal: 40,
                    ),
                  ),
                  child: Text(
                    "No",
                    style: TextStyle(
                      fontSize: screenHeight * 0.017,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}