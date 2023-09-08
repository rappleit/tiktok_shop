import 'package:flutter/material.dart';

class HeaderTribe extends StatefulWidget {
  final String title;
  final String followers;
  final String header;
  final String subheader;
  final String imageUrl;

  HeaderTribe({
    required this.title,
    required this.followers,
    required this.header,
    required this.subheader,
    required this.imageUrl,
  });

  @override
  _HeaderTribeState createState() => _HeaderTribeState();
}

class _HeaderTribeState extends State<HeaderTribe> {
  bool isJoined = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      color: Color(0xFFFF9393),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            widget.followers,
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF4B4B4B),
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.whatshot,
                            size: 20,
                            color: Color(0xFF4B4B4B)
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xFF4B4B4B),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
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
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10), // Space between header and subheader
            Text(
              widget.subheader,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF4B4B4B),
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