import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/product_grid.dart';

class ProductTabs extends StatefulWidget {
  const ProductTabs({super.key});

  @override
  State<ProductTabs> createState() => _ProductTabsState();
}

class _ProductTabsState extends State<ProductTabs>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabIndex = 0;
  final List<String> tabs = [
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
    // DO if _tabController.index not updating in TabBarView for some reason
    _tabController.addListener(() {
      setState(() {
        _selectedTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 40,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey, // Color of the bottom border
                  width: 1.0, // Width of the bottom border
                ),
              ),
            ),
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
              indicatorColor: const Color(0xFFEE1D52),
              unselectedLabelColor:
                  Colors.grey, // Color for unselected tab label
            ),
          ),
          Expanded(
            child: Container(
              height: 200,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TabBarView(
                controller: _tabController,
                children: [
                  ProductGridView(
                    category: "electronics",
                    isForDisplay: true,
                    selectedTabIndex: _selectedTabIndex,
                  ),

                  // Content for "New" tab
                  ProductGridView(
                    category: "skincare",
                    isForDisplay: true,
                    selectedTabIndex: _selectedTabIndex,
                  ),

                  // Content for "Electronics" tab
                  ProductGridView(
                    category: "electronics",
                    isForDisplay: true,
                    selectedTabIndex: _selectedTabIndex,
                  ),

                  // Content for "Fragrances" tab
                  ProductGridView(
                    category: "fragrances",
                    isForDisplay: true,
                    selectedTabIndex: _selectedTabIndex,
                  ),
                  // Content for "Skincare" tab
                  ProductGridView(
                    category: "skincare",
                    isForDisplay: true,
                    selectedTabIndex: _selectedTabIndex,
                  ),
                  // Content for "Groceries" tab
                  ProductGridView(
                    category: "groceries",
                    isForDisplay: true,
                    selectedTabIndex: _selectedTabIndex,
                  ),
                  // Content for "Home Decor" tab
                  ProductGridView(
                    category: "home-decor",
                    isForDisplay: true,
                    selectedTabIndex: _selectedTabIndex,
                  ),
                  // Content for "Furniture" tab
                  ProductGridView(
                    category: "furniture",
                    isForDisplay: true,
                    selectedTabIndex: _selectedTabIndex,
                  ),
                  // Content for "Fashion" tab
                  ProductGridView(
                    category: "fashion",
                    isForDisplay: true,
                    selectedTabIndex: _selectedTabIndex,
                  ),
                  // Content for "Accessories" tab

                  ProductGridView(
                    category: "accessories",
                    isForDisplay: true,
                    selectedTabIndex: _selectedTabIndex,
                  ),
                  // Content for "Automotive" tab

                  ProductGridView(
                    category: "automotive",
                    isForDisplay: true,
                    selectedTabIndex: _selectedTabIndex,
                  ),
                  // Content for "Lighting" tab
                  ProductGridView(
                    category: "lighting",
                    isForDisplay: true,
                    selectedTabIndex: _selectedTabIndex,
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
