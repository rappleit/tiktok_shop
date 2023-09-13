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
      backgroundColor: const Color.fromARGB(237, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 40,
        // Change Back button color
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
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
              icon: const Icon(Icons.menu),
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
              indicatorColor: const Color(0xFFEE1D52),
              unselectedLabelColor: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Container(
              height: 300,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TabBarView(
                controller: _tabController,
                children: [
                  ProductGridView(
                    category: "electronics",
                    selectedTabIndex: widget.selectedTabIndex,
                  ),

                  // Content for "New" tab
                  ProductGridView(
                    category: "skincare",
                    selectedTabIndex: widget.selectedTabIndex,
                  ),
                  // Content for "Electronics" tab
                  ProductGridView(
                    category: "electronics",
                    selectedTabIndex: widget.selectedTabIndex,
                  ),
                  // Content for "Fragrances" tab
                  ProductGridView(
                    category: "fragrances",
                    selectedTabIndex: widget.selectedTabIndex,
                  ),
                  // Content for "Skincare" tab
                  ProductGridView(
                    category: "skincare",
                    selectedTabIndex: widget.selectedTabIndex,
                  ),
                  // Content for "Groceries" tab
                  ProductGridView(
                    category: "groceries",
                    selectedTabIndex: widget.selectedTabIndex,
                  ),
                  // Content for "Home Decor" tab
                  ProductGridView(
                    category: "home-decor",
                    selectedTabIndex: widget.selectedTabIndex,
                  ),
                  // Content for "Furniture" tab
                  ProductGridView(
                    category: "furniture",
                    selectedTabIndex: widget.selectedTabIndex,
                  ),
                  // Content for "Fashion" tab
                  ProductGridView(
                    category: "fashion",
                    selectedTabIndex: widget.selectedTabIndex,
                  ),
                  // Content for "Accessories" tab
                  ProductGridView(
                    category: "accessories",
                    selectedTabIndex: widget.selectedTabIndex,
                  ),
                  // Content for "Automotive" tab
                  ProductGridView(
                    category: "automotive",
                    selectedTabIndex: widget.selectedTabIndex,
                  ),
                  // Content for "Lighting" tab
                  ProductGridView(
                    category: "lighting",
                    selectedTabIndex: widget.selectedTabIndex,
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
