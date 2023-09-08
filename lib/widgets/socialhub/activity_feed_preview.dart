import 'package:flutter/material.dart';
import 'package:tiktok_shop/widgets/socialhub/activity_card.dart';

class ActivityFeedPreviewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text(
                  'Recent Activity',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // Handle "See more" button press
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                  ),
                  child: Text('See more'),
                ),
              ],
            ),
            ActivityCard(),
          ],
        )));
  }
}
