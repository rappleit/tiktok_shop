import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/socialhub/wishlist_item.dart';

class WishlistsPreviewWidget extends StatelessWidget {
  const WishlistsPreviewWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
          child: Row(
            children: [
              Text(
                'Check out these wishlists!',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
          child: SizedBox(
            height: 140,
            child: Row(
              children: [
                Expanded(
                  child: WishlistItem(
                      imageUrl:
                          'https://avatars.githubusercontent.com/u/86306864?s=400&u=6d391bbde5fc02abbd33b714517fb294ef9d8313&v=4',
                      name: "Gnoot",
                      count: 8),
                ),
                Expanded(
                  child: WishlistItem(
                      imageUrl:
                          'https://avatars.githubusercontent.com/u/80181684?v=4',
                      name: "semipreparedcat",
                      count: 6),
                ),
                Expanded(
                  child: WishlistItem(
                      imageUrl:
                          'https://avatars.githubusercontent.com/u/45510188?v=4',
                      name: "asycodes",
                      count: 4),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
