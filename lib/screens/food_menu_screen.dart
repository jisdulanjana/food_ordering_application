import 'package:flutter/material.dart';
import 'package:food_ordering_application/base/widgets/base/cover.dart';
import 'package:food_ordering_application/screens/delivery_page.dart';
import 'package:food_ordering_application/screens/dine_in_page.dart';
import 'package:food_ordering_application/screens/pickup_page.dart';

class FoodMenuScreen extends StatefulWidget {
  const FoodMenuScreen({super.key});

  @override
  State<FoodMenuScreen> createState() => _FoodMenuScreenState();
}

class _FoodMenuScreenState extends State<FoodMenuScreen> 
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CoverWidget(tabController: _tabController),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                DineInPage(),
                DeliveryPage(),
                PickupPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}