import 'package:flutter/material.dart';

class DialogBoxFour extends StatelessWidget {
  const DialogBoxFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF071330),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/5013_Luno.png",height: 200,width: 200,),
              SizedBox(height: 20,),
              Text("Our application is having issues right now,\n      stay with us for more information",style: TextStyle(fontSize: 15, fontFamily: 'Montserrat',
                  wordSpacing: 2,
                  color: Colors.white,
                  fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
