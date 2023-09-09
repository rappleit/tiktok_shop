import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/tribes/tribe_item.dart';

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
            const SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TribeItem(
                    imageUrl: 'https://picsum.photos/250?image=38',
                    name: 'Pastel Lovers',
                  ),
                  TribeItem(
                    imageUrl: 'https://picsum.photos/250?image=44',
                    name: 'Sea Farers',
                  ),
                  TribeItem(
                    imageUrl: 'https://picsum.photos/250?image=29',
                    name: 'Outdoor Fans',
                  ),
                  TribeItem(
                    imageUrl: 'https://picsum.photos/250?image=19',
                    name: 'Naturists',
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
