import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magical_walls_user/core/constants/app_colors.dart';
import 'package:magical_walls_user/core/constants/app_text.dart';
import 'package:magical_walls_user/presentation/pages/cart/screens/cart_screen.dart';
import 'package:magical_walls_user/presentation/pages/categories/view_all_review.dart';
import 'package:magical_walls_user/presentation/widgets/common_button.dart';

import '../../widgets/common_widgets.dart';

class SubCategoriesViewDetail extends StatefulWidget {
  const SubCategoriesViewDetail({super.key});

  @override
  State<SubCategoriesViewDetail> createState() =>
      _SubCategoriesViewDetailState();
}

class _SubCategoriesViewDetailState extends State<SubCategoriesViewDetail> {
  bool isclicked = false;
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
              const SizedBox(height: 16),

              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/ac.png',
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
                    "Full Home Painting",
                    style: CommonTextStyles.semiBold18.copyWith(
                      color: CommonColors.black,
                    ),
                  ),
                  Text(
                    "₹1499",
                    style: CommonTextStyles.medium20.copyWith(
                      color: CommonColors.primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),

              Row(
                children: [
                  const Icon(Icons.star, color: Color(0xFFFFC107), size: 16),
                  const SizedBox(width: 4),
                  Text(
                    "4.8 | 2,340 reviews",
                    style: CommonTextStyles.regular14.copyWith(
                      color: CommonColors.secondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              CommonWidgets.VerifiedContainer(),
              const SizedBox(height: 16),

              Text(
                "About This Service",
                style: CommonTextStyles.semiBold16.copyWith(
                  color: CommonColors.black,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "Get your entire home painted by professionals with top-quality materials and neat finishing. Includes walls, ceilings, and trims. Eco-friendly paints available.",
                style: CommonTextStyles.regular14.copyWith(
                  color: CommonColors.secondary,
                ),
              ),
              const SizedBox(height: 16),

              Text(
                "What's Included",
                style: CommonTextStyles.semiBold16.copyWith(
                  color: CommonColors.black,
                ),
              ),
              const SizedBox(height: 8),
              ListView.builder(
                itemCount: CommonWidgets.includedList.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = CommonWidgets.includedList[index];
                  return CommonWidgets.buildListItem(
                    icon: item["icon"],
                    color: item["color"],
                    text: item["text"],
                  );
                },
              ),
              const SizedBox(height: 16),

              Text(
                "What's Not Included",
                style: CommonTextStyles.semiBold16.copyWith(
                  color: CommonColors.black,
                ),
              ),
              const SizedBox(height: 8),
              ListView.builder(
                itemCount: CommonWidgets.notIncludedList.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = CommonWidgets.notIncludedList[index];
                  return CommonWidgets.buildListItem(
                    icon: item["icon"],
                    color: item["color"],
                    text: item["text"],
                  );
                },
              ),
              const SizedBox(height: 16),

              Text(
                "What People Say",
                style: CommonTextStyles.semiBold16.copyWith(
                  color: CommonColors.black,
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
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
              ),

              const SizedBox(height: 10),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.to(
                      () => ViewAllReview(),
                      transition: Transition.downToUp,
                    );
                  },
                  child: Text(
                    "View All Reviews",
                    style: CommonTextStyles.medium16.copyWith(
                      color: CommonColors.primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        child: isclicked
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 68,
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: CommonColors.primaryColor.withAlpha(10),
                      border: Border.all(color: CommonColors.primaryColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (quantity > 0) quantity--;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: CommonColors.primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Icon(
                              Icons.remove,
                              size: 10,
                              color: CommonColors.primaryColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "$quantity",
                          style: CommonTextStyles.regular16.copyWith(
                            color: CommonColors.primaryColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: CommonColors.primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 10,
                              color: CommonColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CommonButton(
                    onTap: (){
                      Get.to(()=>CartScreen(),transition: Transition.rightToLeft);
                    },
                    width: 230,
                    text: "View Cart",
                    backgroundColor: CommonColors.primaryColor,
                    textColor: CommonColors.white,
                  ),
                ],
              )
            : CommonButton(
                text: "Add to Cart",
                backgroundColor: CommonColors.primaryColor,
                textColor: CommonColors.white,
                onTap: () {
                  setState(() {
                    isclicked = true;
                    quantity++;
                  });
                },
              ),
      ),
    );
  }
}
