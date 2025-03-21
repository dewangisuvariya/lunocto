import 'dart:async';

import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacementNamed('GetStartedScreen');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFF071330),
      body: Center(
        child:
          Image.asset("assets/images/Splash_Logo.png",height: 200,width: 200,),

      ),
    );
  }
}