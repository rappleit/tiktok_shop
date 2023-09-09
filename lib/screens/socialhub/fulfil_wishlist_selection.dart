import 'package:flutter/material.dart';
import 'package:tiktok_shop/models/product_item.dart';

class FulfilWishlistSelection extends StatefulWidget {
  final String name;
  final List products;

  const FulfilWishlistSelection(
      {super.key, required this.name, required this.products});

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
      backgroundColor: const Color.fromARGB(237, 255, 255, 255),
      appBar: AppBar(
        title: Expanded(
          child: Text(
            "${widget.name}'s Wishlist",
            // Multi-lined appbar
            maxLines: 4,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        toolbarHeight: 80,
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
          // To hide keyboard when tapping anywhere on screen
          FocusScope.of(context).requestFocus(FocusNode());
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
            const SizedBox(
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
                itemCount: widget.products.length,
                itemBuilder: (context, index) {
                  final product = widget.products[index];
                  final item = ProductItem(
                    imageUrl: product.value["imageUrl"],
                    title: product.value["title"],
                    price: product.value["price"],
                    id: product.key,
                    isFulfillWishlist: true,
                  );
                  bool isSelected =
                      selectedItems.any((prdtItem) => prdtItem.id == item.id);
                  return GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      setState(
                        () {
                          isSelected
                              ? selectedItems.removeWhere(
                                  (prdtItem) => prdtItem.id == item.id)
                              : selectedItems.add(item);
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: isSelected
                                ? const Color(0xFFEE1D52)
                                : Colors.transparent,
                            width: 2),
                      ),
                      child: item,
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
                      color: const Color(0xFFEE1D52),
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
