import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text.dart';

class CommonWidgets {
  static Widget serviceBox({
    required String image,
    required String name,
    double? width = 92,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: CommonColors.service,
        ),
        width: width,
        height: 92,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: CommonColors.white,
              ),
              child: Center(child: Image.asset(image, width: 24)),
            ),
            const SizedBox(height: 5),
            Text(
              name,
              style: CommonTextStyles.regular16,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  static Widget PopularBox({
    required String image,
    required String title,
    required String price,
    required String rating,
    required String reviews,
    bool showAddButton = true,
    int quantity = 0,
    Color? batchColor,
    String? batchName,
    String? batchImage,
    bool isreviewneed = false,
  }) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: CommonColors.textFieldGrey),
          ),
          child: Stack(
            children: [
              Padding(
                padding:
                    batchColor != null &&
                        batchName != null &&
                        batchImage != null
                    ? EdgeInsets.fromLTRB(12.0, 22, 12, 10)
                    : EdgeInsets.fromLTRB(12.0, 12, 12, 10),
                child: Row(
                  children: [
                    Image.asset(image, width: 104, height: 104),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, style: CommonTextStyles.regular18),
                          const SizedBox(height: 2),
                          Text(
                            price,
                            style: CommonTextStyles.regular18.copyWith(
                              color: CommonColors.primaryColor,
                            ),
                          ),
                          const SizedBox(height: 2),
                          if (isreviewneed)
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Color(0xFFFFC107),
                                  size: 12,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  "$rating | $reviews reviews",
                                  style: CommonTextStyles.regular12.copyWith(
                                    color: CommonColors.secondary,
                                  ),
                                ),
                              ],
                            ),
                          const SizedBox(height: 10),
                          if (showAddButton)
                            Column(
                              children: [
                                if (quantity == 0)
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quantity = 1;
                                      });
                                    },
                                    child: Container(
                                      width: 68,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 18,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: CommonColors.primaryColor,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        "Add",
                                        style: CommonTextStyles.regular14
                                            .copyWith(
                                              color: CommonColors.primaryColor,
                                            ),
                                      ),
                                    ),
                                  )
                                else
                                  Container(
                                    width: 68,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: CommonColors.primaryColor
                                          .withAlpha(10),
                                      border: Border.all(
                                        color: CommonColors.primaryColor,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                color:
                                                    CommonColors.primaryColor,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30),
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
                                          style: CommonTextStyles.regular16
                                              .copyWith(
                                                color:
                                                    CommonColors.primaryColor,
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
                                                color:
                                                    CommonColors.primaryColor,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30),
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
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (batchColor != null && batchName != null && batchImage != null)
                Positioned(
                  top: 0,
                  right: 0,

                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: batchColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          batchImage,
                          width: 12,
                          height: 12,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          batchName,
                          style: CommonTextStyles.regular12.copyWith(
                            color: CommonColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  static final List<Map<String, dynamic>> reviews = const [
    {
      "name": "Priya R",
      "rating": 5.0,
      "review":
          "Very professional and neat work. Painters arrived on time and completed faster than expected. Loved the finish!",
    },
    {
      "name": "Karthik S",
      "rating": 4.5,
      "review":
          "Good value for money. They covered all furniture properly and cleaned after the work. Slight delay in starting but overall great.",
    },
    {
      "name": "Ayesha M",
      "rating": 5.0,
      "review":
          "Excellent job! True and quality paint and ensured smooth coating throughout the walls. Would definitely recommend.",
    },
    {
      "name": "Rohit J",
      "rating": 4.0,
      "review":
          "Booking was easy and the service was hassle-free. Just wished they had more paint color options on-site.",
    },
    {
      "name": "Sneha P",
      "rating": 5.0,
      "review":
          "From consultation to execution, everything was smooth. My 2BHK looks completely refreshed. Great team effort.",
    },
  ];
  static List<Map<String, dynamic>> popularServices = [
    {
      "image": "assets/images/service-women.png",
      "title": "Home Deep Cleaning",
      "price": "₹1499",
      "rating": "4.8",
      "reviews": "2,340",
      "batchColor": CommonColors.blue,
      "batchName": "10% special offer",
      "batchImage": 'assets/images/star.png',
    },
    {
      "image": "assets/images/service-women.png",
      "title": "AC Repair & Service",
      "price": "₹599",
      "rating": "4.6",
      "reviews": "1,120",
      "batchColor": CommonColors.blue,
      "batchName": "10% special offer",
      "batchImage": 'assets/images/star.png',
    },
    {
      "image": "assets/images/service-women.png",
      "title": "Salon at Home",
      "price": "₹999",
      "rating": "4.9",
      "reviews": "5,020",
    },
  ];
  static final List<Map<String, dynamic>> includedList = const [
    {
      "icon": Icons.check,
      "color": Colors.green,
      "text": "Painting walls & ceilings (up to 2800)",
    },
    {
      "icon": Icons.check,
      "color": Colors.green,
      "text": "Two coats with primer",
    },
    {
      "icon": Icons.check,
      "color": Colors.green,
      "text": "Surface cleaning before paint",
    },
    {
      "icon": Icons.check,
      "color": Colors.green,
      "text": "Minor wall crack filling",
    },
  ];

  static final List<Map<String, dynamic>> notIncludedList = const [
    {"icon": Icons.close, "color": Colors.red, "text": "Furniture moving"},
    {
      "icon": Icons.close,
      "color": Colors.red,
      "text": "Deep putty/wall repairs",
    },
    {
      "icon": Icons.close,
      "color": Colors.red,
      "text": "False ceiling or custom textures",
    },
  ];
  static Widget buildListItem({
    required IconData icon,
    required Color color,
    required String text,
  }) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                style: CommonTextStyles.regular14.copyWith(
                  color: CommonColors.secondary,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 6),
      ],
    );
  }

  static Widget buildReviewItem({
    required String name,
    required double rating,
    required String review,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.star, color: Color(0xFFFFC107), size: 16),
            const SizedBox(width: 4),
            Text(
              "${rating.toStringAsFixed(1)} |",
              style: CommonTextStyles.medium16.copyWith(
                color: CommonColors.black,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              name,
              style: CommonTextStyles.regular16.copyWith(
                color: CommonColors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          review,
          style: CommonTextStyles.regular14.copyWith(
            color: CommonColors.secondary,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  static Widget VerifiedContainer() {
    return Container(
      decoration: BoxDecoration(
        color: CommonColors.green.withAlpha(30),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/tick.png', width: 12),
          const SizedBox(width: 3),
          Text(
            "Verified",
            style: CommonTextStyles.semiBold12.copyWith(
              color: CommonColors.green,
            ),
          ),
        ],
      ),
    );
  }
}
