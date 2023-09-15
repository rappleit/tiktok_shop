import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  final String Username;
  final String Date;
  final String description;

  const CommentCard({
    super.key,
    required this.Username,
    required this.Date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
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
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                Date,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(description),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.whatshot_outlined,
                      size: 16,
                      color: Color.fromARGB(255, 92, 92, 92),
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      "150",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 92, 92, 92),
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
                      size: 16,
                      color: Color.fromARGB(255, 92, 92, 92),
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      "Reply",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 92, 92, 92),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
