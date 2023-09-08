import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/tribe_item.dart';

class ForYou extends StatelessWidget {
  const ForYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "For You",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TribeItem(
                    imageUrl: 'https://picsum.photos/250?image=9',
                    name: 'Tribe 1',
                    isForYou: true,
                    numFollowing: 3,
                  ),
                  TribeItem(
                    imageUrl: 'https://picsum.photos/250?image=9',
                    name: 'Tribe 2',
                    isForYou: true,
                    numFollowing: 2,
                  ),
                  TribeItem(
                    imageUrl: 'https://picsum.photos/250?image=9',
                    name: 'Tribe 3',
                    isForYou: true,
                    numFollowing: 2,
                  ),
                  TribeItem(
                    imageUrl: 'https://picsum.photos/250?image=9',
                    name: 'Tribe 4',
                    isForYou: true,
                    numFollowing: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
