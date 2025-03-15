import 'package:flutter/material.dart';
import 'package:lunocto/global/custom_button.dart';

import '../model/login_model.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late LoginModel userData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Retrieve the LoginModel instance from the arguments
    userData = ModalRoute.of(context)?.settings.arguments as LoginModel;
  }
  @override
  Widget build(BuildContext context) {

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    double titleFontSize;
    double subtitleFontSize;
    if (screenWidth < 600) {
      titleFontSize = 25; // Small screen
      subtitleFontSize = 14; // Small screen
    } else if (screenWidth < 1200) {
      titleFontSize = 40; // Medium screen
      subtitleFontSize = 20; // Medium screen
    } else {
      titleFontSize = 45; // Large screen
      subtitleFontSize = 30; // Large screen
    }
    return Scaffold(

      backgroundColor: Color(0xFF071330),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: screenHeight * 0.13,
                  width: screenHeight * 0.13,
                  child: Image(
                    image: AssetImage("assets/images/lunOcto_Logo_BG1.png"),
                  ),
                ),
                SizedBox(height: screenHeight*0.022,),

                Text(
                  "Welcome to lunOcto",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: titleFontSize,
                    wordSpacing: 2,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Montserrat",
                  ),
                ),
                SizedBox(height: screenHeight*0.012,),
                Text(
                  "Rest assured...",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:subtitleFontSize,
                    wordSpacing: 2,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Montserrat",
                  ),
                ),
                SizedBox(height: screenHeight*0.035,),
                Text(
                  "Your Data is ",
                  style: TextStyle(
                    color: Color(0xFFE17055),
                    fontSize: titleFontSize,
                    wordSpacing: 2,
                    fontWeight: FontWeight.w800,
                    fontFamily: "Montserrat",
                  ),
                ),
                SizedBox(height: screenHeight*0.012,),
                Text(
                  " Encrypted and Secure ",
                  style: TextStyle(
                    color: Color(0xFFE17055),
                    fontSize: titleFontSize,
                    wordSpacing: 2,
                    fontWeight: FontWeight.w800,
                    fontFamily: "Montserrat",
                  ),
                ),
                SizedBox(height: screenHeight*0.030,),
                Text("lunOcto is:",style: TextStyle(
                  color: Colors.white,
                  fontSize: subtitleFontSize,
                  wordSpacing: 2,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Montserrat",
                ),),
            
                SizedBox(height: screenHeight*0.06,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/8426_Hipaa_Compliant.png",height: 40,width: 40,),
                    SizedBox(width: screenWidth*0.015,),
                    Text(
                      "Hipaa Compliant",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: subtitleFontSize,
                        wordSpacing: 2,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Montserrat",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/8168_file-lock.png",height: 40,width: 40,),
                    SizedBox(width: screenWidth*0.015,),
                    Text(
                      "GDPR Regulated",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: subtitleFontSize,
                        wordSpacing: 2,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Montserrat",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight*0.17,),
                CustomButton(
                  text: "LET'S BEGIN",
                  onPressed: () {
                    // Navigator.of(context).pushNamed("HomeScreen");
                    Navigator.pushNamed(
                      context,
                      'HomeScreen',
                      arguments: userData, // Pass user data using ModalRoute
                    );
                  },
                  backgroundColor: Color(0xFFE17055),
                  textColor: Colors.white,
                ),
                SizedBox(height: screenHeight*0.018,),
                TextButton(
                  onPressed: () {
                    print("titleFontSize $titleFontSize");
                  },
                  child: Text(
                    "Learn more",
                    style: TextStyle(
                      color: Color(0xFFE17055),
                      fontSize: subtitleFontSize,
                      wordSpacing: 2,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat",
                    ),
                  ),
                  ),
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
