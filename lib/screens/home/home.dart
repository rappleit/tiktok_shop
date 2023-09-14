import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tiktok_shop/widgets/bottom_navbar.dart';
import 'package:tiktok_shop/widgets/home/coins.dart';
import 'package:tiktok_shop/widgets/home/flash_sale.dart';
import 'package:tiktok_shop/widgets/home/product_tabs.dart';
import 'package:tiktok_shop/widgets/home/tabs_row.dart';
import 'package:tiktok_shop/widgets/home/trending.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(237, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 20,
        title: Row(
          children: [
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              color: Colors.black,
              onPressed: () {
                // Implement shopping cart
              },
            ),
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            child: Stack(
              children: [
                Container(
                  color: Colors.grey,
                  child: Image.asset(
                    'assets/advert.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.8),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 0,
                            ),
                            child: Row(
                              children: [
                                // Spacing before "Search for items"
                                const SizedBox(width: 5),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: 'Search for items',
                                        // Placeholder text
                                        hintStyle: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16),
                                        border: InputBorder.none,
                                        suffixIcon: Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.8),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: const Offset(0, 3),
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color(0xFFEE1D52),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 6),
                                          child: const Icon(
                                            Icons.search,
                                            color: Colors.white,
                                          ),
                                        )),

                                    // Text written inside

                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Coins(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const TabsRow(),
          const FlashSale(),
          const SizedBox(
            height: 10,
          ),
          const Trending(),
          const SizedBox(
            height: 10,
          ),
          const ProductTabs(),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
