import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final String content;

  const ActivityCard({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        height: 44,
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 41,
                height: 44,
                decoration: const ShapeDecoration(
                  color: Color(0xFF6FD0F1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 9,
              top: 10,
              child: Container(
                width: 23,
                height: 23,
                decoration: const BoxDecoration(
                  color: Colors.transparent, // Transparent background
                ),
                child: const Center(
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white, // Change to your desired icon color
                    size: 16, // Adjust the size as needed
                  ),
                ),
              ),
            ),
            Positioned(
              left: 49,
              top: 18,
              child: Text(
                content,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
            Positioned(
              left: 308,
              top: 18,
              child: SizedBox(
                width: 43,
                child: Text(
                  '5m ago',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
