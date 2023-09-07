import 'dart:io';

// import 'package:uuid/uuid.dart';

// const uuid = Uuid();

class Wishlist {
  final String id;
  final String userId;
  final List<WishlistItem> items;
  final DateTime createdDate;

  Wishlist({
    required this.userId,
    required this.items,
    required this.createdDate,
    required this.id,
  });
  // : id = uuid.v4()
}

class WishlistItem {
  final String productId;
  final String productName;
  final double price;
  final File image;

  WishlistItem({
    required this.productId,
    required this.productName,
    required this.price,
    required this.image,
  });
}
