import 'package:flutter/material.dart';
import 'package:tiktok_shop/widgets/bottom_navbar.dart';
import 'package:tiktok_shop/widgets/tribes/filter_dropdown.dart';
import 'package:tiktok_shop/widgets/tribes/post.dart';

class TribesScreen extends StatefulWidget {
  const TribesScreen({super.key});

  @override
  _TribesScreenState createState() => _TribesScreenState();
}

class _TribesScreenState extends State<TribesScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<String> tabs = ['Feed', 'Tribes'];

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
    return Scaffold(
      backgroundColor: Color.fromARGB(237, 255, 255, 255),
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              'Tribes',
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
        backgroundColor: Colors.transparent,
        toolbarHeight: 30,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        iconTheme: IconThemeData(),
        bottom: TabBar(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          controller: _tabController,
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
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.8),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            SizedBox(width: 5),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search for posts',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFEE1D52),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 6),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                FilterDropdown(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Post(
                          isBigger: true,
                        ),
                        Post(
                          isBigger: true,
                        ),
                        Post(
                          isBigger: true,
                        ),
                        Post(
                          isBigger: true,
                        ),
                        Post(
                          isBigger: true,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(color: Colors.green),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
