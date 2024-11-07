import 'package:flutter/material.dart';

class VoucherBannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.pink.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Replace Icon with Image.asset
          Image.asset(
            'assets/images/voucher_image.png', // Path to your new voucher image
            height: 75,
            width: 75,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dapatkan Voucher, jadi anggota',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '26 Oktober, 2024',
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
