import 'package:flutter/material.dart';

class GiftFinderItem extends StatelessWidget {
  final String imageUrl;
  final String tag;
  final VoidCallback onTap;

  const GiftFinderItem({
    super.key,
    required this.imageUrl,
    required this.tag,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imageUrl),
              radius: 70,
              backgroundColor: Colors.white,
            ),
            Text(
              tag,
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
