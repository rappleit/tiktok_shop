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
                Text(
                  "See all",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.grey,
                      ),
                )
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
