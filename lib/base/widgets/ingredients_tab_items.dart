import 'package:flutter/material.dart';
import 'package:food_ordering_application/base/res/styles/app_styles.dart';

class IngredientsView extends StatefulWidget {
  final List<String> ingredients;

  const IngredientsView({
    super.key,
    this.ingredients = const [],
  });

  @override
  State<IngredientsView> createState() => _IngredientsViewState();
}

class _IngredientsViewState extends State<IngredientsView> {
  bool _showAll = false;

  @override
  Widget build(BuildContext context) {
    final displayedIngredients = _showAll 
        ? widget.ingredients 
        : widget.ingredients.take(5).toList();

    final hasMoreIngredients = widget.ingredients.length > 5;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'This product contains ingredients that may trigger allergies. Please review the ingredient list for details',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                ...displayedIngredients.map((ingredient) => _buildChip(ingredient)),
                if (hasMoreIngredients)
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _showAll = !_showAll;
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      side: const BorderSide(color: Colors.grey),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _showAll ? 'Show less' : 'See more',
                          style: TextStyle(
                            color: AppStyles.primaryColor,
                          ),
                        ),
                        Icon(
                          _showAll ? Icons.chevron_left : Icons.chevron_right,
                          size: 18,
                          color: AppStyles.primaryColor,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black87,
        ),
      ),
    );
  }
}