import 'package:flutter/material.dart';

class Quest extends StatefulWidget {
  final String name;
  final String description;
  final double progress;
  final int? daysLeft;
  final int reward;

  const Quest({
    super.key,
    required this.name,
    required this.description,
    required this.progress,
    this.daysLeft,
    required this.reward,
  });

  @override
  State<Quest> createState() => _QuestState();
}

class _QuestState extends State<Quest> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            height: 140,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFEE9A1D),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    'assets/socialhub/quest.png',
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 18),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.description,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .fontFamily),
                        ),
                        const SizedBox(height: 4),
                        LinearProgressIndicator(
                          value: widget.progress,
                          backgroundColor: Colors.grey,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFFEE1D52)),
                        ),
                        Row(
                          children: [
                            if (widget.daysLeft != null)
                              Text(
                                '${widget.daysLeft} ${widget.daysLeft! == 1 ? "day" : "days"} left',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: Colors.black),
                              ),
                            const Spacer(),
                            TextButton(
                              onPressed: widget.progress == 1 ? () {} : null,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: widget.progress == 1
                                      ? const Color(0xFFEE1D52)
                                      : Colors.grey,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "+${widget.reward} ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(color: Colors.white),
                                    ),
                                    Image.asset(
                                      'assets/coin.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_right_outlined,
                  color: Colors.grey,
                  size: 30,
                )
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          height: 1,
          color: Colors.grey,
        )
      ],
    );
  }
}
