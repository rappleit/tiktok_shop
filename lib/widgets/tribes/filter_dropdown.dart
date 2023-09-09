import 'package:flutter/material.dart';

class FilterDropdown extends StatefulWidget {
  final List<Map> options;
  final String selectedValue;
  final Function(String) onChanged;

  const FilterDropdown(
      {super.key,
      required this.options,
      required this.selectedValue,
      required this.onChanged});

  @override
  State<FilterDropdown> createState() => _FilterDropdownState();
}

class _FilterDropdownState extends State<FilterDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: DropdownButton(
        value: widget.selectedValue,
        icon: Icon(Icons.arrow_drop_down),
        onChanged: (value) => widget.onChanged(value!.toString()),
        items: widget.options.map((option) {
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
