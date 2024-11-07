import 'package:flutter/material.dart';
import 'dart:ui';

class NotificationModalScreen extends StatelessWidget {
  final List<String> notifications; // Pass in a list of notifications

  NotificationModalScreen(
      {this.notifications =
          const []}); // Default empty list if no notifications

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Blurred and darkened background
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            color: Colors.black.withOpacity(0.5), // Darken the background
          ),
        ),
        // Modal content
        Center(
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            elevation: 24,
            child: Container(
              width: 300,
              height: 400,
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Notifications',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  // Check if the list is empty
                  notifications.isEmpty
                      ? Expanded(
                          child: Center(
                            child: Text(
                              'No notifications available',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: notifications.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(notifications[index]),
                                subtitle:
                                    Text('This is a notification detail.'),
                              );
                            },
                          ),
                        ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Button background color
                      foregroundColor: Colors.white, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30), // Rounded corners
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12), // Padding for size
                    ),
                    child: Text('Close'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
