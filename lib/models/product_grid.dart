import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiktok_shop/models/product_item.dart';

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
  final String category;

  ProductGridView({required this.category});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('products')
          .where('category', isEqualTo: category)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
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

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductItemWidget(product: product);
          },
        );
      },
    );
  }
}

class ProductItemWidget extends StatelessWidget {
  final Product product;

  ProductItemWidget({required this.product});

  @override
  Widget build(BuildContext context) {
    return ProductItem(
      imageUrl: product.imageUrl,
      title: product.title,
      price: product.price,
      id: product.id,
      isFlashSale: false, // Set this as needed
    );
  }
}
