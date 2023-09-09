import 'package:flutter/material.dart';
import 'package:tiktok_shop/widgets/wishlists/my_wishlist.dart';
import 'package:tiktok_shop/widgets/wishlists/other_wishlists.dart';

class WishLists extends StatefulWidget {
  const WishLists({super.key});

  @override
  State<WishLists> createState() => _WishListsState();
}

class _WishListsState extends State<WishLists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(237, 255, 255, 255),
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              'Wishlists',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              color: Theme.of(context).iconTheme.color,
              onPressed: () {
                // Implement shopping cart
              },
            ),
            IconButton(
              icon: Icon(Icons.menu),
              color: Theme.of(context).iconTheme.color,
              onPressed: () {
                // Open the drawer
                Scaffold.of(context).openDrawer();
              },
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: const Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MyWishlist(),
            OtherWishlists(),
          ],
        ),
      ),
    );
  }
}
