import 'package:flutter/material.dart';

class InboxTab extends StatelessWidget {
  final String title;
  final Widget iconWidget;
  final String activity;
  final VoidCallback? onTap;
  const InboxTab(
      {super.key,
      required this.iconWidget,
      required this.title,
      required this.activity,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap ?? () {},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              children: [
                iconWidget,
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(title,
                            style: Theme.of(context).textTheme.titleMedium!),
                        const SizedBox(height: 4),
                        Text(
                          activity,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(
          color: Colors.black, // Set the color of the line
          height: 1, // Set the height of the line
          thickness: 1, // Set the thickness of the line
        ),
      ],
    );
  }
}
