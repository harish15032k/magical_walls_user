
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magical_walls_user/core/constants/app_colors.dart';
import 'package:magical_walls_user/presentation/widgets/common_widgets.dart';

import '../../../core/constants/app_text.dart';

class ViewAllReview extends StatelessWidget {
  const ViewAllReview({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: CommonColors.white, body:SafeArea(
      child: ListView(padding: EdgeInsets.symmetric(horizontal: 22,vertical: 18), children: [  Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Image.asset(
              'assets/images/arrow-left.png',
              width: 25,
            ),
          ),
          const SizedBox(width: 8),
          Text("Full Home Painting", style: CommonTextStyles.medium20),
        ],
      ),
        const SizedBox(height: 16), Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Full Home Painting",
              style: CommonTextStyles.semiBold18.copyWith(
                color: CommonColors.black,
              ),
            ),

          ],
        ),
        const SizedBox(height: 6),

        Row(
          children: [
            const Icon(Icons.star, color: Color(0xFFFFC107), size: 20),
            const SizedBox(width: 4),
            Text(
              "4.8 | 2,340 reviews",
              style: CommonTextStyles.regular14.copyWith(
                color: CommonColors.secondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),   ListView.builder(
        itemCount: CommonWidgets.reviews.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final item = CommonWidgets.reviews[index];
          return CommonWidgets.buildReviewItem(
            name: item["name"],
            rating: item["rating"],
            review: item["review"],
          );
        },
      ),],),
    ) ,);
  }
}
