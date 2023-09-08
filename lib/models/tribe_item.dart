import 'package:flutter/material.dart';

class TribeItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int? numFollowing;

  const TribeItem({
    required this.imageUrl,
    required this.name,
    this.numFollowing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 16, 10, 12),
      width: 115,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
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
                        imageUrl,
                        width: 25,
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
