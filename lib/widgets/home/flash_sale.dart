import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/product_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FlashSale extends StatelessWidget {
  const FlashSale({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'Flash Sale',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        StreamBuilder<QuerySnapshot>(
          stream: getFlashSaleProducts(), // Use your method to fetch products
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final products = snapshot.data?.docs ?? [];
              return Container(
                height: 165,
                color: Color(0xFFFFB1C5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: products.map((productDoc) {
                      final productData =
                          productDoc.data() as Map<String, dynamic>;
                      return ProductItem(
                        imageUrl: productData['thumbnail'],
                        title: productData['name'],
                        price: productData['price'].toDouble(),
                        isFlashSale: true,
                      );
                    }).toList(),
                  ),
                ),
              );
            } else {
              return CircularProgressIndicator(); // Display a loading indicator while fetching data
            }
          },
        ),
      ],
    );
  }

  Stream<QuerySnapshot> getFlashSaleProducts() {
    return FirebaseFirestore.instance
        .collection('products')
        .where('onsale', isEqualTo: true)
        .snapshots();
  }
}
