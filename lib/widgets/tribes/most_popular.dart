import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/tribe_item.dart';

class MostPopular extends StatelessWidget {
  const MostPopular({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFB1C5),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Most Popular",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // Handle "See more" button press
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    backgroundColor: Color(0xFFFFB1C5),
                  ),
                  child: Text(
                    'See more',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TribeItem(
                  imageUrl: 'https://picsum.photos/250?image=9',
                  name: 'Tribe 1',
                  numFollowing: 3,
                ),
                TribeItem(
                  imageUrl: 'https://picsum.photos/250?image=9',
                  name: 'Tribe 2',
                  numFollowing: 2,
                ),
                TribeItem(
                  imageUrl: 'https://picsum.photos/250?image=9',
                  name: 'Tribe 3',
                  numFollowing: 2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
