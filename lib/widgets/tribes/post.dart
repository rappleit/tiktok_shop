import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:tiktok_shop/screens/tribes/video_posts.dart';

class Post extends StatefulWidget {
  final bool isBigger;
  final Color? iconColor;
  final String? iconNumber;
  final String? category;
  final String? title;
  final String? imageUrl;

  const Post({
    super.key,
    this.isBigger = false,
    this.iconColor,
    this.iconNumber,
    this.category,
    this.title,
    this.imageUrl,
  });

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DiscussionThreadPage(
                Username: 'samuelking',
                Date: '12 June 2023',
                description: 'dasssssssss',
                videoUrl: 'assets/IMG_0069.MOV',
                score: 1200), //this is where we send data of the tribe
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: widget.isBigger ? 0 : 16, vertical: 8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          height: widget.isBigger ? 180 : null,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: widget.iconColor ?? Color(0xFFEE9A1D),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.iconNumber ?? "124",
                        style: TextStyle(
                          fontSize: widget.isBigger ? 22 : 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.whatshot,
                        size: widget.isBigger ? 30 : 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.category ?? "Fashion Tribe | Product Impact",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontFamily: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .fontFamily),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.title ?? "Uniqlo Airism Tshirt Review",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 18),
                      ),
                      if (widget.isBigger) const SizedBox(height: 4),
                      if (widget.isBigger)
                        Text(
                          '@Gnoot',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.grey),
                        ),
                      if (widget.isBigger)
                        Row(
                          children: [
                            Text(
                              '4h ago   |',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: Colors.grey),
                            ),
                            TextButton(
                              onPressed: () {
                                Share.share('Check out this awesome app!');
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'Share',
                                    style: TextStyle(
                                        fontFamily: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .fontFamily),
                                  ),
                                  const Icon(Icons.share, size: 20)
                                ],
                              ),
                            ),
                          ],
                        )
                    ],
                  ),
                ),
              ),
              if (widget.isBigger)
                Container(
                  child: Image.network(
                    widget.imageUrl ?? "https://picsum.photos/250?image=9",
                    width: 100,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
