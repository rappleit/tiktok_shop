import 'package:flutter/material.dart';

class EventGallery extends StatelessWidget {
  final PageController _pageController = PageController(
    viewportFraction: 0.90,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        controller: _pageController,
        itemCount: 3, // Number of cards
        itemBuilder: (BuildContext context, int index) {
          return EventCard(
            imagePath: 'assets/socialhub/event-banner-1.png',
          );
        },
        pageSnapping: false, // Disable snapping for smoother effect
        physics: BouncingScrollPhysics(), // Add a bouncy effect
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String imagePath;

  EventCard({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.0,
      height: 200.0,
      margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
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
                    'September Challenge: Invite a Friend!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '20k participants',
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
    );
  }
}
