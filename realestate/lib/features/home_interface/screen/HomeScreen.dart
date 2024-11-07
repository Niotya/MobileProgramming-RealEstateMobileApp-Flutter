import 'package:flutter/material.dart';
import 'package:realestate/features/home_interface/widgets/FeatureCardWidget.dart';
import 'package:realestate/features/home_interface/widgets/CategoryCardWidget.dart';
import 'package:realestate/features/home_interface/widgets/VoucherBannerWidget.dart';
import 'package:realestate/features/home_interface/screen/CustomBottomNavigationBar.dart'; // Import the custom bottom navigation bar
import 'package:realestate/features/home_interface/screen/NotificationModalScreen.dart'; // Import the notification modal screen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<String> notifications = []; // Empty list for testing

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Display the notification modal
              showDialog(
                context: context,
                barrierDismissible: true, // Allow tap outside to dismiss
                builder: (BuildContext context) {
                  return NotificationModalScreen(
                    notifications: notifications, // Pass the list
                  ); // Show the modal
                },
              );
            },
          ),
          CircleAvatar(
            backgroundImage: AssetImage(
                'assets/images/user_avatar.png'), // User avatar image
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VoucherBannerWidget(),
            SizedBox(height: 24),
            Text('Features',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FeatureCardWidget(icon: Icons.lightbulb, label: 'Lighting'),
                FeatureCardWidget(icon: Icons.flash_on, label: 'Electricity'),
                FeatureCardWidget(icon: Icons.local_gas_station, label: 'Gas'),
              ],
            ),
            SizedBox(height: 24),
            Text('Category',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryCardWidget(
                    title: 'Adam Hut',
                    location: 'Texas, USA',
                    price: '\$1M',
                    imagePath: 'assets/images/adam_hut.png',
                  ),
                  CategoryCardWidget(
                    title: 'ST Palace',
                    location: 'Fort Worth, USA',
                    price: '\$2M',
                    imagePath: 'assets/images/st_palace.png',
                  ),
                  CategoryCardWidget(
                    title: 'Green Villa',
                    location: 'Miami, USA',
                    price: '\$900K',
                    imagePath: 'assets/images/green_villa.png',
                  ),
                  CategoryCardWidget(
                    title: 'Mountain Retreat',
                    location: 'Denver, USA',
                    price: '\$750K',
                    imagePath: 'assets/images/mountain_retreat.png',
                  ),
                  CategoryCardWidget(
                    title: 'Beach House',
                    location: 'Malibu, USA',
                    price: '\$3M',
                    imagePath: 'assets/images/beach_house.png',
                  ),
                  CategoryCardWidget(
                    title: 'Urban Apartment',
                    location: 'New York, USA',
                    price: '\$2.5M',
                    imagePath: 'assets/images/urban_apartment.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Add the custom bottom navigation bar
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
