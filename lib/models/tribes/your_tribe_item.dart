import 'package:flutter/material.dart';

class YourTribeItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int subscriberCount;

  const YourTribeItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.subscriberCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 2, 12, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              name,
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Text(
              formatNumber(subscriberCount),
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
            const Icon(Icons.person)
          ],
        ),
      ),
    );
  }
}

String formatNumber(int number) {
  if (number >= 1000000000) {
    double billions = number / 1000000000;
    return '${billions.toStringAsFixed(1)} b';
  } else if (number >= 1000000) {
    double millions = number / 1000000;
    return '${millions.toStringAsFixed(1)} m';
  } else if (number >= 1000) {
    double thousands = number / 1000;
    return '${thousands.toStringAsFixed(1)}k';
  } else {
    return number.toStringAsFixed(0);
  }
}
