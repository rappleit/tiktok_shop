import 'package:flutter/material.dart';

class Coins extends StatefulWidget {
  const Coins({super.key});

  @override
  State<Coins> createState() => _CoinsState();
}

class _CoinsState extends State<Coins> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 3,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      child: Row(
        children: [
          // Image.asset
          Image.asset(
            'assets/coin.png',
            width: 20,
            height: 20,
          ),
          SizedBox(width: 4),
          Text(
            '255',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
