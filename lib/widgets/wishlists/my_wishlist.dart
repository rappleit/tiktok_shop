import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/product_grid.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tiktok_shop/widgets/tribes/filter_dropdown.dart';

class MyWishlist extends StatefulWidget {
  const MyWishlist({super.key});

  @override
  State<MyWishlist> createState() => _MyWishlistState();
}

class _MyWishlistState extends State<MyWishlist> {
  String selectedMyWishlistType = 'Public';
  final List<Map> myWishlistTypes = [
    {'label': 'Public', 'icon': Icons.public},
    {'label': 'Friends', 'icon': Icons.group},
    {'label': 'Private', 'icon': Icons.lock},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            FilterDropdown(
                options: myWishlistTypes,
                selectedValue: selectedMyWishlistType,
                onChanged: (value) {
                  setState(() {
                    selectedMyWishlistType = value;
                  });
                }),
            Spacer(),
            Column(
              children: [
                Text(
                  "My Wishlist",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextButton(
                  onPressed: () {
                    // Handle "See more" button press
                  },
                  child: Text(
                    'See all',
                  ),
                ),
              ],
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(bottom: 16),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFFFB1C5),
          ),
          height: 200,
          child: ProductGridView(
              isForDisplay: true,
              userid: FirebaseAuth.instance.currentUser!.uid),
        ),
      ],
    );
  }
}