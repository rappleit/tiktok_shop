import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                Text(
                  'Home',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.shop, color: Colors.black),
                Text(
                  'Shop',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                // ROUNDED
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.black,
              ),
              child: IconButton(
                icon: Icon(Icons.add, color: Colors.white),
                onPressed: () {
                  // Implement action for the add button
                },
              ),
            ),
            const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.message,
                  color: Colors.grey,
                ),
                Text(
                  'Inbox',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                Text(
                  'Profile',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
