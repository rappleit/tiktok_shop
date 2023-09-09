import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiktok_shop/screens/coin_shop.dart';

class Coins extends StatefulWidget {
  const Coins({super.key});

  @override
  State<Coins> createState() => _CoinsState();
}

class _CoinsState extends State<Coins> {
  String userUuid = '';
  int coins = 0;

  Future<void> fetchUserCoins() async {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      setState(() {
        userUuid = user.uid; // Get the UUID of the logged-in user
      });

      try {
        final DocumentSnapshot<Map<String, dynamic>> userSnapshot =
            await FirebaseFirestore.instance
                .collection('user')
                .doc(userUuid)
                .get();

        final userData = userSnapshot.data();
        if (userData != null) {
          final userCoins = userData['coins'] as int;
          setState(() {
            coins = userCoins;
          });
        }
      } catch (error) {
        print('Error fetching user data: $error');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserCoins();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CoinScreen(),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
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
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          child: Row(
            children: [
              // Image.asset
              Image.asset(
                'assets/coin.png',
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 4),
              Text(
                '$coins',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ));
  }
}
