import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/wishlist_item.dart';
import 'package:tiktok_shop/widgets/tribes/filter_dropdown.dart';

class OtherWishlists extends StatefulWidget {
  const OtherWishlists({super.key});

  @override
  State<OtherWishlists> createState() => _OtherWishlistsState();
}

class _OtherWishlistsState extends State<OtherWishlists> {
  String selectedOthersWishlistType = 'Friends';
  final List<Map> othersWishlistTypes = [
    {'label': 'Friends', 'icon': Icons.group},
    {'label': 'Following', 'icon': Icons.verified},
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              FilterDropdown(
                  options: othersWishlistTypes,
                  selectedValue: selectedOthersWishlistType,
                  onChanged: (value) {
                    setState(() {
                      selectedOthersWishlistType = value;
                    });
                  }),
              Spacer(),
              Text(
                "Other Wishlists",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    children: [
                      WishlistItem(
                        imageUrl: 'assets/placeholders/product1.jpg',
                        name: 'Gnoot',
                        count: 8,
                        isBigger: true,
                      ),
                      Spacer(),
                      WishlistItem(
                        imageUrl: 'assets/placeholders/product1.jpg',
                        name: 'semipreparedcat',
                        count: 6,
                        isBigger: true,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      WishlistItem(
                        imageUrl: 'assets/placeholders/product1.jpg',
                        name: 'semipreparedcat',
                        count: 2,
                        isBigger: true,
                      ),
                      Spacer(),
                      WishlistItem(
                        imageUrl: 'assets/placeholders/product1.jpg',
                        name: 'semipreparedcat',
                        count: 4,
                        isBigger: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
