import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/home/tab_item.dart';
import 'package:tiktok_shop/screens/socialhub/socialhub.dart';
import 'package:tiktok_shop/screens/tribes/tribes.dart';

class TabsRow extends StatefulWidget {
  const TabsRow({super.key});
  @override
  State<TabsRow> createState() => _TabsRowState();
}

class _TabsRowState extends State<TabsRow> {
  final _selectedIndex = 0;

  List<TabItem> tabItems = [
    TabItem(title: 'For You', hasNotification: false),
    TabItem(title: 'Tribes', hasNotification: true, route: TabRoute.tribes),
    TabItem(
        title: 'Social Hub', hasNotification: true, route: TabRoute.socialHub),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: tabItems
            .asMap()
            .entries
            .map((entry) => buildTab(entry.key, entry.value))
            .toList(),
      ),
    );
  }

  Widget buildTab(int index, TabItem tabItem) {
    return GestureDetector(
      onTap: () {
        setState(() {
          tabItem.hasNotification = false;
        });
        if (tabItem.route != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => _buildRoute(tabItem.route!),
            ),
          );
        }
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
              decoration: BoxDecoration(
                color: _selectedIndex == index
                    ? const Color(0xFFEE1D52)
                    : Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(tabItem.title,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontSize: 14,
                      color: _selectedIndex == index
                          ? Colors.white
                          : Colors.black)),
            ),
          ),
          if (tabItem.hasNotification)
            Positioned(
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEE1D52),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRoute(TabRoute route) {
    switch (route) {
      case TabRoute.tribes:
        return const TribesScreen();
      case TabRoute.socialHub:
        return const SocialHubScreen();
      default:
        throw Exception("Invalid route");
    }
  }
}
