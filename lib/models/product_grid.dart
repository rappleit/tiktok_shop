import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiktok_shop/models/product_item.dart';
import 'package:tiktok_shop/screens/products.dart';

class Product {
  final String imageUrl;
  final String title;
  final double price;
  final String id;
  final String category;

  Product({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.id,
    required this.category,
  });
}

class ProductGridView extends StatelessWidget {
  final String? category;
  final bool isForDisplay;
  final int selectedTabIndex;
  final String? userid;

  ProductGridView({
    this.category,
    this.isForDisplay = false,
    this.selectedTabIndex = 0,
    this.userid,
  });

  @override
  Widget build(BuildContext context) {
    return category != null
        ? StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('products')
                .where('category', isEqualTo: category!)
                .limit(isForDisplay ? 2 : 10)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  !snapshot.hasData) {
                return CircularProgressIndicator();
              }

              final products = snapshot.data!.docs
                  .map((doc) => Product(
                        imageUrl: doc['thumbnail'],
                        title: doc['name'],
                        price: doc['price'].toDouble(),
                        id: doc['uuid'],
                        category: doc['category'],
                      ))
                  .toList();

              return isForDisplay
                  ? GestureDetector(
                      onVerticalDragUpdate: (details) {
                        if (details.delta.dy < -5) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductScreen(
                                  selectedTabIndex: selectedTabIndex),
                            ),
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (Product product in products)
                            ProductItem(
                              imageUrl: product.imageUrl,
                              title: product.title,
                              price: product.price,
                              id: product.id,
                            ),
                        ],
                      ),
                    )
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return ProductItem(
                          imageUrl: product.imageUrl,
                          title: product.title,
                          price: product.price,
                          id: product.id,
                          isFlashSale: false, // Set this as needed
                        );
                      },
                    );
            },
          )
        : StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('user')
                .doc(userid!)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  !snapshot.hasData) {
                return CircularProgressIndicator();
              }
              var wishlist = snapshot.data!["wishlist"].entries.toList();
              var products = isForDisplay
                  ? (wishlist.length > 2 ? (wishlist.sublist(0, 2)) : wishlist)
                  : wishlist;
              return isForDisplay
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (var product in products)
                          ProductItem(
                            imageUrl: product.value["imageUrl"],
                            title: product.value["title"],
                            price: product.value["price"],
                            id: product.key,
                          ),
                      ],
                    )
                  : Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return ProductItem(
                            imageUrl: product.value["imageUrl"],
                            title: product.value["title"],
                            price: product.value["price"],
                            id: product.key,
                          );
                        },
                      ),
                    );
            },
          );
  }
}
