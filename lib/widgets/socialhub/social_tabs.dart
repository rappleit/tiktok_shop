import 'package:flutter/material.dart';
import 'package:tiktok_shop/screens/socialhub/gift_finder1.dart';
import 'package:tiktok_shop/screens/socialhub/quests.dart';
import 'package:tiktok_shop/screens/socialhub/wishlists.dart';

class SocialTabsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SocialTab(
              title: 'Wishlists',
              icon: Icons.favorite,
              route: WishLists(),
            ),
            SocialTab(
              title: 'Quests',
              icon: Icons.explore,
              route: Quests(),
            ),
            SocialTab(
              title: 'Gift Finder',
              icon: Icons.card_giftcard,
              route: GiftFinder1(),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialTab extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget route;

  SocialTab({
    required this.title,
    required this.icon,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => route),
      ),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              width: 64.0,
              height: 64.0,
              decoration: BoxDecoration(
                color: Color(0xFFEE1D52),
                borderRadius: BorderRadius.circular(8.0), // Rounded square
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 32.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title, style: Theme.of(context).textTheme.titleSmall),
            ),
          ],
        ),
      ),
    );
  }
}
