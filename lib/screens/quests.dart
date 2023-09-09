import 'package:flutter/material.dart';
import 'package:tiktok_shop/widgets/quests/quest.dart';

class Quests extends StatelessWidget {
  const Quests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(237, 255, 255, 255),
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              'Quests',
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
        iconTheme: IconThemeData(),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Quest(
            name: "Explorer",
            description: "Logged in 1 day",
            progress: 1,
            daysLeft: 1,
            reward: 2,
          ),
          Quest(
            name: "Big Hearted",
            description: "Gift 1 person something from their wishlist",
            progress: 0,
            reward: 8,
          ),
          Quest(
            name: "Refer-ee",
            description: "Referred and invited 3 friends",
            progress: 0.3,
            reward: 5,
          ),
          Quest(
            name: "The Tribe Insight",
            description: "Contribute 3 posts to any tribe",
            progress: 0.6,
            reward: 5,
          ),
        ]),
      ),
    );
  }
}
