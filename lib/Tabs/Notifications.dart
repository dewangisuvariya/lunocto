import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

import '../global/custom_button.dart';
import '../model/login_model.dart';

class NotificationsTab extends StatefulWidget {
  final LoginModel userData;
  NotificationsTab({required this.userData});
  @override
  _NotificationsTabState createState() => _NotificationsTabState();
}
final _controller = ValueNotifier<bool>(false);
class _NotificationsTabState extends State<NotificationsTab> {

  bool messageFromAdminEmail = false;
  bool messageFromAdminText = false;
  bool remindMeDailyEmail = false;
  bool remindMeDailyText = false;
  bool forTheJournalEmail = false;
  bool forTheJournalText = false;
  bool remindYourselfEmail = false;
  bool remindYourselfText = false;
  bool dailyPractisesEmail = false;
  bool dailyPractisesText = false;
  bool yourPrioritiesEmail = false;
  bool yourPrioritiesText = false;
  bool pushNotification = false;
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                color:  Color(0xFFEAEBED),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 0.9,color: Colors.black26),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Notifications",style: TextStyle(
                            color: Colors.black,
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.1,
                            wordSpacing: 1.7,
                            fontFamily: "Montserrat",
                          ),),
                          SizedBox(height: 10,),
                          Text("Messages from Admin ",style: customTextStyle(context)),
                          SizedBox(),
                          Text("Notifications when you receive a new message from your Admin",style: TextStyle(
                            color: Colors.black,
                            fontSize: labelFontSize,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1.1,
                            wordSpacing: 1.7,
                            fontFamily: "Montserrat",
                          ),),
                          Column(
                            // mainAxisSize: MainAxisSize.min, // Prevent extra spacing
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                               // mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(
                                    value: messageFromAdminEmail,
                                    activeColor: Colors.blue, // Color when checked
                                    checkColor: Colors.white, // Checkmark color
                                    side: BorderSide(color: Colors.grey, width: 2),
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        messageFromAdminEmail = newValue!;
                                      });
                                    },
                                  ),
                                  Text('Email',style: customLabelTextStyle(context)),
                                ],
                              ),
                              Row(
                                //mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(
                                    value: messageFromAdminText,
                                    activeColor: Colors.blue, // Color when checked
                                    checkColor: Colors.white, // Checkmark color
                                    side: BorderSide(color: Colors.grey, width: 2),
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        messageFromAdminText = newValue!;
                                      });
                                    },
                                  ),
                                  Text("Text message",style: customLabelTextStyle(context)),
                                ],
                              ),
                            ],
                          ),
                          customDivider(),
                          Text("Remind me daily",style: customTextStyle(context)),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: remindMeDailyEmail,
                                    activeColor: Colors.blue, // Color when checked
                                    checkColor: Colors.white, // Checkmark color
                                    side: BorderSide(color: Colors.grey, width: 2),
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        remindMeDailyEmail = newValue!;
                                      });
                                    },
                                  ),
                                  Text('Email',style: customLabelTextStyle(context)),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: remindMeDailyText,
                                    activeColor: Colors.blue, // Color when checked
                                    checkColor: Colors.white, // Checkmark color
                                    side: BorderSide(color: Colors.grey, width: 2),
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        remindMeDailyText = newValue!;
                                      });
                                    },
                                  ),
                                  Text("Text message",style: customLabelTextStyle(context)),
                                ],
                              ),
                            ],
                          ),
                          customDivider(),
                          Text("For the Journal",style: customTextStyle(context)),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: forTheJournalEmail,
                                    activeColor: Colors.blue, // Color when checked
                                    checkColor: Colors.white, // Checkmark color
                                    side: BorderSide(color: Colors.grey, width: 2),
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        forTheJournalEmail = newValue!;
                                      });
                                    },
                                  ),
                                  Text('Email',style: customLabelTextStyle(context)),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: forTheJournalText,
                                    activeColor: Colors.blue, // Color when checked
                                    checkColor: Colors.white, // Checkmark color
                                    side: BorderSide(color: Colors.grey, width: 2),
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        forTheJournalText = newValue!;
                                      });
                                    },
                                  ),
                                  Text("Text message",style: customLabelTextStyle(context)),
                                ],
                              ),
                            ],
                          ),
                          customDivider(),
                          Text("Remind yourself",style: customTextStyle(context)),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: remindYourselfEmail,
                                    activeColor: Colors.blue, // Color when checked
                                    checkColor: Colors.white, // Checkmark color
                                    side: BorderSide(color: Colors.grey, width: 2),
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        remindYourselfEmail = newValue!;
                                      });
                                    },
                                  ),
                                  Text('Email',style: customLabelTextStyle(context)),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: remindYourselfText,
                                    activeColor: Colors.blue, // Color when checked
                                    checkColor: Colors.white, // Checkmark color
                                    side: BorderSide(color: Colors.grey, width: 2),
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        remindYourselfText = newValue!;
                                      });
                                    },
                                  ),
                                  Text("Text message",style: customLabelTextStyle(context)),
                                ],
                              ),
                            ],
                          ),
                          customDivider(),
                          Text("Daily practises",style: customTextStyle(context)),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: dailyPractisesEmail,
                                    activeColor: Colors.blue, // Color when checked
                                    checkColor: Colors.white, // Checkmark color
                                    side: BorderSide(color: Colors.grey, width: 2),
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        dailyPractisesEmail = newValue!;
                                      });
                                    },
                                  ),
                                  Text('Email',style: customLabelTextStyle(context)),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: dailyPractisesText,
                                    activeColor: Colors.blue, // Color when checked
                                    checkColor: Colors.white, // Checkmark color
                                    side: BorderSide(color: Colors.grey, width: 2),
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        dailyPractisesText = newValue!;
                                      });
                                    },
                                  ),
                                  Text("Text message",style: customLabelTextStyle(context)),
                                ],
                              ),
                            ],
                          ),
                          customDivider(),
                          Text("Your Priorities",style: customTextStyle(context)),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: yourPrioritiesEmail,
                                    activeColor: Colors.blue, // Color when checked
                                    checkColor: Colors.white, // Checkmark color
                                    side: BorderSide(color: Colors.grey, width: 2),
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        yourPrioritiesEmail = newValue!;
                                      });
                                    },
                                  ),
                                  Text('Email',style: customLabelTextStyle(context)),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: yourPrioritiesText,
                                    activeColor: Colors.blue, // Color when checked
                                    checkColor: Colors.white, // Checkmark color
                                    side: BorderSide(color: Colors.grey, width: 2),
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        yourPrioritiesText = newValue!;
                                      });
                                    },
                                  ),
                                  Text("Text message",style: customLabelTextStyle(context)),
                                ],
                              ),
                            ],
                          ),
                          customDivider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex:3,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  //color: Colors.green,
                                  child: Column(
                                   //mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Phone number to text",style: TextStyle(
                                        color: Colors.black,
                                        fontSize: labelFontSize,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.7,
                                        wordSpacing: 1.7,
                                        fontFamily: "Montserrat",
                                      ),),
                                      Text(widget.userData.emergencyContact,),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                 // color: Colors.amber,
                                  child:OutlinedButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                      backgroundColor: Color(0xFFEAEBED),
                                      foregroundColor: Colors.black,
                                      padding: EdgeInsets.symmetric(
                                        vertical: screenHeight * 0.010,
                                        horizontal: screenWidth * 0.030,
                                      ),
                                      side: BorderSide(color: Colors.black12,width: 1.2),
                                    ),
                                    child: Text(
                                      "Set Pin",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        wordSpacing: 2,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  // color: Colors.amber,
                                  child: Text("Push notifications are turned on ",style: TextStyle(
                                    color: Colors.black,
                                    fontSize: labelFontSize,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.7,
                                    wordSpacing: 1.7,
                                    fontFamily: "Montserrat",
                                  ),),
                                ),
                              ),
                              Container(
                                // color: Colors.green,
                                child: AdvancedSwitch(
                                  controller: _controller,
                                  activeColor: Colors.blue,
                                  inactiveColor:Color(0xFFe6e8ea),
                                  borderRadius: BorderRadius.circular(60),
                                  width: 40,
                                  height: 25,
                                  enabled: true,
                                  onChanged: (value) {
                                    print('Switch state: $value');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    CustomButton(
                      text: "SAVE NOTIFICATION SETTING ",
                      onPressed: (){},
                      backgroundColor: Color(0xFFE17055), // Orange
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  TextStyle customTextStyle(BuildContext context,{
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w800,
    //double letterSpacing = 1.1,
    //double wordSpacing = 1.7,
    String fontFamily = "Montserrat",
  })
  {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize;

    if (screenWidth < 600) {
      fontSize = 14; // Small screen
    } else if (screenWidth < 1200) {
      fontSize = 16; // Medium screen
    } else {
      fontSize = 18; // Large screen
    }
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      //letterSpacing: letterSpacing,
    //  wordSpacing: wordSpacing,
      fontFamily: fontFamily,
    );}

  Widget customDivider() {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Divider(
        color: Colors.black12,
        thickness: 1,
      ),
    );
  }

  TextStyle customLabelTextStyle(BuildContext context, {
    Color color = Colors.black,
    double letterSpacing = 0.6,
    double wordSpacing = 1.7,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize;

    if (screenWidth < 600) {
      fontSize = 16; // Small screen
    } else if (screenWidth < 1200) {
      fontSize = 18; // Medium screen
    } else {
      fontSize = 20; // Large screen
    }

    return TextStyle(
      fontSize: fontSize,
      color: color,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w500
    );
  }


}