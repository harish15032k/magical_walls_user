import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magical_walls_user/presentation/pages/Home/Controller/home_controller.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text.dart';
import 'common_button.dart';
import 'common_textfield.dart';

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

  static Future ShowBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: CommonColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Filter by:",
                  style: CommonTextStyles.regular14.copyWith(
                    color: CommonColors.secondary,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Price Range",
                      style: CommonTextStyles.regular16.copyWith(
                        color: CommonColors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        HomeController.to.resetSection('price');
                      },
                      child: Text(
                        "Reset",
                        style: CommonTextStyles.regular16.copyWith(
                          color: CommonColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 12,
                  children: const [
                    CommonFilterChip(label: "Below ₹200", section: 'price'),
                    CommonFilterChip(label: "₹200 – ₹500", section: 'price'),
                    CommonFilterChip(label: "₹500 – ₹1000", section: 'price'),
                    CommonFilterChip(label: "Above ₹1000", section: 'price'),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Customer Ratings",
                      style: CommonTextStyles.regular16.copyWith(
                        color: CommonColors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        HomeController.to.resetSection('rating');
                      },
                      child: Text(
                        "Reset",
                        style: CommonTextStyles.regular16.copyWith(
                          color: CommonColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 12,
                  children: [
                    CommonFilterChip(
                      label: "4.5 ★ and above",
                      section: 'rating',
                      onTap: () {},
                    ),
                    CommonFilterChip(label: "4.0 ★ – 4.5 ★", section: 'rating'),
                    CommonFilterChip(label: "3.5 ★ – 4.0 ★", section: 'rating'),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popularity",
                      style: CommonTextStyles.regular16.copyWith(
                        color: CommonColors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        HomeController.to.resetSection('popularity');
                      },
                      child: Text(
                        "Reset",
                        style: CommonTextStyles.regular16.copyWith(
                          color: CommonColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 12,
                  children: const [
                    CommonFilterChip(
                      label: "Most Popular",
                      section: 'popularity',
                    ),
                    CommonFilterChip(
                      label: "High Review Count",
                      section: 'popularity',
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: CommonButton(
                        text: 'Reset All',
                        borderColor: CommonColors.purple,
                        textColor: CommonColors.purple,
                        onTap: () {
                          HomeController.to.resetAllFilters();
                        },
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: CommonButton(
                        text: 'Apply Filter',
                        backgroundColor: CommonColors.primaryColor,
                        textColor: CommonColors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
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

  static void showCancelPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.fromLTRB(14, 6, 14, 6),
          backgroundColor: CommonColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Image.asset('assets/images/cancel.png', width: 55),
                    const SizedBox(height: 7),
                    Text(
                      "Cancel Booking ?",
                      style: CommonTextStyles.medium18,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Are you sure you want to cancel\n this booking?",
                      style: CommonTextStyles.regular14.copyWith(
                        color: CommonColors.secondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    CommonTextField(hintText: "", label: "Reason for Cancel"),
                    const SizedBox(height: 24),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonButton(
                          text: "Yes Cancel Booking",

                          backgroundColor: CommonColors.primaryColor,
                          textColor: CommonColors.white,
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        SizedBox(height: 15),
                        CommonButton(
                          text: "No,Go Back",
                          borderColor: CommonColors.purple,
                          textColor: CommonColors.purple,
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                width: 20,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset('assets/images/close-circle.png'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void showRatePopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.fromLTRB(14, 6, 14, 6),
          backgroundColor: CommonColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),

                    Text(
                      "Rate & Review",
                      style: CommonTextStyles.medium18,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                      decoration: BoxDecoration(
                        color: CommonColors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: CommonColors.textFieldGrey,
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            subtitle: Text(
                              '₹1499',
                              style: CommonTextStyles.regular18.copyWith(
                                color: CommonColors.primaryColor,
                              ),
                            ),

                            title: Text(
                              "Full Home Painting",
                              style: CommonTextStyles.regular18.copyWith(
                                color: CommonColors.black,
                              ),
                            ),
                            leading: Container(
                              width: 73,
                              height: 49,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/ac.png'),
                                ),
                              ),
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text(
                                    "Date of Service",
                                    style: CommonTextStyles.regular14,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "25 July 10 AM - 12 PM",
                                    style: CommonTextStyles.regular14.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text(
                                    "Technician Name",
                                    style: CommonTextStyles.regular14,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Ramesh Kumar",
                                    style: CommonTextStyles.regular14.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),
                    Text(
                      "How was the service?",
                      style: CommonTextStyles.regular14,
                    ),
                    const SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          color: index < 4
                              ? CommonColors.yellow
                              : Colors.grey.withAlpha(70),
                          size: 24,
                        ),
                      ),
                    ),
                    const SizedBox(height: 13),
                    CommonTextField(
                      hintText: "Very professional and quick service!",
                      label: "Comment",
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: CommonButton(
                        text: "Submit Rating",
                        backgroundColor: CommonColors.primaryColor,
                        textColor: CommonColors.white,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                width: 20,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset('assets/images/close-circle.png'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CommonFilterChip extends StatelessWidget {
  final String label;
  final String section;
  final VoidCallback? onTap;

  const CommonFilterChip({
    super.key,
    required this.label,
    required this.section,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var controller = HomeController.to;

    return Obx(() {
      final selected = controller.isSelected(label, section);
      return ChoiceChip(
        label: Text(
          label,
          style: CommonTextStyles.regular14.copyWith(color: CommonColors.black),
        ),
        selected: selected,
        onSelected: (value) {
          controller.toggleFilter(label, section);
          if (onTap != null) onTap!();
        },
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        selectedColor: CommonColors.primaryColor.withAlpha(20),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: selected
                ? CommonColors.primaryColor
                : CommonColors.textFieldGrey,
          ),
        ),
      );
    });
  }
}
