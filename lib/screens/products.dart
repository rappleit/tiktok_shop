import 'package:flutter/material.dart';
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
  List<String> tabs = ['Recommended', 'New', 'Beauty', 'Food', 'Household'];

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProductItem(
                            imageUrl: 'https://picsum.photos/250?image=9',
                            title: 'Product 3',
                            price: 5.99,
                          ),
                          ProductItem(
                            imageUrl: 'https://picsum.photos/250?image=9',
                            title: 'Product 4',
                            price: 5.99,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Content for "New" tab
                Container(
                  color: Colors.green,
                ),
                // Content for "Beauty" tab
                Container(
                  color: Colors.yellow,
                ),
                // Content for "Food" tab
                Container(
                  color: Colors.orange,
                ),
                // Content for "House" tab
                Container(
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
