import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/wishlist_item.dart';

class WishlistsPreviewWidget extends StatelessWidget {
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
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
          child: SizedBox(
            height: 140,
            child: Row(
              children: [
                Expanded(
                  child: WishlistItem(
                      imageUrl: 'assets/placeholders/product1.jpg',
                      name: "semipreparedcat",
                      count: 6),
                ),
                Expanded(
                  child: WishlistItem(
                      imageUrl: 'assets/placeholders/product1.jpg',
                      name: "semipreparedcat",
                      count: 6),
                ),
                Expanded(
                  child: WishlistItem(
                      imageUrl: 'assets/placeholders/product1.jpg',
                      name: "semipreparedcat",
                      count: 6),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
