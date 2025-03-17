import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:lunocto/view/profile_display_screens.dart';

import '../model/login_model.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _controller = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {


    final LoginModel? loginModel = ModalRoute.of(context)?.settings.arguments as LoginModel?;


    if (loginModel == null) {
      return Scaffold(
        body: Center(
          child: Text("User  data is not available.", style: TextStyle(color: Colors.white)),
        ),
      );
    }

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;


    String capitalizeWords(String text) {
      return text.split(' ').map((word) => word[0].toUpperCase() + word.substring(1)).join(' ');
    }
    return Scaffold(
      backgroundColor: Color(0xFF071330),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Section
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    Expanded(
                      child: Container(
                        height:screenHeight * 0.13,width:screenHeight * 0.13,
                        child: Image(
                          image: AssetImage("assets/images/lunOcto_Logo_BG1.png"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(child: Image.asset("assets/images/9344_bell.png",height:22,),
                                      onTap: (){
                                        // Navigator.of(context).pop();
                                      }),
                                ),
                        ),
                        ),
        
                  ],
        
                ),
              ),
              Container(
                height: screenHeight *0.15,
                width: double.infinity,
                color: const Color(0xFF1f2a44),
                padding:  EdgeInsets.symmetric(horizontal: 20, vertical: screenHeight *0.010),
                child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            // Container(
                            //   height: screenHeight * 0.09,
                            //   child: Image.asset("assets/images/3342_User_Image.png",fit: BoxFit.cover),
                            //   decoration: BoxDecoration(
                            //     shape: BoxShape.circle,
                            //
                            //   ),

                            Container(
                              height: screenHeight * 0.09,
                              width: screenHeight * 0.09, // Ensure it's a perfect circle
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: loginModel?.studentImage != null
                                      ? NetworkImage("https://phplaravel-1298719-4771829.cloudwaysapps.com/${loginModel!.studentImage!}") // Load image from API
                                      : AssetImage("assets/images/3342_User_Image.png") as ImageProvider, // Default image
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: screenHeight *0.015),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  capitalizeWords(loginModel.studentName ?? ""),
                                  style: TextStyle(fontSize: screenHeight*0.020, color: Colors.white, fontFamily: 'Montserrat',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w800),
                                ),
                                SizedBox(height: 02,),
                                Text(
                                  loginModel.emergencyContact?? "",
                                  style:  TextStyle(fontSize:screenHeight*0.016, color: Colors.white, fontFamily: 'Montserrat',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 02,),
                                Text(
                                  loginModel.email?? "",
                                  style:  TextStyle(fontSize: screenHeight*0.014, color: Colors.white, fontFamily: 'Montserrat',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                         //SizedBox(width: screenHeight *0.008),
        
                        //Spacer(),
        
                        IconButton(onPressed: (){
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => AccountScreen(userData: loginModel,),
                          //     settings: RouteSettings(arguments: loginModel),
                          //   ),
                          // );
                          if (loginModel != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AccountScreen(userData: loginModel),
                              ),
                            );
                          } else {
                            // Handle the case where loginModel is null
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("User  data is not available.")),
                            );
                          }
                        }, icon: Icon(Icons.arrow_forward_ios, color: Colors.white,size: screenHeight*0.030,))
                      ],
                    ),
              ),
              // Mode Section
                SizedBox(height: 25,),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                ),
                child: Column(
                  children: [
                   Container(
                     alignment: Alignment.centerLeft,
                     height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xFFf6f8fc),
                      borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
                  ),
                   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "Mode",
                    style: const  TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.black,
                      wordSpacing: 0.5,
                      letterSpacing: 0.5,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                  ),
                  ),
                ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(left: 18,right: 18),
                      child: Container(
                        height: 50,
                        // width: 350,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300, width: 1.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
        
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/8807_Exclude.png",height: 30,width: 30,),
                               SizedBox(width: 15,),
                               Text(
                                "Dark mode",
                                style:  const TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Colors.black,
                                    overflow: TextOverflow.ellipsis,
                                    wordSpacing: 0.2,
                                    letterSpacing: 0.4,
                                    fontSize: 16,
                                  // fontWeight: FontWeight.w600
                                ),
                              ),
                          Spacer(),
                          AdvancedSwitch(
                            controller: _controller,
                            activeColor: Colors.green,
                            inactiveColor:Color(0xFFf6f8fc),
                            borderRadius: BorderRadius.circular(60),
                            width: 41,
                            height: 25,
                            enabled: true,
                            onChanged: (value) {
                              print('Switch state: $value');
                            },
                          ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    _sectionTitle("Explore"),
                    const SizedBox(height: 2),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color(0xFFe2e0df), width: 1.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min, // Ensures minimal spacing
                          children: List.generate(
                            menuItemsGroup1.length * 2 - 1, // Alternating items and dividers
                                (index) {
                              if (index.isEven) {
                                final itemIndex = index ~/ 2;
                                final item = menuItemsGroup1[itemIndex];
                                return _menuItem(item.imagePath!, item.title);
                              } else {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 45, right: 15),
                                  child: Divider(color: Color(0xFFf5f5f5), thickness: 1),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
        
                    const SizedBox(height: 2), // Spacing between groups
                    // Second Group with Bottom Border - Using ListView.builder
                    _sectionTitle("Support"),
                    const SizedBox(height: 2),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        decoration: BoxDecoration(
                         // color: Colors.green,
                          border: Border.all(color: Color(0xFFe2e0df), width: 1.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min, // Ensures it takes the minimum space required
                          children: List.generate(
                            menuItemsGroup2.length * 2 - 1, // Adjust count for separators
                                (index) {
                              if (index.isEven) {
                                final itemIndex = index ~/ 2;
                                final item = menuItemsGroup2[itemIndex];
                                return _menuItem(item.imagePath!, item.title);
                              } else {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 45, right: 15),
                                  child: Divider(color: Color(0xFFf5f5f5), thickness: 1),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
        
        
                  ],
                ),
              ),
              // Explore Section
        
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuItem(String imagePath, String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5), // Add horizontal padding
      child: SizedBox(
          height:50,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 15), // Adjust spacing
          leading: Container(
            height: 30,
            width: 25,
            child: Image.asset(imagePath),
          ),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    color: Colors.black,
                    wordSpacing: 0.2,
                    letterSpacing: 0.3,
                    fontSize: 15,
                    overflow: TextOverflow.ellipsis,
                    //fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 18),
          ),
          onTap: () {},
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Container(
alignment: Alignment.centerLeft,
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFf6f8fc)
      ),
       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: "Montserrat",
          color: Colors.black,
          wordSpacing: 0.5,
          letterSpacing: 0.5,
          fontSize: 18,
          fontWeight: FontWeight.w600,

      ),


      ),
    );
  }
}

// **First Group with Border**
final List<MenuItem> menuItemsGroup1 = [
  MenuItem(imagePath: "assets/images/1034_user_(9).png", title: "My Account"),
  MenuItem(imagePath: "assets/images/1034_user_(9).png", title: "Notice Board"),
  MenuItem(imagePath: "assets/images/3587_Logo.png", title: "8 Dimensions"),
  MenuItem(imagePath: "assets/images/9592_Challenges.png", title: "Challenge the 8 Dimensions"),
  MenuItem(imagePath: "assets/images/577_Test.png", title: "CES-D-R 10 Test"),
  MenuItem(imagePath: "assets/images/8307_home.png", title: "Home Exercises"),
  MenuItem(imagePath: "assets/images/577_Test.png", title:"GAD-7 Anxiety Test"),
  MenuItem(imagePath: "assets/images/4802_Therapist.png", title: "Your Therapist/Coach"),
  MenuItem(imagePath: "assets/images/5939_calculator.png", title:"What is the IunOcto Calculator"),
  MenuItem(imagePath: "assets/images/9250_user-question.png", title: "Custom Survey"),
  MenuItem(imagePath: "assets/images/3739_lunoSafe_Icon.png", title: "What is LunoSafe?"),
  MenuItem(imagePath: "assets/images/3684_Group_866.png", title: "IunOcto Counselor"),
  MenuItem(imagePath: "assets/images/7861_Positive_reminder_icon.png", title: "Positive Reminders"),
  MenuItem(imagePath: "assets/images/6539_annotation-user.png", title: "Request for a Therapist/Coach"),
  MenuItem(imagePath: "assets/images/6539_annotation-user.png", title: "Request to change Therapist/Coach"),
  MenuItem(imagePath: "assets/images/5383_Livestream_icon.png", title: "Live Stream"),
  MenuItem(imagePath: "assets/images/8717_seal-question.png", title: "Book an Appointment"),
  MenuItem(imagePath: "assets/images/8259_image-square.png", title: "Media Library"),
  MenuItem(imagePath: "assets/images/186_Clock.png", title: "Sleep Room"),
  MenuItem(imagePath: "assets/images/5895_arrow-right-to-bracket.png", title:"Check in with Luno"),
  MenuItem(imagePath: "assets/images/577_Test.png", title:  "Check in History"),
  MenuItem(imagePath: "assets/images/551_Journal.png", title: "Check In/Journal"),
  MenuItem(imagePath: "assets/images/8841_Past_Enteries.png", title: "Past Entries"),
  MenuItem(imagePath: "assets/images/5361_clipboard-list.png", title: "Daily Practices"),
  MenuItem(imagePath: "assets/images/3835_clipboard-list-alt.png", title: "Wellness Assessment"),
  MenuItem(imagePath: "assets/images/3835_clipboard-list-alt.png", title: "Have an idea?"),
  MenuItem(imagePath: "assets/images/3835_clipboard-list-alt.png", title:  "Crisis Helplines"),
  MenuItem(imagePath: "assets/images/931_settings.png", title: "Settings"),
];

// **Second Group with Bottom Border**
final List<MenuItem> menuItemsGroup2 = [
  MenuItem(imagePath: "assets/images/8717_seal-question.png", title:  "FAQ"),
  MenuItem(imagePath: "assets/images/3727_mail-alt-2.png", title: "Contact Us"),
  MenuItem(imagePath: "assets/images/1883_Legals_file.png", title:  "Legals"),
];

class MenuItem {
  final String? imagePath;
  final String title;

  MenuItem({this.imagePath, required this.title});
}


