import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/product_item.dart';
import 'package:tiktok_shop/screens/fulfil_wishlist_selection.dart';

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
      backgroundColor: Color.fromARGB(237, 255, 255, 255),
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Text(
                "$name's Wishlist",
                // Multi-lined appbar
                maxLines: 4,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
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
              icon: Icon(Icons.menu),
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
        iconTheme: IconThemeData(),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xFFEE1D52),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FulfilWishlistSelection(
                        name: name,
                        productItems: [
                          ProductItem(
                            id: "abc",
                            imageUrl: 'https://picsum.photos/250?image=9',
                            title: "Product 1",
                            price: 3.22,
                            isFulfillWishlist: true,
                          ),
                          ProductItem(
                            id: "abc",
                            imageUrl: 'https://picsum.photos/250?image=9',
                            title: "Product 2",
                            price: 6.99,
                            isFulfillWishlist: true,
                          ),
                          ProductItem(
                            id: "abc",
                            imageUrl: 'https://picsum.photos/250?image=9',
                            title: "Product 3",
                            price: 4,
                            isFulfillWishlist: true,
                          ),
                          ProductItem(
                            id: "abc",
                            imageUrl: 'https://picsum.photos/250?image=9',
                            title: "Product 4",
                            price: 42.69,
                            isFulfillWishlist: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(16),
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
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProductItem(
                        id: "abc",
                        imageUrl: 'https://picsum.photos/250?image=9',
                        title: 'Product 1',
                        price: 5.99,
                      ),
                      ProductItem(
                        id: "abc",
                        imageUrl: 'https://picsum.photos/250?image=9',
                        title: 'Product 2',
                        price: 5.99,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProductItem(
                        id: "abc",
                        imageUrl: 'https://picsum.photos/250?image=9',
                        title: 'Product 3',
                        price: 5.99,
                      ),
                      ProductItem(
                        id: "abc",
                        imageUrl: 'https://picsum.photos/250?image=9',
                        title: 'Product 4',
                        price: 5.99,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
