import 'package:flutter/material.dart';
import 'package:tiktok_shop/widgets/home/gifts_inbox.dart';
import 'package:tiktok_shop/widgets/home/inbox_tab.dart';

class Inbox extends StatelessWidget {
  const Inbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: 100,
        left: 0,
        right: 0,
        child: Column(
          children: [
            InboxTab(
              iconWidget: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.red, Colors.lightBlue],
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.card_giftcard,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
              title: "Gift Inbox",
              activity: "You received a gift from asycodes",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GiftsInbox()),
                );
              },
            ),
            InboxTab(
              iconWidget: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: const Center(
                  child: Icon(
                    Icons.people,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
              title: "New followers",
              activity: "semipreparedcat started following you",
              onTap: () {},
            ),
            InboxTab(
              iconWidget: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.redAccent,
                ),
                child: const Center(
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
              title: "Activities",
              activity: "asycodes replied to your comment:alw...",
              onTap: () {},
            ),
            InboxTab(
              iconWidget: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: const Center(
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
              title: "System notifications",
              activity: "LIVE: Who will be the next Tiktok Star? ⭐",
              onTap: () {},
            ),
            InboxTab(
              iconWidget: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: Center(
                    child: Image.network(
                        "https://avatars.githubusercontent.com/u/80181684?v=4")),
              ),
              title: "Semipreparedcat",
              activity: "shared a Quest",
              onTap: () {},
            ),
          ],
        ),
      ),
    ]);
  }
}
