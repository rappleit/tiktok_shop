import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/product_grid.dart';
import 'package:tiktok_shop/models/product_item.dart';
import 'package:tiktok_shop/widgets/bottom_navbar.dart';

class ProductScreen extends StatefulWidget {
  final int selectedTabIndex;
  const ProductScreen({super.key, required this.selectedTabIndex});

  @override
  _ProductScreenState createState() => _ProductScreenState();
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
              icon: Icon(Icons.assignment_rounded),
              color: Colors.black,
              onPressed: () {
                // Implement quest
              },
            ),
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
            height: 40,
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
          Container(
            height: MediaQuery.of(context).size.height - 250,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                    child: ProductGridView(
                  category: "electronics",
                )),

                // Content for "New" tab
                SingleChildScrollView(
                    child: ProductGridView(
                  category: "skincare",
                )),
                // Content for "Electronics" tab
                SingleChildScrollView(
                    child: ProductGridView(
                  category: "electronics",
                )),
                // Content for "Fragrances" tab
                SingleChildScrollView(
                    child: ProductGridView(
                  category: "fragrances",
                )),
                // Content for "Skincare" tab
                SingleChildScrollView(
                    child: ProductGridView(
                  category: "skincare",
                )),
                // Content for "Groceries" tab
                SingleChildScrollView(
                    child: ProductGridView(
                  category: "groceries",
                )),
                // Content for "Home Decor" tab
                SingleChildScrollView(
                    child: ProductGridView(
                  category: "home-decor",
                )),
                // Content for "Furniture" tab
                SingleChildScrollView(
                    child: ProductGridView(
                  category: "furniture",
                )),
                // Content for "Fashion" tab
                SingleChildScrollView(
                    child: ProductGridView(
                  category: "fashion",
                )),
                // Content for "Accessories" tab
                SingleChildScrollView(
                    child: ProductGridView(
                  category: "accessories",
                )),
                // Content for "Automotive" tab
                SingleChildScrollView(
                    child: ProductGridView(
                  category: "automotive",
                )),
                // Content for "Lighting" tab
                SingleChildScrollView(
                    child: ProductGridView(
                  category: "lighting",
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
