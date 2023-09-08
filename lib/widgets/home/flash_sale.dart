import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/product_item.dart';

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
        Container(
          height: 150,
          child: Container(
            color: Color(0xFFFFB1C5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ProductItem(
                    imageUrl: 'https://picsum.photos/250?image=9',
                    title: 'Product 1',
                    price: 0.99,
                    isFlashSale: true,
                  ),
                  ProductItem(
                    imageUrl: 'https://picsum.photos/250?image=9',
                    title: 'Product 2',
                    price: 2.99,
                    isFlashSale: true,
                  ),
                  ProductItem(
                    imageUrl: 'https://picsum.photos/250?image=9',
                    title: 'Product 3',
                    price: 5.99,
                    isFlashSale: true,
                  ),
                  ProductItem(
                    imageUrl: 'https://picsum.photos/250?image=9',
                    title: 'Product 4',
                    price: 9.99,
                    isFlashSale: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
