import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProductInfoScreen extends StatefulWidget {
  final String imageUrl;
  final String title;
  final double price;
  final String id;

  ProductInfoScreen(
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
      backgroundColor: Color.fromARGB(237, 255, 255, 255),
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              'Product Info',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Theme.of(context).iconTheme.color,
              onPressed: () {
                // Implement shopping cart
              },
            ),
            IconButton(
              icon: Icon(Icons.menu),
              color: Theme.of(context).iconTheme.color,
              onPressed: () {
                // Open the drawer
                Scaffold.of(context).openDrawer();
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
          future: getProductData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              var documents = snapshot.data?.docs;

              productData = documents?[0]?.data() ?? {};
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
                    padding: EdgeInsets.all(24.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              _capitalizeFirstLetter(
                                  productData?['brand'] ?? ''),
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFFEE1D52),
                              )),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              title,
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 12.0),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Color(0xFFEE1D52),
                                size: 24.0,
                              ),
                              SizedBox(width: 6.0),
                              Text(
                                '${productData?['rating'] ?? 'N/A'} / 5',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 6.0),
                              Text(
                                '|',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 6.0),
                              Text(
                                '${productData?['sold'] ?? 'N/A'} sold',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            productData?['description'] ?? '',
                            style: TextStyle(
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
        color: Color(0xFFFFFFFF),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFEE1D52), // Set the border color
                      width: 2.0, // Set the border width
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      '\$ ${price.toStringAsFixed(2)}',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFEE1D52),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                    child: Center(
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
                SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: EdgeInsets.all(24),
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () async {
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
                                        duration: Duration(seconds: 3),
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
                                              if (wishlistData.contains(id)) {
                                                userDoc.update({
                                                  'wishlist':
                                                      FieldValue.arrayRemove(
                                                          [id]),
                                                });
                                                print('Removed from wishlist!');
                                              } else {
                                                userDoc.update({
                                                  'wishlist':
                                                      FieldValue.arrayUnion(
                                                          [id]),
                                                });
                                                print('Added to wishlist!');
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
                                      Icon(Icons.favorite,
                                          color: Color(0xFFEE1D52), size: 32.0),
                                      SizedBox(width: 18),
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
                                SizedBox(height: 18),
                                TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.card_giftcard,
                                          color: Color(0xFFEE1D52), size: 32.0),
                                      SizedBox(width: 18),
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
                      shape: CircleBorder(),
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.white),
                  child: Container(
                    child: Icon(
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
