import 'package:flutter/material.dart';
import 'package:tiktok_shop/screens/product_info.dart';

class ProductItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final String id;
  final bool isFlashSale;
  final bool isFulfillWishlist;

  const ProductItem({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.id,
    this.isFlashSale = false,
    this.isFulfillWishlist = false,
  });

  @override
  Widget build(BuildContext context) {
    return isFulfillWishlist
        ? Container(
            margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Container(
              margin: EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    imageUrl,
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  Text(
                    "\$${price.toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        : GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => ProductInfoScreen(
                          imageUrl: imageUrl,
                          title: title,
                          price: price,
                          id: id,
                        )),
              );
            },
            child: Container(
              margin: EdgeInsets.all(8),
              height: isFlashSale ? 600 : 158,
              width:
                  isFlashSale ? 120 : MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.network(
                      imageUrl,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "\$${price.toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.redAccent,
                          fontSize: 14,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ));
  }
}
