import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/product_grid.dart';
import 'package:tiktok_shop/models/product_item.dart';
import 'package:tiktok_shop/screens/products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductTabs extends StatefulWidget {
  const ProductTabs({super.key});

  @override
  _ProductTabsState createState() => _ProductTabsState();
}

class _ProductTabsState extends State<ProductTabs>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<String> tabs = [
    'Recommended',
    'New',
    'Electronics',
    'Fragrances',
    'Skincare',
    'Groceries',
    'Home Decor',
    'Furniture',
    'Fashion',
    'Accessories',
    'Automotive',
    'Lighting'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: tabs.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          child: TabBar(
            controller: _tabController,
            // Enable scrolling if needed
            isScrollable: true,
            tabs: tabs
                .map(
                  (name) => Tab(
                    text: name,
                  ),
                )
                .toList(),
            labelColor: Colors.black, // Color for selected tab label
            labelStyle: Theme.of(context).textTheme.titleMedium,
            indicatorColor: Color(0xFFEE1D52),
            unselectedLabelColor: Colors.grey, // Color for unselected tab label
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 170,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TabBarView(
            controller: _tabController,
            children: [
              GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.delta.dy < -5) {
                    // Swipe up detected, open full ProductsScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                            selectedTabIndex: _tabController.index),
                      ),
                    );
                  }
                },
                child: ProductGridView(category: "electronics"),
              ),

              // Content for "New" tab
              GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.delta.dy < -5) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                            selectedTabIndex: _tabController.index),
                      ),
                    );
                  }
                },
                child: ProductGridView(category: "skincare"),
              ),
              // Content for "Electronics" tab
              GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.delta.dy < -5) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                            selectedTabIndex: _tabController.index),
                      ),
                    );
                  }
                },
                child: ProductGridView(category: "electronics"),
              ),
              // Content for "Fragrances" tab
              GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.delta.dy < -5) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                            selectedTabIndex: _tabController.index),
                      ),
                    );
                  }
                },
                child: ProductGridView(category: "fragrances"),
              ),
              // Content for "Skincare" tab
              GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.delta.dy < -5) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                            selectedTabIndex: _tabController.index),
                      ),
                    );
                  }
                },
                child: ProductGridView(category: "skincare"),
              ),
              // Content for "Groceries" tab
              GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.delta.dy < -5) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                            selectedTabIndex: _tabController.index),
                      ),
                    );
                  }
                },
                child: ProductGridView(category: "groceries"),
              ),
              // Content for "Home Decor" tab
              GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.delta.dy < -5) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                            selectedTabIndex: _tabController.index),
                      ),
                    );
                  }
                },
                child: ProductGridView(category: "home-decor"),
              ),
              // Content for "Furniture" tab

              GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.delta.dy < -5) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                            selectedTabIndex: _tabController.index),
                      ),
                    );
                  }
                },
                child: ProductGridView(category: "furniture"),
              ),
              // Content for "Fashion" tab
              GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.delta.dy < -5) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                            selectedTabIndex: _tabController.index),
                      ),
                    );
                  }
                },
                child: ProductGridView(category: "fashion"),
              ),
              // Content for "Accessories" tab
              GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.delta.dy < -5) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                            selectedTabIndex: _tabController.index),
                      ),
                    );
                  }
                },
                child: ProductGridView(category: "accessories"),
              ),
              // Content for "Automotive" tab
              GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.delta.dy < -5) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                            selectedTabIndex: _tabController.index),
                      ),
                    );
                  }
                },
                child: ProductGridView(category: "automotive"),
              ),
              // Content for "Lighting" tab
              GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.delta.dy < -5) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                            selectedTabIndex: _tabController.index),
                      ),
                    );
                  }
                },
                child: ProductGridView(category: "lighting"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
