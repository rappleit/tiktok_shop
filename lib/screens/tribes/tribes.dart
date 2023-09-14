import 'package:flutter/material.dart';
import 'package:tiktok_shop/widgets/tribes/filter_dropdown.dart';
import 'package:tiktok_shop/widgets/tribes/favourites.dart';
import 'package:tiktok_shop/widgets/tribes/most_popular.dart';
import 'package:tiktok_shop/widgets/tribes/post.dart';
import 'package:tiktok_shop/widgets/tribes/your_tribes.dart';

class TribesScreen extends StatefulWidget {
  const TribesScreen({super.key});

  @override
  State<TribesScreen> createState() => _TribesScreenState();
}

class _TribesScreenState extends State<TribesScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<String> tabs = ['Feed', 'Tribes'];
  String selectedPostType = 'All';
  final List<Map> postTypes = [
    {'label': 'All', 'icon': Icons.circle},
    {'label': 'Review', 'icon': Icons.rate_review},
    {'label': 'Enquiry', 'icon': Icons.question_answer},
    {'label': 'Tips', 'icon': Icons.lightbulb_outline},
    {'label': 'Misc', 'icon': Icons.category},
  ];
  String selectedSortType = 'Trending';
  final List<Map> sortTypes = [
    {'label': 'Trending', 'icon': Icons.trending_up},
    {'label': 'New', 'icon': Icons.new_releases},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: tabs.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(237, 255, 255, 255),
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              'Tribes',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              color: Theme.of(context).iconTheme.color,
              onPressed: () {
                // Implement shopping cart
              },
            ),
            IconButton(
              icon: const Icon(Icons.menu),
              color: Theme.of(context).iconTheme.color,
              onPressed: () {
                // Open the drawer
                Scaffold.of(context).openDrawer();
              },
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 30,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        iconTheme: const IconThemeData(),
        bottom: TabBar(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          controller: _tabController,
          tabs: tabs
              .map(
                (name) => Tab(
                  text: name,
                ),
              )
              .toList(),
          labelColor: Colors.black,
          labelStyle: Theme.of(context).textTheme.titleMedium,
          indicatorColor: const Color(0xFFEE1D52),
          unselectedLabelColor: Colors.grey,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: const Row(
                          children: [
                            SizedBox(width: 5),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search for posts',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFEE1D52),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 6),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        FilterDropdown(
                            options: postTypes,
                            selectedValue: selectedPostType,
                            onChanged: (value) {
                              setState(() {
                                selectedPostType = value;
                              });
                            }),
                        Spacer(),
                        FilterDropdown(
                            options: sortTypes,
                            selectedValue: selectedSortType,
                            onChanged: (value) {
                              setState(() {
                                selectedSortType = value;
                              });
                            }),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      const SingleChildScrollView(
                        child: Column(
                          children: [
                            Post(
                              isBigger: true,
                              imageUrl:
                                  "https://youthopia.sg/wp-content/uploads/2022/01/uniqlo-new-colours-airism-u-cotton-crew-neck-oversized-t-shirt-492x480.jpg",
                            ),
                            Post(
                              isBigger: true,
                              iconColor: Colors.red,
                              iconNumber: "98",
                              imageUrl:
                                  "https://lzd-img-global.slatic.net/g/p/03100fddb8c89bcfa46ce35e9d6e55ef.jpg_80x80q80.jpg_.webp",
                              title: "Let's talk Uniqlo trousers",
                              category: "Uniqlo Kings | Review",
                            ),
                            Post(
                              isBigger: true,
                              iconColor: Colors.purple,
                              iconNumber: "50",
                              imageUrl:
                                  "https://publish.one37pm.net/wp-content/uploads/2020/07/bestnewbalancesneakers-hero.jpg?fit=1600%2C707",
                              title: "New Balances > Yeezy",
                              category: "NB Warriors | Review",
                            ),
                            Post(
                              isBigger: true,
                              iconColor: Colors.black,
                              iconNumber: "17",
                              imageUrl:
                                  "https://www.mrporter.com/variants/images/1647597309528762/in/w560_q60.jpg",
                              title: "Best way to wash...",
                            ),
                            Post(
                              isBigger: true,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          right: 1,
                          bottom: 1,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.only(bottom: 15),
                              height: 70,
                              width: 70,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFEE1D52),
                              ),
                              child: const Icon(
                                Icons.edit,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: const Row(
                          children: [
                            SizedBox(width: 5),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search for tribes',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFEE1D52),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 6),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const MostPopular(),
              const ForYou(),
              const YourTribes(),
            ],
          ),
        ],
      ),
    );
  }
}
