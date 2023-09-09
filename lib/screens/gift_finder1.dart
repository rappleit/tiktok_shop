import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/gift_finder_item.dart';
import 'package:tiktok_shop/screens/gift_finder2.dart';

class GiftFinder1 extends StatelessWidget {
  const GiftFinder1({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> selectedTags = [];

    void addToSelectedTags(String tag) {
      selectedTags.add(tag);
    }

    void navigateToNextScreen(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GiftFinder2(selectedTags: selectedTags),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(237, 255, 255, 255),
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              'Gift Finder',
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
              icon: Icon(
                Icons.menu,
              ),
              color: Theme.of(context).iconTheme.color,
              onPressed: () {
                // Open the drawer
                Scaffold.of(context).openDrawer();
              },
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text('Which style does your friend like?',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GiftFinderItem(
                imageUrl: "assets/socialhub/cute-icon.png",
                tag: 'Cute',
                onTap: () {
                  addToSelectedTags('Cute');
                  navigateToNextScreen(context);
                },
              ),
              GiftFinderItem(
                imageUrl: "assets/socialhub/elegant-icon.png",
                tag: 'Elegant',
                onTap: () {
                  addToSelectedTags('Elegant');
                  navigateToNextScreen(context);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GiftFinderItem(
                imageUrl: "assets/socialhub/trendy-icon.png",
                tag: 'Trendy',
                onTap: () {
                  addToSelectedTags('Trendy');
                  navigateToNextScreen(context);
                },
              ),
              GiftFinderItem(
                imageUrl: "assets/socialhub/modern-icon.png",
                tag: 'Modern',
                onTap: () {
                  addToSelectedTags('Modern');
                  navigateToNextScreen(context);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
