import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/tribes/tribe_item.dart';

class MostPopular extends StatelessWidget {
  const MostPopular({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFB1C5),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Most Popular",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // Handle "See more" button press
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    backgroundColor: const Color(0xFFFFB1C5),
                  ),
                  child: const Text(
                    'See more',
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TribeItem(
                  imageUrl: 'https://picsum.photos/250?image=4',
                  name: 'Uniqlo Shirts',
                  numFollowing: 3,
                ),
                TribeItem(
                  imageUrl: 'https://picsum.photos/250?image=2',
                  name: 'Com Wiz',
                  numFollowing: 2,
                ),
                TribeItem(
                  imageUrl: 'https://picsum.photos/250?image=20',
                  name: 'Study Gang',
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
