
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  Widget buildNavItem(String unselectedAsset, String selectedAsset, String label, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          isSelected ? selectedAsset : unselectedAsset, // Switch image based on selection
          width: 28,
          height: 28,
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: isSelected ? Colors.white : Colors.grey.shade300, // Change color when selected
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.normal,
              fontFamily: "Montserrat"
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFF020a1e),
     // selectedItemColor: Colors.orangeAccent,
      unselectedItemColor: Colors.white,
      currentIndex: widget.selectedIndex,
      onTap: widget.onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: buildNavItem(
            "assets/images/5849_message-square-chat.png",  // Unselected
            "assets/images/8150_Sesssion.png", // Selected
            'Session',
            widget.selectedIndex == 0,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: buildNavItem(
            "assets/images/8744_book-sparkles_(1).png",  // Unselected
            "assets/images/3601_book-sparkles.png", // Selected
            'Journal',
            widget.selectedIndex == 1,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: buildNavItem(
            "assets/images/236_calendar-check_(1).png",  // Unselected
            "assets/images/8215_calendar-check.png", // Selected
            'Schedule',
            widget.selectedIndex == 2,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: buildNavItem(
            "assets/images/8688_menu_(1).png",  // Unselected
            "assets/images/1171_menu.png", // Selected
            'Menu',
            widget.selectedIndex == 3,
          ),
          label: '',
        ),
      ],
    );
  }
}

