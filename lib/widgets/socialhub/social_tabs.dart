import 'package:flutter/material.dart';

class SocialTabsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SocialTab(
                title: 'Wishlists',
                icon: Icons.favorite,
              ),
              SizedBox(width: 12),
              SocialTab(
                title: 'Quests',
                icon: Icons.explore,
              ),
              SizedBox(width: 12),
              SocialTab(
                title: 'Gift Finder',
                icon: Icons.card_giftcard,
              ),
            ],
          ),
        ));
  }
}

class SocialTab extends StatelessWidget {
  final String title;
  final IconData icon;

  SocialTab({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Container(
            width: 64.0,
            height: 64.0,
            decoration: BoxDecoration(
              color: Color(0xFFEE1D52),
              borderRadius: BorderRadius.circular(8.0), // Rounded square
            ),
            child: Center(
              child: Icon(
                icon,
                color: Colors.white,
                size: 32.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
