import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiktok_shop/models/product_item.dart'; // Import Firestore

class GiftFinder3 extends StatelessWidget {
  final List<String> selectedTags;

  const GiftFinder3({
    Key? key,
    required this.selectedTags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(),
          leading: IconButton(
            onPressed: () {
              for (var i = 0; i < 3; i++) Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 24, bottom: 12),
              child: Center(
                child: Text('Gift Suggestions For You',
                    style: Theme.of(context).textTheme.titleLarge),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: selectedTags
                  .map((tag) => Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Color(0xFFEE1D52),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(tag[0].toUpperCase() + tag.substring(1),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ))
                  .toList(),
            ),
            SizedBox(height: 12),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('products')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  final products = snapshot.data?.docs ?? [];

                  final filteredProducts = products.where((productDoc) {
                    final productTags = (productDoc['tags'] as String)
                        .split(','); // Assuming tags are comma-separated
                    return selectedTags
                        .any((item) => productTags.contains(item.toString()));
                  }).toList();

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Two columns
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final productData = filteredProducts[index].data()
                          as Map<String, dynamic>;

                      return ProductItem(
                        imageUrl: productData['thumbnail'],
                        title: productData['name'],
                        price: productData['price'].toDouble(),
                        id: filteredProducts[index].id,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ));
  }
}
