import 'package:flutter/material.dart';
import 'package:realestate/features/home_interface/screen/SettingScreen.dart'; // Import the new settings screen

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      margin: EdgeInsets.all(16), // Add margin to create floating effect
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor:
            Colors.transparent, // Transparent to show container color
        elevation: 0, // Remove shadow from BottomNavigationBar
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            activeIcon: Icon(Icons.home, color: Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront, color: Colors.grey),
            activeIcon: Icon(Icons.storefront, color: Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star, color: Colors.grey), // Changed icon to star
            activeIcon: Icon(Icons.star, color: Colors.black), // Active state
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.grey),
            activeIcon: Icon(Icons.settings, color: Colors.black),
            label: '',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          if (index == 3) {
            // Assuming index 3 is the gear icon for settings
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsScreen()),
            );
          } else {
            onItemTapped(index); // Handle other tabs using the passed function
          }
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
