import 'package:flutter/material.dart';

class RewardCard extends StatelessWidget {
  final String rewardName;
  final Color color;
  final int coinsNeeded;
  final String id;
  final IconData icon;

  RewardCard(
      {required this.rewardName,
      required this.color,
      required this.coinsNeeded,
      required this.id,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 3,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
            size: 36,
          ),
          SizedBox(width: 16),
          // Reward Name
          Text(
            rewardName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Spacer(),
          Row(
            children: [
              Text(
                '$coinsNeeded',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 4),
              Image.asset(
                'assets/coin.png',
                width: 20,
                height: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}
