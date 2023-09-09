import 'package:flutter/material.dart';

class RewardCard extends StatelessWidget {
  final String rewardName;
  final Color color;
  final int coinsNeeded;
  final String id;
  final IconData icon;

  const RewardCard(
      {super.key,
      required this.rewardName,
      required this.color,
      required this.coinsNeeded,
      required this.id,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        onPressed: () {},
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
              size: 36,
            ),
            const SizedBox(width: 16),
            // Reward Name
            Text(
              rewardName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  '$coinsNeeded',
                  style: const TextStyle(
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
      ),
    );
  }
}
