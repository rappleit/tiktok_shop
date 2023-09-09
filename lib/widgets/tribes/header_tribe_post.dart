import 'package:flutter/material.dart';

class HeaderTribePost extends StatefulWidget {
  final String title;
  final String followers;
  final String header;
  final String subheader;
  final String imageUrl;

  const HeaderTribePost({
    super.key,
    required this.title,
    required this.followers,
    required this.header,
    required this.subheader,
    required this.imageUrl,
  });

  @override
  State<HeaderTribePost> createState() => _HeaderTribePostState();
}

class _HeaderTribePostState extends State<HeaderTribePost> {
  bool isJoined = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      color: const Color(0xFFFF9393),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  child: Image.network(
                    widget.imageUrl,
                    height: 100,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            widget.followers,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF4B4B4B),
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Icon(Icons.whatshot,
                              size: 20, color: Color(0xFF4B4B4B)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isJoined = !isJoined;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: isJoined ? Colors.cyan : Colors.red,
                  ),
                  child: Text(
                    isJoined ? 'Joined' : 'Join',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xFF4B4B4B),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.black, // Thin line color
              thickness: 1, // Thickness of the line
              height: 20, // Space between the separator and the new content
            ),
            Align(
              alignment: Alignment.centerLeft, // Align content to the left
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.header,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                      height: 10), // Space between header and subheader
                  Text(
                    widget.subheader,
                    style: const TextStyle(
                      fontSize: 14,
                      color: const Color(0xFF4B4B4B),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
