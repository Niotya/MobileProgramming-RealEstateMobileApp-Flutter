import 'package:flutter/material.dart';

class CategoryCardWidget extends StatelessWidget {
  final String title;
  final String location;
  final String price;
  final String imagePath;

  CategoryCardWidget({
    required this.title,
    required this.location,
    required this.price,
    this.imagePath = 'assets/images/property_placeholder.png', // Default image
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180, // Increased width
      height: 280, // Increased height
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50, // Soft background color
        borderRadius: BorderRadius.circular(
            16), // Larger corner radius for rounded effect
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 158, 158, 158).withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with rounded corners
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              height: 140, // Increased image height
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 12),
          // Title with bold font
          Text(
            title,
            style: TextStyle(
              fontSize: 18, // Slightly larger font for title
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 4),
          // Location with grey color
          Text(
            location,
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
          SizedBox(height: 8),
          // Price with bold font
          Text(
            price,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
