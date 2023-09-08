import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:tiktok_shop/widgets/tribe_posts/header_tribe.dart';
import 'package:tiktok_shop/widgets/tribes/post.dart';
import 'package:tiktok_shop/widgets/tribes/filter_dropdown.dart';

class TribePosts extends StatelessWidget {
  const TribePosts({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(237, 255, 255, 255),
      appBar: AppBar(
        title: Row(
          children: [
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
        iconTheme: IconThemeData(),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
              // Handle menu item selection here
              if (value == 'Hot') {
                // Handle 'Hot' selection
              } else if (value == 'Trending') {
                // Handle 'Trending' selection
              } else if (value == 'New') {
                // Handle 'New' selection
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'Hot',
                child: Text('Hot'),
              ),
              PopupMenuItem<String>(
                value: 'Trending',
                child: Text('Trending'),
              ),
              PopupMenuItem<String>(
                value: 'New',
                child: Text('New'),
              ),
            ],
          ),
        ],
      ),
      body:  Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
        children: [
          HeaderTribe(
            title: 'UniqloShirts',
            followers: '3k',
            header: 'We love Uniqlo Shirts! <3',
            subheader:
                'Welcome to Uniqlo (heard of that before many times?) Here we talk anything and everything uniqlo shirts. Its so versatile and affordable that we all sometimes struggle to pair it with cute pants/skirt. So lets talk a lil about uniqlo shirts, shall we?',
            imageUrl:
                'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2080&q=80',
          ),
          FilterDropdown(),
          // Your other content can be added here, instead of PostsTribe
          Post(isBigger: true), 
          Post(isBigger: true),
          // Add more widgets as needed
        ],
      ),
    )
    );
  }
}

