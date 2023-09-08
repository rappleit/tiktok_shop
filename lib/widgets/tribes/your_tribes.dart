import 'package:flutter/material.dart';
import 'package:tiktok_shop/dummy_data/tribes/your_tribe_item.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class YourTribes extends StatefulWidget {
  const YourTribes({super.key});

  @override
  State<YourTribes> createState() => _YourTribesState();
}

class _YourTribesState extends State<YourTribes> {
  final alphabets =
      List.generate(26, (index) => String.fromCharCode(index + 65));
  int _searchIndex = 0;
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener =
      ItemPositionsListener.create();

  void setSearchIndex(String searchLetter) {
    setState(() {
      _searchIndex = yourTribesData
          .indexWhere((element) => element.name[0] == searchLetter);
      _itemScrollController.jumpTo(index: _searchIndex);
    });
  }

  @override
  void initState() {
    super.initState();
    yourTribesData
        .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                child: Text(
                  "Your Tribes",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ScrollablePositionedList.builder(
                        itemScrollController: _itemScrollController,
                        itemPositionsListener: _itemPositionsListener,
                        itemCount: yourTribesData.length,
                        itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // NOT just yourTribesData as won't be able to click to navigate
                          children: [yourTribesData[index]],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.centerRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: alphabets
                              .map((alphabet) => InkWell(
                                    onTap: () {
                                      setSearchIndex(alphabet);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 1, vertical: 4),
                                      child: Text(
                                        alphabet,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(fontSize: 14),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Expanded(
              //   child: SingleChildScrollView(
              //     scrollDirection: Axis.vertical,
              //     child: Column(
              //       children: [
              //         YourTribeItem(
              //           imageUrl: 'https://picsum.photos/250?image=9',
              //           name: 'Your Tribe 1',
              //           subscriberCount: 2839482,
              //         ),
              //         YourTribeItem(
              //           imageUrl: 'https://picsum.photos/250?image=9',
              //           name: 'Your Tribe 2',
              //           subscriberCount: 487482,
              //         ),
              //         YourTribeItem(
              //           imageUrl: 'https://picsum.photos/250?image=9',
              //           name: 'Your Tribe 3',
              //           subscriberCount: 2882,
              //         ),
              //         YourTribeItem(
              //           imageUrl: 'https://picsum.photos/250?image=9',
              //           name: 'Your Tribe 4',
              //           subscriberCount: 999,
              //         ),
              //         YourTribeItem(
              //           imageUrl: 'https://picsum.photos/250?image=9',
              //           name: 'Your Tribe 5',
              //           subscriberCount: 55555,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
