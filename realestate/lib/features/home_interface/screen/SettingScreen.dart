import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50, // Size of the profile picture
                backgroundImage: AssetImage('assets/images/user_avatar.png'),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'John Doe', // Example user name
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Account: johndoe@example.com', // Example account info
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Residence: New York, USA', // Example residence
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 20),
            // Add more user information fields as desired
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text('+1 234 567 890'),
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('Address'),
              subtitle: Text('123 Main Street, New York, NY'),
            ),
          ],
        ),
      ),
    );
  }
}
