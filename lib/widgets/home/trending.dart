import 'package:flutter/material.dart';
import 'package:tiktok_shop/widgets/tribes/post.dart';

class Trending extends StatelessWidget {
  const Trending({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            "Trending in Tribes",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Post()
      ],
    );
  }
}
