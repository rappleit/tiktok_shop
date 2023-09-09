import 'package:flutter/material.dart';


class CommentCard extends StatelessWidget {
  final String Username;
  final String Date;
  final String description;

  const CommentCard({
    required this.Username,
    required this.Date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
  margin: EdgeInsets.all(10), // Adjust margin as needed
  padding: EdgeInsets.all(10), // Adjust padding as needed
  decoration: BoxDecoration(
    color: Colors.white, // Set background color
    borderRadius: BorderRadius.circular(10), // Add rounded corners if desired
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 3),
      ),
    ],
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            Username,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            Date,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
      SizedBox(height: 8), // Add spacing between username/date and comment text
      Text(description),
    ],
  ),
);
}}