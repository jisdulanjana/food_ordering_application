import 'package:flutter/material.dart';
import 'package:food_ordering_application/base/res/media.dart';
import 'package:food_ordering_application/base/res/styles/app_styles.dart';
import 'package:food_ordering_application/base/widgets/base/custom_tab_bar.dart';

class CoverWidget extends StatelessWidget {
  final TabController tabController;

  const CoverWidget({
    super.key,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Stack(
        children: [
          _buildCoverImage(),
          _buildGradientOverlay(),
          _buildRestaurantInfo(),
          _buildTabBar(),
        ],
      ),
    );
  }

  Widget _buildCoverImage() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 200,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppMedia.cover),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildGradientOverlay() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.7),
            ],
            stops: const [0.1, 1.0],
          ),
        ),
      ),
    );
  }

  Widget _buildRestaurantInfo() {
    return Positioned(
      bottom: 60,
      left: 16,
      right: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'El Cabanyal',
                style: AppStyles.headlineLarge,
              ),
              Text(
                'FASTFOOD · BURGERS',
                style: AppStyles.bodySmall?.copyWith(color: AppStyles.secondaryTextColor),
              ),
            ],
          ),
          Container(
            height: 61,
            width: 61,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppMedia.logo),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Center(
        child: CustomTabBar(tabController: tabController),
      ),
    );
  }
}