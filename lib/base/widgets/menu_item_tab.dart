import 'package:flutter/material.dart';
import 'package:food_ordering_application/base/res/styles/app_styles.dart';
import 'package:food_ordering_application/base/widgets/ingredients_tab_items.dart';

class MenuItemTabs extends StatelessWidget {
  final Map<String, dynamic> item;

  const MenuItemTabs({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          TabBar(
            labelColor: AppStyles.primaryColor,
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppStyles.primaryColor,
                  width: 3,
                ),
              ),
            ),
            tabs: const [
              Tab(text: 'Ingredients'),
              Tab(text: 'Nutritional'),
              Tab(text: 'Instructions'),
              Tab(text: 'Allergies'),
            ],
          ),
          SizedBox(
            height: 200,
            child: TabBarView(
              children: [
                // Ingredients Tab
                IngredientsView(
                  ingredients: (item['ingredients'] as List<dynamic>?)?.cast<String>() ?? [],
                ),
                // Nutritional Tab
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Text(item['nutritional'] ?? 'No nutritional information available.'),
                ),
                // Instructions Tab
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Text(item['instructions'] ?? 'No instructions available.'),
                ),
                // Allergies Tab
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Text(item['allergies'] ?? 'No allergy information available.'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}