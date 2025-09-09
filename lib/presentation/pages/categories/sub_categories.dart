import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magical_walls_user/core/constants/app_colors.dart';
import 'package:magical_walls_user/presentation/widgets/common_boxes.dart';
import 'package:magical_walls_user/presentation/widgets/common_button.dart';

import '../../../core/constants/app_text.dart';

class SubCategories extends StatelessWidget {
  final String name;

  SubCategories({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.white,
      bottomNavigationBar: Container(
        
        padding: EdgeInsets.fromLTRB(25,0,25,10),
        height: 75,
        color: CommonColors.grey.withAlpha(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("₹1499", style: CommonTextStyles.medium22),
            CommonButton(
              width: 120,
              text: 'View Cart',
              backgroundColor: CommonColors.primaryColor,
              textColor: CommonColors.white,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Image.asset('assets/images/arrow-left.png', width: 25),
                ),
                const SizedBox(width: 8),
                Text(name, style: CommonTextStyles.medium20),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 700,
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: CommonWidgets.popularServices.length,
                itemBuilder: (context, index) {
                  final data = CommonWidgets.popularServices[index];
                  return CommonWidgets.PopularBox(
                    image: data["image"]!,
                    title: data["title"]!,
                    price: data["price"]!,
                    rating: data["rating"]!,
                    reviews: data["reviews"]!,

                    showAddButton: true,
                    batchColor: CommonColors.blue,
                    batchName: "Offer",
                    batchImage: 'assets/images/star.png',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
