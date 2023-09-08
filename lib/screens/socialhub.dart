import 'package:flutter/material.dart';
import 'package:tiktok_shop/widgets/socialhub/activity_feed_preview.dart';
import 'package:tiktok_shop/widgets/socialhub/event_gallery.dart';
import 'package:tiktok_shop/widgets/socialhub/social_tabs.dart';
import 'package:tiktok_shop/widgets/socialhub/wishlists_preview.dart';

class SocialHubScreen extends StatelessWidget {
  const SocialHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Text(
                'Social Hub',
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
          EventGallery(),
          SocialTabsRow(),
          WishlistsPreviewWidget(),
          ActivityFeedPreviewWidget(),
        ])));
  }
}
