import 'package:flutter/material.dart';
import 'package:food_ordering_application/base/res/styles/app_styles.dart';

class CustomTabBar extends StatefulWidget {
  final TabController tabController;

  const CustomTabBar({
    super.key,
    required this.tabController,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTabItem(Icons.motorcycle, 1),
          _buildTabItem(Icons.beach_access, 0),
          _buildTabItem(Icons.inventory_2, 2),
        ],
      ),
    );
  }

  Widget _buildTabItem(IconData icon, int index) {
    final isSelected = widget.tabController.index == index;
    
    return GestureDetector(
      onTap: () => widget.tabController.animateTo(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppStyles.selectedTabBackground : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: isSelected ? AppStyles.primaryColor : AppStyles.primaryTextColor,
          size: 24,
        ),
      ),
    );
  }
}