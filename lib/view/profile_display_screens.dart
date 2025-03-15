import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../Tabs/Account_tab.dart';
import '../Tabs/EmergencyContactTab.dart';
import '../Tabs/Notifications.dart';
import '../global/bottom_navigation_bar.dart';
import '../model/login_model.dart';


class AccountScreen extends StatefulWidget {

  final LoginModel userData;
  const AccountScreen({Key? key, required this.userData}) : super(key: key);
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> with SingleTickerProviderStateMixin {
  String capitalizeWords(String text) {
    return text.split(' ').map((word) => word[0].toUpperCase() + word.substring(1)).join(' ');
  }
  late TextEditingController userNameController;
  late TabController _tabController;
  bool isLoading = true;
  int _selectedIndex = 0;
  File? _imageFile;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  void _onNavBarTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Add navigation logic here if needed
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final userData = widget.userData;

    if (userData == null) {
      return Scaffold(
        body: Center(
          child: Text("No user data available", style: TextStyle(color: Colors.white)),
        ),
      );
    }

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF071330),
      bottomNavigationBar: BottomNavBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onNavBarTapped,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(height: 70,
                    width: 200,
                    //color: Colors.amber,
                          alignment: Alignment.centerLeft,
                    child: GestureDetector(child: Icon(Icons.arrow_back,color: Colors.white,size: 25,),
                        onTap: (){
                          Navigator.of(context).pop();
                        }),
                  ),
                ),
              ),
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
      Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: _imageFile != null
                ? FileImage(_imageFile!) as ImageProvider
                : (userData.studentImage != null
                ? NetworkImage("https://phplaravel-1298719-4771829.cloudwaysapps.com/${userData.studentImage}")
                : AssetImage("assets/images/3342_User_Image.png")) as ImageProvider,
          ),
          Positioned(
            bottom: 0,
            right: 1,
            child: GestureDetector(
              onTap: () {
                _pickImage();
                // Implement your edit action here
                print("Edit button tapped");
              },
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:  Color(0xFFEAEBED),
                ),
                child: Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
          ),
          ],
      ),
          SizedBox(height: screenHeight*0.005),
          Text(
            capitalizeWords(userData.studentName),  // Update with the user's name
           style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.05,
            wordSpacing: 2,
            fontFamily: "Montserrat",
             fontWeight: FontWeight.w600,
          ),
          ),

          TabBar(
            labelColor: Color(0xFFE17055),
            unselectedLabelColor: Colors.white38,
            indicatorColor: Color(0xFFE17055),
            indicatorSize: TabBarIndicatorSize.label,
            tabAlignment: TabAlignment.center,
            isScrollable: true, //
            controller: _tabController,
            dividerColor: Color(0xFF071330),
            tabs: [
              Tab(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 0), // No extra spacing
                  child: Text(
                    'Account',
                    style: TextStyle(
                        fontSize: 15,
                        wordSpacing: 2,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ),
              Tab(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 0), // No extra spacing
                  child: Text(
                    'Emergency Contact',
                    style: TextStyle(
                        fontSize: 15,
                        wordSpacing: 1.2,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ),
              Tab(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 0), // No extra spacing
                  child: Text(
                    'Notifications',
                    style: TextStyle(
                        fontSize: 15,
                        wordSpacing: 2,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                AccountTab(
                userData: userData,
                ),
                EmergencyContactTab(
                  userData: userData,
                ),
                NotificationsTab(
                  userData: userData,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}








