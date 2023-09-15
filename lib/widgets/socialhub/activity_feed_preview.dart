import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/socialhub/activity_card.dart';

class ActivityFeedPreviewWidget extends StatelessWidget {
  const ActivityFeedPreviewWidget({super.key});

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
                TextButton(
                  onPressed: () {},
                  child: Text('See more'),
                ),
              ],
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ActivityCard(
                        content: '@semipreparedcat added to their wishlist!'),
                    ActivityCard(content: '@asycodes joined Coders United.'),
                    ActivityCard(
                        content: '@Gnoot reviewed Uniqlo Airism Tshirt.'),
                    ActivityCard(
                        content: '@asycodes started October Challenge: ...'),
                    ActivityCard(content: '@Gnoot completed Refer-ee.'),
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
