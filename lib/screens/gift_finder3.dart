import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/product_item.dart';

class GiftFinder3 extends StatelessWidget {
  final List<String> selectedTags;

  const GiftFinder3({
    super.key,
    required this.selectedTags,
  });

  @override
  Widget build(BuildContext context) {
    void navigateToNextScreen(BuildContext context) {}
    return Scaffold(
      backgroundColor: Color.fromARGB(237, 255, 255, 255),
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              'Gift Finder',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
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
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(),
        leading: IconButton(
          onPressed: () {
            for (var i = 0; i < 3; i++) Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text('Here are your selections!',
                    style: Theme.of(context).textTheme.titleLarge),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProductItem(
                  imageUrl: 'https://picsum.photos/250?image=9',
                  title: 'Product 1',
                  price: 5.99,
                ),
                ProductItem(
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
                  imageUrl: 'https://picsum.photos/250?image=9',
                  title: 'Product 3',
                  price: 5.99,
                ),
                ProductItem(
                  imageUrl: 'https://picsum.photos/250?image=9',
                  title: 'Product 4',
                  price: 5.99,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
