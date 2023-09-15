import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/socialhub/wishlist_item.dart';
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
              const Spacer(),
              Text(
                "Other Wishlists",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    children: [
                      WishlistItem(
                        imageUrl:
                            'https://avatars.githubusercontent.com/u/86306864?s=400&u=6d391bbde5fc02abbd33b714517fb294ef9d8313&v=4',
                        name: 'Gnoot',
                        count: 8,
                        isBigger: true,
                      ),
                      Spacer(),
                      WishlistItem(
                        imageUrl:
                            'https://avatars.githubusercontent.com/u/80181684?v=4',
                        name: 'semipreparedcat',
                        count: 6,
                        isBigger: true,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      WishlistItem(
                        imageUrl:
                            'https://avatars.githubusercontent.com/u/45510188?v=4',
                        name: 'asycodes',
                        count: 2,
                        isBigger: true,
                      ),
                      Spacer(),
                      WishlistItem(
                        imageUrl:
                            'https://avatars.githubusercontent.com/u/45510188?v=4',
                        name: 'asycodes',
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
