import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magical_walls_user/core/constants/app_colors.dart';
import 'package:magical_walls_user/core/constants/app_text.dart';
import 'package:magical_walls_user/presentation/widgets/common_widgets.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
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
                  Text("Documents", style: CommonTextStyles.medium20),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: CommonColors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: CommonColors.textFieldGrey,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDocumentSection(
                      title: "Aadhaar Card",
                      imagePath: 'assets/images/ac.png', 
                      isVerified: true,
                    ),
                    const SizedBox(height: 15),
                    _buildDocumentSection(
                      title: "Pan Card",
                      imagePath: 'assets/images/ac.png',
                      isVerified: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDocumentSection({
    required String title,
    required String imagePath,
    required bool isVerified,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: CommonTextStyles.regular14.copyWith(
                color: CommonColors.secondary,
              ),
            ),
            if (isVerified)
             CommonWidgets.VerifiedContainer(),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: Image.asset(
            imagePath,
            width: 150,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}