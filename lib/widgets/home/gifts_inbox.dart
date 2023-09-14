import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/product_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GiftsInbox extends StatefulWidget {
  const GiftsInbox({super.key});

  @override
  State<GiftsInbox> createState() => _GiftsInboxState();
}

class _GiftsInboxState extends State<GiftsInbox> {
  List<ProductItem> selectedItems = [];
  bool isExpanded = false;
  String gifterName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(237, 255, 255, 255),
      appBar: AppBar(
        title: const Expanded(
          child: Text(
            "Gift Inbox",
            // Multi-lined appbar
            maxLines: 4,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        iconTheme: const IconThemeData(),
        backgroundColor: Colors.transparent,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(
                'Your gifts',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "",
                  // 'Total Amount: \$${calculateTotalAmount().toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Color(0xFFEE1D52),
                      ),
                ),
              ),
            ),
            StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('user')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting ||
                    !snapshot.hasData) {
                  return CircularProgressIndicator();
                }

                var allGifts = snapshot.data!["gifts"];

                return Expanded(
                  child: ListView.builder(
                    itemCount: allGifts.length,
                    itemBuilder: (context, index) {
                      final giftsByUser = allGifts[index];
                      gifterName = giftsByUser['from'];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: const Color(0xFFEE1D52), width: 2),
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      giftsByUser['note'].length > 20
                                          ? '${giftsByUser['note'].substring(0, 20)}...'
                                          : giftsByUser['note'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              fontWeight: FontWeight.normal),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "- ${giftsByUser['from']}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    Icon(isExpanded
                                        ? Icons.arrow_drop_up_outlined
                                        : Icons.arrow_drop_down_outlined)
                                  ],
                                ),
                              ),
                            ),
                            if (isExpanded)
                              Column(
                                children: [
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: giftsByUser["products"].length,
                                    itemBuilder: (context, index) {
                                      final product =
                                          giftsByUser["products"][index];

                                      final item = ProductItem(
                                        imageUrl: product[product.keys.first]
                                            ["imageUrl"],
                                        title: product[product.keys.first]
                                            ["title"],
                                        price: product[product.keys.first]
                                                ["price"]
                                            .toDouble(),
                                        id: product.keys.first,
                                        isFulfillWishlist: true,
                                      );

                                      return Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            24, 8, 24, 0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.black, width: 1),
                                        ),
                                        child: item,
                                      );
                                    },
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(24, 8, 24, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.black, width: 1),
                                    ),
                                    child: Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 2, 0, 0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        margin: const EdgeInsets.all(16),
                                        child: Text(
                                          'Note:\n"${giftsByUser['note']}"',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
