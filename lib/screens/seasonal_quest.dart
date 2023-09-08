import 'package:flutter/material.dart';
import 'package:tiktok_shop/widgets/quests/quest.dart';

class SeasonalQuest extends StatelessWidget {
  const SeasonalQuest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(237, 255, 255, 255),
      appBar: AppBar(
        title: Image.asset(
          "assets/socialhub/event-banner-1.png",
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        toolbarHeight: MediaQuery.of(context).size.height * 0.30,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '7 days left',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 8.0),
            Text(
              'Spooky Savings',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 30),
            ),
            SizedBox(height: 8.0),
            Text(
              'Embrace the Halloween spirit and watch your savings grow as you complete these eerie tasks',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.grey),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: 0.87,
                      backgroundColor: Colors.grey,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xFFEE1D52)),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    '87%',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Details',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    children: [
                      Icon(Icons.local_mall),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Text(
                          '1. Find and purchase at least 3 Halloween-themed products with a total discount of 30% or more.\n\n2. Share a video or photo of yourself in your homemade costume!',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_month),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Text(
                          'October 1-31',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    children: [
                      Icon(Icons.people),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Text(
                          '280336 Participants',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Start Quest',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Color(0xFFEE1D52)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
