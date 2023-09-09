import 'package:flutter/material.dart';
import 'package:tiktok_shop/screens/socialhub/wishlist.dart';

class WishlistItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int count;
  final bool isBigger;

  const WishlistItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.count,
    this.isBigger = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Wishlist(name: name, count: count),
        ),
      ),
      child: Padding(
        padding: isBigger
            ? const EdgeInsets.only(top: 16)
            : const EdgeInsets.all(4.0),
        child: Container(
          width: isBigger ? 170 : 150,
          height: 120,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 48,
                child: Container(
                  color: Color(0xFFEE1D52),
                  child: Center(
                    child: Text(
                      "@$name's Wishlist",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: Stack(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEE1D52),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Positioned(
                      left: 10,
                      right: 10,
                      bottom: 7,
                      child: Text(
                        '$count',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
