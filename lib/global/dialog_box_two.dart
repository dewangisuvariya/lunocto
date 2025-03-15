// import 'package:flutter/material.dart';
//
// class DialogBoxTwo extends StatefulWidget {
//   const DialogBoxTwo({super.key});
//
//   @override
//   State<DialogBoxTwo> createState() => _DialogBoxTwoState();
// }
//
// class _DialogBoxTwoState extends State<DialogBoxTwo> {
//   final Color backgroundColor = Color(0xFF071330);
//   @override
//   Widget build(BuildContext context) {
//     Color containerColor = backgroundColor == Color(0xFF071330) ? Colors.white : Color(0xFF071330);
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double screenWidth = MediaQuery.of(context).size.width;
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
//                 color: containerColor,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset("assets/images/499_Original_Luno.png",height: 100,width: 120,),
//                   SizedBox(height: 10,),
//                   Text("Your changes have been  ",style: TextStyle(fontSize:15, fontFamily: 'Montserrat',
//                       wordSpacing: 2,
//                       fontWeight: FontWeight.w600)),
//                   SizedBox(height: 10,),
//                   Text(" saved successfully. ",style: TextStyle(fontSize:15, fontFamily: 'Montserrat',
//                       wordSpacing: 2,
//                       fontWeight: FontWeight.w600)),
//                   SizedBox(height: 15,),
//                   ElevatedButton(onPressed: (){
//                     Navigator.pop(context);
//                   },
//                     style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                       backgroundColor: Color(0xFFE17055),
//                       foregroundColor: Colors.white,
//                       padding: EdgeInsets.symmetric(
//                         vertical: screenHeight *  0.015,
//                         horizontal: screenHeight *  0.075,
//                       ),
//
//                     ), child: Text("Ok",style: TextStyle(fontSize: screenHeight *0.020, fontFamily: 'Montserrat',
//
//                         fontWeight: FontWeight.w600),),),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class DialogBoxTwo extends StatelessWidget {
  final Color dialogBackgroundColor;

  const DialogBoxTwo({Key? key, required this.dialogBackgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    Color textColor = dialogBackgroundColor == Colors.white ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Dialog(
            child: Container(
              height: 270,
              width: 350,
              decoration: BoxDecoration(
                color: dialogBackgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/499_Original_Luno.png", height: 100, width: 120),
                  SizedBox(height: 10),
                  Text(
                    "Your changes have been",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Montserrat',
                      wordSpacing: 2,
                      fontWeight: FontWeight.w600,
                      color: textColor
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "saved successfully.",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Montserrat',
                      wordSpacing: 2,
                      fontWeight: FontWeight.w600,
                        color: textColor
                    ),
                  ),
                  SizedBox(height: 15),
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
                        horizontal: screenHeight * 0.075,
                      ),
                    ),
                    child: Text(
                      "Ok",
                      style: TextStyle(
                        fontSize: screenHeight * 0.020,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}