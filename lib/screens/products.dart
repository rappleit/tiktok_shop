import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/product_grid.dart';

class ProductScreen extends StatefulWidget {
  final int selectedTabIndex;
  const ProductScreen({super.key, required this.selectedTabIndex});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
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
      initialIndex: widget.selectedTabIndex,
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
    return Scaffold(
      backgroundColor: Color.fromARGB(237, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 40,
        // Change Back button color
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Row(
          children: [
            Spacer(),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Colors.black,
              onPressed: () {
                // Implement shopping cart
              },
            ),
            IconButton(
              icon: Icon(Icons.menu),
              color: Colors.black,
              onPressed: () {
                // Open the drawer
                Scaffold.of(context).openDrawer();
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: tabs
                  .map(
                    (name) => Tab(
                      text: name,
                    ),
                  )
                  .toList(),
              labelColor: Colors.black,
              labelStyle: Theme.of(context).textTheme.titleMedium,
              indicatorColor: Color(0xFFEE1D52),
              unselectedLabelColor: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: Container(
              height: 300,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TabBarView(controller: _tabController, children: [
                ProductGridView(
                  category: "electronics",
                ),

                // Content for "New" tab
                ProductGridView(
                  category: "skincare",
                ),
                // Content for "Electronics" tab
                ProductGridView(
                  category: "electronics",
                ),
                // Content for "Fragrances" tab
                ProductGridView(
                  category: "fragrances",
                ),
                // Content for "Skincare" tab
                ProductGridView(
                  category: "skincare",
                ),
                // Content for "Groceries" tab
                ProductGridView(
                  category: "groceries",
                ),
                // Content for "Home Decor" tab
                ProductGridView(
                  category: "home-decor",
                ),
                // Content for "Furniture" tab
                ProductGridView(
                  category: "furniture",
                ),
                // Content for "Fashion" tab
                ProductGridView(
                  category: "fashion",
                ),
                // Content for "Accessories" tab
                ProductGridView(
                  category: "accessories",
                ),
                // Content for "Automotive" tab
                ProductGridView(
                  category: "automotive",
                ),
                // Content for "Lighting" tab
                ProductGridView(
                  category: "lighting",
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
