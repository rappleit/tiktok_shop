import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/activity_card.dart';

class ActivityFeedPreviewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text(
                  'Recent Activity',
                  style: Theme.of(context).textTheme.titleMedium,
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ActivityCard(
                        content: '@semipreparedcat added to their wishlist!'),
                    ActivityCard(content: '@asyrafcodes joined Coders United.'),
                    ActivityCard(
                        content: '@Gnoot reviewed Uniqlo Airism Tshirt.'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
