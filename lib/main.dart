import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lunocto/model/login_model.dart';
import 'package:lunocto/view/get_started_screen.dart';
import 'package:lunocto/view/home_screen.dart';
import 'package:lunocto/view/login_screen.dart';
import 'package:lunocto/view/login_with_pin.dart';
import 'package:lunocto/view/profile_display_screens.dart';
import 'package:lunocto/view/splash_screen.dart';
import 'package:lunocto/view/student_signup_screen.dart';
import 'package:lunocto/view/welcome_screen.dart';

import 'global/dialog_box_four.dart';
import 'global/dialog_box_one.dart';
import 'global/dialog_box_two.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
 // runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: GetStartedScreen(),
      initialRoute: "GetStartedScreen",
      routes: {
          "LoginScreen": (context) => LoginScreen(),
          "StudentSignupScreen": (context) => StudentSignupScreen( ),
         "SplashScreen":(context)=>SplashScreen(),
         "HomeScreen":(context)=>HomeScreen(),
          "GetStartedScreen":(context)=>GetStartedScreen(),
          "WelcomeScreen":(context)=>WelcomeScreen(),
          "LoginWithPin":(context)=>LoginWithPin(),
         //"AccountScreen":(context)=>AccountScreen(userData: ,),
      }, // Initial screen
    );
  }
}

