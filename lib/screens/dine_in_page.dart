import 'package:flutter/material.dart';
import 'package:food_ordering_application/base/widgets/base/horizontal_filter_list.dart';
import 'package:food_ordering_application/base/widgets/menu_list.dart';
import 'package:food_ordering_application/base/widgets/menu_selection_bar.dart';


class DineInPage extends StatefulWidget {
  const DineInPage({super.key});

  @override
  State<DineInPage> createState() => _DineInPageState();
}

class _DineInPageState extends State<DineInPage> {
  String selectedCategory = 'Basic';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const MenuSelectionBar(),
                GestureDetector(
                  onTap: () {
                    // TODO: Add search functionality
                  },
                  child: const Icon(Icons.search, size: 32),
                ),
              ],
            ),
          ),
          HorizontalFilterList(
            onFilterSelected: (String filter) {
              setState(() {
                selectedCategory = filter;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              selectedCategory.toUpperCase(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          MenuList(selectedCategory: selectedCategory),
        ],
      ),
    );
  }
}