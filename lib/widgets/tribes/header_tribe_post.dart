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
    return Column(children: [
      Container(
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
          ),
          child: Image.network(
            widget.imageUrl,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 5),
        color: Color.fromARGB(255, 255, 199, 199),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          widget.imageUrl,
                          height: 100,
                        )),
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
                            const Icon(Icons.person,
                                size: 20, color: Colors.black),
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
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft, // Align content to the left
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
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
                    )),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
