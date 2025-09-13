import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magical_walls_user/core/constants/app_colors.dart';
import 'package:magical_walls_user/presentation/pages/categories/sub_categories.dart';
import 'package:magical_walls_user/presentation/widgets/common_widgets.dart';

import '../../../core/constants/app_text.dart';

class Categories extends StatelessWidget {
  Categories({super.key});

  final List<Map<String, String>> serviceList = [
    {'image': 'assets/images/service_man.png', 'name': 'Electrician'},
    {'image': 'assets/images/service_man.png', 'name': 'Plumbing'},
    {'image': 'assets/images/service_man.png', 'name': 'Plumbing'},
    {'image': 'assets/images/service_man.png', 'name': 'Plumbing'},
    {'image': 'assets/images/service_man.png', 'name': 'Plumbing'},
    {'image': 'assets/images/service_man.png', 'name': 'Plumbing'},
    {'image': 'assets/images/service_man.png', 'name': 'Plumbing'},
    {'image': 'assets/images/service_man.png', 'name': 'Plumbing'},
    {'image': 'assets/images/service_man.png', 'name': 'Plumbing'},
    {'image': 'assets/images/service_man.png', 'name': 'Painting'},
    {'image': 'assets/images/service_man.png', 'name': 'Electrician'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
        children: [
          Text(
            'Categories',
            style: CommonTextStyles.medium20.copyWith(
              color: CommonColors.black,
            ),
          ),
          SizedBox(height: 20),
          GridView.builder(
            itemCount: serviceList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.75,
            ),
            itemBuilder: (context, index) {
              final data = serviceList[index];
              return CommonWidgets.serviceBox(
                onTap: () {
                  Get.to(
                    () => SubCategories(name: data['name']!),
                    transition: Transition.zoom,
                  );
                },
                width: 142,
                image: data['image']!,
                name: data['name']!,
              );
            },
          ),
        ],
      ),
    );
  }
}
