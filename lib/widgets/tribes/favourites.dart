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
                  "Favourites",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TribeItem(
                    imageUrl: 'https://picsum.photos/250?image=9',
                    name: 'Tribe 1',
                  ),
                  TribeItem(
                    imageUrl: 'https://picsum.photos/250?image=9',
                    name: 'Tribe 2',
                  ),
                  TribeItem(
                    imageUrl: 'https://picsum.photos/250?image=9',
                    name: 'Tribe 3',
                  ),
                  TribeItem(
                    imageUrl: 'https://picsum.photos/250?image=9',
                    name: 'Tribe 4',
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
