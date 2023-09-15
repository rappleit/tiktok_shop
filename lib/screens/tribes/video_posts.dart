import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/tribes/comment_card.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class DiscussionThreadPage extends StatefulWidget {
  final String Username;
  final String Date;
  final String description;
  final String? videoUrl;
  final int score; // Add a score property

  const DiscussionThreadPage({
    super.key,
    required this.Username,
    required this.Date,
    required this.description,
    this.videoUrl,
    required this.score, // Pass the score value
  });

  @override
  State<DiscussionThreadPage> createState() => _DiscussionThreadPageState();
}

class _DiscussionThreadPageState extends State<DiscussionThreadPage> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  List<Map<String, String>> comments = [
    {
      'Username': '@user123',
      'Date': '12th June 2023',
      'description':
          "I couldn't agree more! Uniqlo Airism shirts are a game-changer. They are incredibly comfortable and perfect for hot weather. I practically live in them during the summer!",
    },
    {
      'Username': '@fashionista22',
      'Date': '15th June 2023',
      'description':
          "Absolutely love Uniqlo Airism shirts! The breathability and lightweight feel make them a must-have in my wardrobe. Plus, they come in a variety of colors and styles to suit any occasion.",
    },
    {
      'Username': '@coolshirtlover',
      'Date': '18th June 2023',
      'description':
          "I'm with you on this one! Uniqlo Airism shirts are unbeatable when it comes to comfort and versatility. It's like wearing a cloud on a hot day.",
    },
    {
      'Username': '@style_guru',
      'Date': '21st June 2023',
      'description':
          "Uniqlo Airism shirts are pure magic! The way they keep you cool and dry in the heat is unmatched. I can't get enough of them!",
    },
    {
      'Username': '@shirtfanatic',
      'Date': '24th June 2023',
      'description':
          "I'm a huge fan of Uniqlo Airism shirts too! They are so comfortable that I've even started wearing them as an undershirt year-round. Uniqlo really nailed it with these.",
    },
    {
      'Username': '@summer_vibes',
      'Date': '27th June 2023',
      'description':
          "It's hard to find a shirt that's both stylish and comfortable, but Uniqlo Airism manages to do just that. I'm always impressed with how they keep me feeling fresh in any weather.",
    },
    {
      'Username': '@comfy_chic',
      'Date': '30th June 2023',
      'description':
          "Couldn't agree more! Uniqlo Airism shirts are my go-to for everyday wear. They're a true wardrobe essential, especially during the summer months.",
    }
  ];
  @override
  void initState() {
    super.initState();

    // Initialize the video player and chewie controller
    _videoPlayerController = VideoPlayerController.asset('assets/IMG_0069.MOV');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio:
          9 / 16, // Set the aspect ratio based on your video's dimensions
      autoPlay: true,
      looping: true,
      autoInitialize: true,
    );
    _videoPlayerController.initialize().then((_) {
      setState(() {
        // Set the state to rebuild the widget after video controller is initialized.
        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController,
          aspectRatio: _videoPlayerController.value.aspectRatio,
          autoPlay: true,
          autoInitialize: true,
          looping: true,
        );
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(237, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        iconTheme: const IconThemeData(),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        // Use SingleChildScrollView to allow scrolling
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: Chewie(controller: _chewieController),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 80,
                            child: Image.network(
                              "https://youthopia.sg/wp-content/uploads/2022/01/uniqlo-new-colours-airism-u-cotton-crew-neck-oversized-t-shirt-492x480.jpg",
                            )),
                        SizedBox(height: 12),
                        Text("@Gnoot",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              'Uniqlo Airism Review',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ]),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  child: Container(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xFFEE1D52),
                              size: 24.0,
                            ),
                            const SizedBox(width: 4.0),
                            const Icon(
                              Icons.star,
                              color: Color(0xFFEE1D52),
                              size: 24.0,
                            ),
                            const SizedBox(width: 4.0),
                            const Icon(
                              Icons.star,
                              color: Color(0xFFEE1D52),
                              size: 24.0,
                            ),
                            const SizedBox(width: 4.0),
                            const Icon(
                              Icons.star,
                              color: Color(0xFFEE1D52),
                              size: 24.0,
                            ),
                            const SizedBox(width: 4.0),
                            const Icon(
                              Icons.star,
                              color: Color(0xFFEE1D52),
                              size: 24.0,
                            ),
                            const SizedBox(width: 12.0),
                            Text(
                              "\$19.00",
                              style: TextStyle(
                                  color: Color(0xFFEE1D52),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )
                          ]),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                'Come on who doesnt like this shirt its insane!!!!!',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.whatshot_outlined,
                                      size: 20,
                                      color: Color(0xFFEE1D52),
                                    ),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      widget.score.toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFEE1D52),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.comment,
                                      size: 20,
                                      color: Color(0xFFEE1D52),
                                    ),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      "Reply",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFEE1D52),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.share,
                                      size: 20,
                                      color: Color(0xFFEE1D52),
                                    ),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      "Share",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFEE1D52),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
                padding:
                    EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 8),
                child: Text("Replies",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ))),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: comments.length,
              itemBuilder: (BuildContext context, int index) {
                final comment = comments[index];
                return CommentCard(
                  Username: comment['Username'] ?? '',
                  Date: comment['Date'] ?? '',
                  description: comment['description'] ?? '',
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
