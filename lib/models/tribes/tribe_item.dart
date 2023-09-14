import 'package:flutter/material.dart';
import 'package:tiktok_shop/screens/tribes/tribe_posts.dart';
import 'dart:math';

class TribeItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int? numFollowing;

  const TribeItem({
    super.key,
    required this.imageUrl,
    required this.name,
    this.numFollowing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const TribePosts(), //this is where we send data of the tribe
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 16, 10, 12),
        width: 115,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Image.network(
                imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              Text(
                name,
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              if (numFollowing != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < numFollowing!; i++)
                      ClipOval(
                        child: Image.network(
                          getRandomImageUrl(),
                          width: 35,
                        ),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  String getRandomImageUrl() {
    final List<String> imageUrls = [
      'https://avatars.githubusercontent.com/u/86306864?s=400&u=6d391bbde5fc02abbd33b714517fb294ef9d8313&v=4',
      'https://avatars.githubusercontent.com/u/45510188?v=4',
      'https://avatars.githubusercontent.com/u/80181684?v=4',
    ];
    Random random = Random();
    int index = random.nextInt(imageUrls.length);
    return imageUrls[index];
  }
}
