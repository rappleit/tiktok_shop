import 'package:flutter/material.dart';
import 'package:tiktok_shop/widgets/tribes/header_tribe_post.dart';
import 'package:tiktok_shop/widgets/tribes/post.dart';
import 'package:tiktok_shop/widgets/tribes/filter_dropdown.dart';

class TribePosts extends StatefulWidget {
  const TribePosts({super.key});

  @override
  State<TribePosts> createState() => _TribePostsState();
}

class _TribePostsState extends State<TribePosts> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(237, 255, 255, 255),
      appBar: AppBar(
        title: Row(
          children: [
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              color: Colors.white,
              onPressed: () {
                // Implement shopping cart
              },
            ),
            IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {
                // Open the drawer
                Scaffold.of(context).openDrawer();
              },
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(57, 0, 0, 0),
        iconTheme: const IconThemeData(),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.white),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const HeaderTribePost(
            title: 'UniqloShirts',
            followers: '312k',
            header: 'We love Uniqlo Shirts! <3',
            subheader:
                'Welcome to Uniqlo (heard of that before many times?) Here we talk anything and everything uniqlo shirts. Its so versatile and affordable that we all sometimes struggle to pair it with cute pants/skirt. So lets talk a lil about uniqlo shirts, shall we?',
            imageUrl:
                'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2080&q=80',
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
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
                  const Spacer(),
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
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                children: [
                  const Post(
                    isBigger: true,
                    imageUrl:
                        "https://youthopia.sg/wp-content/uploads/2022/01/uniqlo-new-colours-airism-u-cotton-crew-neck-oversized-t-shirt-492x480.jpg",
                  ),
                  const Post(
                    isBigger: true,
                    iconColor: Colors.red,
                    iconNumber: "98",
                    imageUrl:
                        "https://lzd-img-global.slatic.net/g/p/03100fddb8c89bcfa46ce35e9d6e55ef.jpg_80x80q80.jpg_.webp",
                    title: "Let's talk Uniqlo trousers",
                  ),
                ],
              )),
        ],
      )),
    );
  }
}
