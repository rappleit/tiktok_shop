import 'package:flutter/material.dart';

class FilterDropdown extends StatefulWidget {
  const FilterDropdown({super.key});

  @override
  _FilterDropdownState createState() => _FilterDropdownState();
}

class _FilterDropdownState extends State<FilterDropdown> {
  String selectedPostType = 'All';
  String selectedSortType = 'Trending';
  final List<Map> postTypes = [
    {'label': 'All', 'icon': Icons.circle},
    {'label': 'Review', 'icon': Icons.rate_review},
    {'label': 'Enquiry', 'icon': Icons.question_answer},
    {'label': 'Tips', 'icon': Icons.lightbulb_outline},
    {'label': 'Misc', 'icon': Icons.category},
  ];

  final List<Map> sortTypes = [
    {'label': 'Trending', 'icon': Icons.trending_up},
    {'label': 'New', 'icon': Icons.new_releases},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          _buildDropdown(postTypes, selectedPostType, (value) {
            setState(() {
              selectedPostType = value;
            });
          }),
          Spacer(),
          _buildDropdown(sortTypes, selectedSortType, (value) {
            setState(() {
              selectedSortType = value;
            });
          }),
        ],
      ),
    );
  }

  Widget _buildDropdown(
      List<Map> options, String selectedValue, Function(String) onChanged) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: DropdownButton(
        value: selectedValue,
        icon: Icon(Icons.arrow_drop_down),
        onChanged: (value) => onChanged(value!.toString()),
        items: options.map((option) {
          return DropdownMenuItem(
            key: ValueKey(option),
            value: option["label"],
            child: Row(
              children: [
                Icon(
                  option['icon'],
                  size: 20,
                ),
                SizedBox(width: 8),
                Text(
                  option['label'],
                  style: Theme.of(context).textTheme.titleSmall, // Adjust style
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
