import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/socialhub/gift_finder_item.dart';
import 'package:tiktok_shop/screens/socialhub/gift_finder3.dart';

class GiftFinder2 extends StatelessWidget {
  final List<String> selectedTags;
  const GiftFinder2({
    super.key,
    required this.selectedTags,
  });

  @override
  Widget build(BuildContext context) {
    void addToSelectedTags(String tag) {
      selectedTags.add(tag);
    }

    void navigateToNextScreen(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GiftFinder3(selectedTags: selectedTags),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(237, 255, 255, 255),
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              'Gift Finder',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              color: Theme.of(context).iconTheme.color,
              onPressed: () {
                // Implement shopping cart
              },
            ),
            IconButton(
              icon: const Icon(Icons.menu),
              color: Theme.of(context).iconTheme.color,
              onPressed: () {
                // Open the drawer
                Scaffold.of(context).openDrawer();
              },
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            selectedTags.removeLast();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text('What else would they like?',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GiftFinderItem(
                imageUrl: "assets/socialhub/stylish-icon.png",
                tag: 'Stylish',
                onTap: () {
                  addToSelectedTags('Stylish');
                  navigateToNextScreen(context);
                },
              ),
              GiftFinderItem(
                imageUrl: "assets/socialhub/casual-icon.png",
                tag: 'Casual',
                onTap: () {
                  addToSelectedTags('Casual');
                  navigateToNextScreen(context);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GiftFinderItem(
                imageUrl: "assets/socialhub/artistic-icon.png",
                tag: 'Artistic',
                onTap: () {
                  addToSelectedTags('Artistic');
                  navigateToNextScreen(context);
                },
              ),
              GiftFinderItem(
                imageUrl: "assets/socialhub/practical-icon.png",
                tag: 'Practical',
                onTap: () {
                  addToSelectedTags('Practical');
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
