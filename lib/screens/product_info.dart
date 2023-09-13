import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProductInfoScreen extends StatefulWidget {
  final String imageUrl;
  final String title;
  final double price;
  final String id;

  const ProductInfoScreen(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.price,
      required this.id});

  @override
  State<ProductInfoScreen> createState() => _ProductInfoScreenState();
}

class _ProductInfoScreenState extends State<ProductInfoScreen> {
  var isAddedToWishlist = false;

  Future<QuerySnapshot<Map<String, dynamic>>> getProductData() async {
    CollectionReference<Map<String, dynamic>> productsCollection =
        FirebaseFirestore.instance.collection('products');

    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await productsCollection.where('uuid', isEqualTo: widget.id).get();

    return querySnapshot;
  }

  @override
  Widget build(BuildContext context) {
    final String imageUrl = widget.imageUrl;
    final String title = widget.title;
    final double price = widget.price;
    final String id = widget.id;
    var productData;

    return Scaffold(
      backgroundColor: const Color.fromARGB(237, 255, 255, 255),
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              'Product Info',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              color: Theme.of(context).iconTheme.color,
              onPressed: () {
                // Implement shopping cart
              },
            ),
            IconButton(
              icon: const Icon(Icons.menu),
              color: Theme.of(context).iconTheme.color,
              onPressed: () {
                // Open the drawer
                Scaffold.of(context).openDrawer();
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
          future: getProductData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              var documents = snapshot.data?.docs;

              productData = documents?[0].data() ?? {};
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Image.network(
                        imageUrl,
                        height: MediaQuery.of(context).size.height * 0.5,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              _capitalizeFirstLetter(
                                  productData?['brand'] ?? ''),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFFEE1D52),
                              )),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12.0),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Color(0xFFEE1D52),
                                size: 24.0,
                              ),
                              const SizedBox(width: 6.0),
                              Text(
                                '${productData?['rating'] ?? 'N/A'} / 5',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 6.0),
                              const Text(
                                '|',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 6.0),
                              Text(
                                '${productData?['sold'] ?? 'N/A'} sold',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12.0),
                          Text(
                            productData?['description'] ?? '',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFFFFFFFF),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFEE1D52), // Set the border color
                      width: 2.0, // Set the border width
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      '\$ ${price.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFEE1D52),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 0),
                    child: const Center(
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: const EdgeInsets.all(24),
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    var userDoc = FirebaseFirestore.instance
                                        .collection('user')
                                        .doc(FirebaseAuth
                                            .instance.currentUser!.uid);
                                    userDoc
                                        .get()
                                        .then((doc) => doc.data()!['wishlist'])
                                        .then((wishlistData) {
                                      if (wishlistData.containsKey(id)) {
                                        userDoc.update({
                                          "wishlist": wishlistData.remove(id)
                                        });
                                      } else {
                                        Map toAdd = {...wishlistData};
                                        toAdd[id] = {
                                          "imageUrl": imageUrl,
                                          "title": title,
                                          "price": price
                                        };
                                        userDoc.update({
                                          'wishlist': toAdd,
                                        });
                                      }
                                    });

                                    setState(
                                      () {
                                        isAddedToWishlist = !isAddedToWishlist;
                                      },
                                    );
                                    Navigator.of(context).pop();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(isAddedToWishlist
                                            ? 'Removed from wishlist!'
                                            : 'Added to wishlist!'),
                                        duration: const Duration(seconds: 3),
                                        action: SnackBarAction(
                                          label: 'Undo',
                                          onPressed: () {
                                            setState(
                                              () {
                                                isAddedToWishlist =
                                                    !isAddedToWishlist;
                                              },
                                            );
                                            userDoc
                                                .get()
                                                .then((doc) =>
                                                    doc.data()!['wishlist'])
                                                .then((wishlistData) {
                                              if (wishlistData
                                                  .containsKey(id)) {
                                                userDoc.update({
                                                  "wishlist":
                                                      wishlistData.remove(id)
                                                });
                                              } else {
                                                Map toAdd = {...wishlistData};
                                                toAdd[id] = {
                                                  "imageUrl": imageUrl,
                                                  "title": title,
                                                  "price": price
                                                };
                                                userDoc.update({
                                                  'wishlist': toAdd,
                                                });
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.favorite,
                                          color: Color(0xFFEE1D52), size: 32.0),
                                      const SizedBox(width: 18),
                                      isAddedToWishlist
                                          ? Text(
                                              "Remove from wishlist",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            )
                                          : Text(
                                              "Add to wishlist",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 18),
                                TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.card_giftcard,
                                          color: Color(0xFFEE1D52), size: 32.0),
                                      const SizedBox(width: 18),
                                      Text(
                                        "Gift to friend",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.white),
                  child: Container(
                    child: const Icon(
                      Icons.more_horiz,
                      color: Colors.black,
                      size: 24.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String _capitalizeFirstLetter(String text) {
  if (text.isEmpty) {
    return text;
  }
  return text[0].toUpperCase() + text.substring(1);
}
