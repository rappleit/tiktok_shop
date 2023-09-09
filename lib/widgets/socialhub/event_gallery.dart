import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/tribes/your_tribe_item.dart';
import 'package:tiktok_shop/screens/socialhub/seasonal_quest.dart';

class EventGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: SizedBox(
        height: 200.0,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(), // Add a bouncy effect
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              EventCard(
                imagePath: 'assets/socialhub/event-banner-1.png',
                content: 'October Challenge: Spooky Savings!',
                participants: 280336,
              ),
              EventCard(
                content: 'December Challenge: Secret Santa!',
                imagePath: 'assets/socialhub/event-banner-3.png',
                participants: 4120336,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String imagePath;
  final String content;
  final int participants;

  EventCard(
      {required this.imagePath,
      required this.content,
      required this.participants});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SeasonalQuest()),
      ),
      child: Container(
        width: 360.0,
        height: 200.0,
        margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage(imagePath),
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment(0.0, -0.3),
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                    stops: [0.4, 1.0],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      content,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${formatNumber(participants)} participants",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
