import 'package:flutter/material.dart';
import 'package:food_ordering_application/base/widgets/menu_item_card.dart';
import 'package:food_ordering_application/data/menu_data.dart';

class MenuList extends StatelessWidget {
  final String selectedCategory;

  const MenuList({
    super.key,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    final items = MenuData.getItemsByCategory(selectedCategory);

    if (items.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.no_meals_outlined,
                size: 64,
                color: Colors.grey,
              ),
              const SizedBox(height: 16),
              Text(
                'No items available in ${selectedCategory}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return MenuItemCard(item: items[index]);
      },
    );
  }
}