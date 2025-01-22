import 'package:flutter/material.dart';
import 'package:food_ordering_application/data/filter_data.dart';
import 'filter_chip.dart';

class HorizontalFilterList extends StatefulWidget {
  final Function(String) onFilterSelected;

  const HorizontalFilterList({
    super.key,
    required this.onFilterSelected,
  });

  @override
  State<HorizontalFilterList> createState() => _HorizontalFilterListState();
}

class _HorizontalFilterListState extends State<HorizontalFilterList> {
  String selectedFilter = 'Basic';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: FilterData.filterNames.map((filterName) {
          return CustomFilterChip(
            label: filterName,
            isSelected: selectedFilter == filterName,
            onSelected: () {
              setState(() {
                selectedFilter = filterName;
              });
              widget.onFilterSelected(filterName);
            },
          );
        }).toList(),
      ),
    );
  }
}