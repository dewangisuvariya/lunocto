import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../global/ResponsiveButtonWidget.dart';
import '../global/custom_button.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    double titleFontSize;
    double subtitleFontSize;
    double labelFontSize;
    if (screenWidth < 600) {
      titleFontSize = 28; // Small screen
      subtitleFontSize = 14;
      labelFontSize =9;// Small screen
    } else if (screenWidth < 1200) {
      titleFontSize = 40; // Medium screen
      subtitleFontSize = 20;
      labelFontSize = 13;// Medium screen
    } else {
      titleFontSize = 45; // Large screen
      subtitleFontSize = 30;
      labelFontSize= 15;// Large screen
    }
    double baseFontSize =8.0; // Base font size in points
    double aspectRatio = screenWidth / screenHeight; // Calculate aspect ratio
    double buttonFonts;

    // Adjust font size based on aspect ratio
    if (aspectRatio == (20 / 9)) {
      buttonFonts = 8.0; // Font size for 21:9 aspect ratio
    } else {
      buttonFonts = 11.0; // Font size for other aspect ratios
    }


    return Scaffold(
      backgroundColor: Color(0xFF071330),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
           //  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: screenHeight * 0.13,
                width: screenHeight * 0.13,
                child: Image(
                  image: AssetImage("assets/images/lunOcto_Logo_BG1.png"),
                ),
              ),
              SizedBox(height: screenHeight * 0.040),
              Text(
                "Your wellness is our \n primary mission. ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: titleFontSize,
                  wordSpacing: 2,
                  fontFamily: "Montserrat",
                ),
              ),
              SizedBox(height: screenHeight * 0.050),
              Text("8 dimensions of wellness.",textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: subtitleFontSize,
                  wordSpacing: 2,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat",
                ),),
              SizedBox(height: screenHeight * 0.020),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: wellnessIcon("assets/images/2431_Occupational.png", "Occupational",context)),

                    Expanded(child: wellnessIcon("assets/images/4418_lntellectual.png", "Intellectual",context)),

                     Expanded(child: wellnessIcon("assets/images/8887_Environmental.png", "Environmental",context)),
                    // Image.asset("assets/images/2431_Occupational.png"),
                    // Image.asset("assets/images/4418_lntellectual.png"),
                    // Image.asset("")
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.020),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: wellnessIcon("assets/images/3614_Financial.png", "Financial",context)),

                  Expanded(child: wellnessIcon("assets/images/8442_Social.png", "Social",context)),

                  Expanded(child: wellnessIcon("assets/images/484_Physical.png", "Physical",context)),
                ],
              ),
              SizedBox(height: screenHeight * 0.020),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    wellnessIcon("assets/images/780_Emotional.png", "Emotional",context),
                    SizedBox(width: screenWidth * 0.20),
                     wellnessIcon("assets/images/1282_Spiritual.png", "Spiritual",context),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.020),
                Row(
                  children: [
                    Expanded(
                      child:ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).pushNamed("LoginScreen");
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          foregroundColor: Colors.black,
                          backgroundColor: Color(0xFFEAEBED),
                          minimumSize: Size(screenHeight*0.60, 45),
                          fixedSize: Size(screenHeight*0.60, 50),
                        ),
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(fontSize: 10, color: Colors.black, fontFamily: 'Montserrat',
                              letterSpacing: 1,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(width:screenWidth * 0.020,),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          print("$aspectRatio");
                          Navigator.of(context).pushNamed("StudentSignupScreen");
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFFE17055),
                          minimumSize: Size(screenHeight*0.60, 45),
                          fixedSize: Size(screenHeight*0.60, 50),
                        ),
                        child: AutoSizeText(
                          "CREATE ACCOUNT",
                          maxFontSize: 10,
                          minFontSize: 8,
                          style: TextStyle(fontSize: 10, color: Colors.white, fontFamily: 'Montserrat',
                              letterSpacing: 1,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              //ResponsiveButtonWidget(aspectRatio: aspectRatio),
              SizedBox(height: screenHeight * 0.040),
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
    );
  }

  // Widget wellnessIcon(String iconPath, String label) {
  //   return Column(
  //     children: [
  //       Container(
  //         width: 50,
  //         height: 50,
  //         decoration: BoxDecoration(
  //           // color: Colors.pinkAccent,
  //         ),
  //         child: Center(
  //           child: Image.asset(iconPath,fit: BoxFit.cover,),
  //         ),
  //       ),
  //       const SizedBox(height: 8),
  //       Text(
  //         label,
  //         style: TextStyle(
  //           color: Colors.white,
  //           fontSize: 12,
  //           fontFamily: "Montserrat",
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget wellnessIcon(String iconPath, String label, BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    double fontSize = screenWidth < 600 ? 12 : screenWidth < 1200 ? 16 : 20;

    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            // Optional: Add decoration like border or background color
          ),
          child: Center(
            child: Image.asset(iconPath, fit: BoxFit.cover),
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontFamily: "Montserrat",
          ),
        ),
      ],
    );
  }
}
