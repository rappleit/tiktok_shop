import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiktok_shop/widgets/coin_shop/reward_card.dart';

class CoinScreen extends StatefulWidget {
  const CoinScreen({super.key});

  @override
  _CoinScreenState createState() => _CoinScreenState();
}

class _CoinScreenState extends State<CoinScreen> {
  int userCoins = 0;

  @override
  void initState() {
    super.initState();
    fetchUserCoins();
  }

  Future<void> fetchUserCoins() async {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final String userUid = user.uid;

      try {
        final DocumentSnapshot<Map<String, dynamic>> userSnapshot =
            await FirebaseFirestore.instance
                .collection('user')
                .doc(userUid)
                .get();

        final userData = userSnapshot.data();
        if (userData != null) {
          final userCoins = userData['coins'] as int;
          setState(() {
            this.userCoins = userCoins;
          });
        }
      } catch (error) {
        print('Error fetching user data: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(237, 255, 255, 255),
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              'My Coins',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Theme.of(context).iconTheme.color,
              onPressed: () {
                // Implement shopping cart
              },
            ),
            IconButton(
              icon: Icon(Icons.menu),
              color: Theme.of(context).iconTheme.color,
              onPressed: () {
                // Open the drawer
                Scaffold.of(context).openDrawer();
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 0),
            color: Colors.white,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Redeemable Coins",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Color(0xFFEE1D52),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/coin.png',
                        width: 28,
                        height: 28,
                      ),
                      SizedBox(width: 8),
                      Text("$userCoins",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 0),
            child: Column(
              children: [
                Text("Redeem Rewards",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 12),
                RewardCard(
                  rewardName: "5% Discount",
                  color: Colors.pink,
                  coinsNeeded: 1000,
                  id: "5percentdiscount",
                  icon: Icons.local_offer,
                ),
                RewardCard(
                  rewardName: "10% Discount",
                  color: Colors.blue,
                  coinsNeeded: 2000,
                  id: "10percentdiscount",
                  icon: Icons.local_offer,
                ),
                RewardCard(
                  rewardName: "15% Discount",
                  color: Colors.green,
                  coinsNeeded: 2800,
                  id: "15percentdiscount",
                  icon: Icons.local_offer,
                ),
                RewardCard(
                  rewardName: "Free Shipping",
                  color: Colors.blue,
                  coinsNeeded: 4000,
                  id: "freeshipping",
                  icon: Icons.local_shipping,
                ),
                RewardCard(
                  rewardName: "\$3 Cashback",
                  color: Colors.pink,
                  coinsNeeded: 6000,
                  id: "3cashback",
                  icon: Icons.attach_money,
                ),
                RewardCard(
                  rewardName: "\$7 Cashback",
                  color: Colors.blue,
                  coinsNeeded: 9000,
                  id: "7cashback",
                  icon: Icons.attach_money,
                ),
                RewardCard(
                  rewardName: "Donate \$3 to charity",
                  color: Colors.orange,
                  coinsNeeded: 3000,
                  id: "donate",
                  icon: Icons.favorite,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
