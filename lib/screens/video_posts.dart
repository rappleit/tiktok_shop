import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:tiktok_shop/models/comment_card.dart';

class DiscussionThreadPage extends StatefulWidget {
  final String Username;
  final String Date;
  final String description;
  final String? videoUrl;
  final int score; // Add a score property

  const DiscussionThreadPage({
    required this.Username,
    required this.Date,
    required this.description,
    this.videoUrl,
    required this.score, // Pass the score value
  });

  @override
  _DiscussionThreadPageState createState() => _DiscussionThreadPageState();
}

class _DiscussionThreadPageState extends State<DiscussionThreadPage> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    // Initialize the video player and chewie controller
    _videoPlayerController = VideoPlayerController.asset('assets/IMG_0069.MOV');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 9 / 16, // Set the aspect ratio based on your video's dimensions
      autoPlay: true,
      looping: true,
    );
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
      backgroundColor: Color.fromARGB(237, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView( // Use SingleChildScrollView to allow scrolling
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(16.0), // Add margin
              child: Card(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Uniqlo Airism Review',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Come on who doesnt like this shirt its insane!!!!!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFFF9393), width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.whatshot,
                              size: 20,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              widget.score.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFF9393),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: Chewie(controller: _chewieController),
            ),
            // Your video widget or post details here
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 13, // Replace with the actual number of comments
              itemBuilder: (BuildContext context, int index) {
                return CommentCard(
                  Username: '@davereach',
                  Date: '12th June 2023',
                  description: 'Uniqlo shirts are supposed to be like that noob!',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
