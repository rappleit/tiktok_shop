import 'package:flutter/material.dart';

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
                  child: WishlistCard(),
                ),
                Expanded(
                  child: WishlistCard(),
                ),
                Expanded(
                  child: WishlistCard(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class WishlistCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 200.0,
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: AssetImage('assets/placeholders/product1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 48,
              child: Container(
                color: Color(0xFFEE1D52),
                child: Stack(
                  children: [
                    Center(
                      child: Text(
                        "@semipreparedcat's Wishlist",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
