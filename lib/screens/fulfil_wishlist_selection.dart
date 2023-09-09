import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/product_item.dart';

class FulfilWishlistSelection extends StatefulWidget {
  final String name;
  final List<ProductItem> productItems;

  const FulfilWishlistSelection(
      {super.key, required this.name, required this.productItems});

  @override
  State<FulfilWishlistSelection> createState() =>
      _FulfilWishlistSelectionState();
}

class _FulfilWishlistSelectionState extends State<FulfilWishlistSelection> {
  List<ProductItem> selectedItems = [];
  TextEditingController messageController = TextEditingController();

  double calculateTotalAmount() {
    double total = 0.0;
    selectedItems.forEach((item) {
      total += item.price;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(237, 255, 255, 255),
      appBar: AppBar(
        title: Expanded(
          child: Text(
            "${widget.name}'s Wishlist",
            // Multi-lined appbar
            maxLines: 4,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        toolbarHeight: 80,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        iconTheme: IconThemeData(),
        backgroundColor: Colors.transparent,
      ),
      body: GestureDetector(
        onTap: () {
          // To hide keyboard when tapping anywhere on screen
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(
                'Select the products you would like to gift to ${widget.name}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'Total Amount: \$${calculateTotalAmount().toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Color(0xFFEE1D52),
                      ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.productItems.length,
                itemBuilder: (context, index) {
                  ProductItem item = widget.productItems[index];
                  bool isSelected = selectedItems.contains(item);
                  return GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      setState(() {
                        if (isSelected) {
                          selectedItems.remove(item);
                        } else {
                          selectedItems.add(item);
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(16, 8, 16, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: isSelected
                                ? Color(0xFFEE1D52)
                                : Colors.transparent,
                            width: 2),
                      ),
                      child: widget.productItems[index],
                    ),
                  );
                },
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    textCapitalization: TextCapitalization.characters,
                    maxLines: 3,
                    maxLength: 200,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText:
                          'Write something for ${widget.name} to send with your gifts!',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFFEE1D52),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        // When tapping buttons, also will hide keyboard
                        FocusScope.of(context).unfocus();
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "Checkout",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
