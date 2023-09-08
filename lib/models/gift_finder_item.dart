import 'package:flutter/material.dart';

class GiftFinderItem extends StatelessWidget {
  final String imageUrl;
  final String tag;
  final VoidCallback onTap;

  const GiftFinderItem({
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
            CircleAvatar(backgroundImage: NetworkImage(imageUrl), radius: 70),
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
