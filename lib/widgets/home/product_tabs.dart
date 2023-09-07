import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/product_item.dart';
import 'package:tiktok_shop/screens/products.dart';

class ProductTabs extends StatefulWidget {
  const ProductTabs({super.key});

  @override
  _ProductTabsState createState() => _ProductTabsState();
}

class _ProductTabsState extends State<ProductTabs>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<String> tabs = ['Recommended', 'New', 'Beauty', 'Food', 'Household'];

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
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProductItem(
                            imageUrl: 'https://picsum.photos/250?image=9',
                            title: 'Product 1',
                            price: 5.99,
                          ),
                          ProductItem(
                            imageUrl: 'https://picsum.photos/250?image=9',
                            title: 'Product 2',
                            price: 5.99,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
                child: Container(
                  color: Colors.green,
                ),
              ),
              // Content for "Beauty" tab
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
                child: Container(
                  color: Colors.yellow,
                ),
              ),
              // Content for "Food" tab
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
                child: Container(
                  color: Colors.orange,
                ),
              ),
              // Content for "House" tab
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
                child: Container(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
