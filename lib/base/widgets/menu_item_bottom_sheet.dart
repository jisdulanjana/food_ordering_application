import 'package:flutter/material.dart';
import 'package:food_ordering_application/base/res/styles/app_styles.dart';
import 'package:food_ordering_application/base/widgets/menu_item_tab.dart';

class MenuItemBottomSheet extends StatelessWidget {
  final Map<String, dynamic> item;

  const MenuItemBottomSheet({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                item['coverImageUrl'],
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item['name'],
                  style: AppStyles.bodyLarge,
                ),
                Text(
                  '\$${item['price'].toStringAsFixed(2)}',
                  style: AppStyles.priceText,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              item['about'],
              style: AppStyles.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                if (item['promotionsAvailable'] != null)
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppStyles.promoColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${item['promotionsAvailable']} Promotions Available',
                      style: AppStyles.bodySmall,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            
            MenuItemTabs(item: item),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end, 
              children: [
                ElevatedButton(
                  onPressed: () {
                   
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppStyles.primaryColor,
                  ),
                  child: Text(
                    'Add to Cart \$${item['price'].toStringAsFixed(2)}',
                    style: TextStyle(
                      color: AppStyles.secondaryTextColor,
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