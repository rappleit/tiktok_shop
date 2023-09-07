import 'package:flutter/material.dart';

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
                  FlashSaleItem(
                    imageUrl: 'https://picsum.photos/250?image=9',
                    title: 'Product 1',
                    price: 0.99,
                  ),
                  FlashSaleItem(
                    imageUrl: 'https://picsum.photos/250?image=9',
                    title: 'Product 2',
                    price: 2.99,
                  ),
                  FlashSaleItem(
                    imageUrl: 'https://picsum.photos/250?image=9',
                    title: 'Product 3',
                    price: 5.99,
                  ),
                  FlashSaleItem(
                    imageUrl: 'https://picsum.photos/250?image=9',
                    title: 'Product 4',
                    price: 9.99,
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

class FlashSaleItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;

  const FlashSaleItem({
    required this.imageUrl,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 500,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Image.network(
            imageUrl,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            "\$$price",
            style: TextStyle(
                color: Colors.redAccent,
                fontSize: 14,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
