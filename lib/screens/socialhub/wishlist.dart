import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/product_grid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiktok_shop/screens/socialhub/fulfil_wishlist_selection.dart';

class Wishlist extends StatelessWidget {
  final String name;
  final int count;

  const Wishlist({
    super.key,
    required this.name,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(237, 255, 255, 255),
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Text(
                "$name's Wishlist",
                // Multi-lined appbar
                maxLines: 4,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Theme.of(context).iconTheme.color,
              onPressed: () {
                // Implement shopping cart
              },
            ),
            IconButton(
              icon: const Icon(Icons.menu),
              color: Theme.of(context).iconTheme.color,
              onPressed: () {
                // Open the drawer
                Scaffold.of(context).openDrawer();
              },
            ),
          ],
        ),
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFEE1D52),
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {
                  var userDoc = FirebaseFirestore.instance
                      .collection('user')
                      .where("username", isEqualTo: name);
                  userDoc.get().then(
                    (doc) {
                      if (doc.docs.isNotEmpty) {
                        var wishlistData = doc.docs.first['wishlist'];

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FulfilWishlistSelection(
                              name: name,
                              products: wishlistData.entries.toList(),
                            ),
                          ),
                        );
                      }
                      ;
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Fulfill $name's Wishlist!",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          ProductGridView(
            userid: "ndRZEc51vcSuX3JDEOY2B3OPNEr1",
          )
        ],
      ),
    );
  }
}
