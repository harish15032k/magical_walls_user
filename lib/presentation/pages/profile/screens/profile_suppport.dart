import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magical_walls_user/core/constants/app_colors.dart';
import 'package:magical_walls_user/core/constants/app_text.dart';
import 'package:magical_walls_user/presentation/widgets/common_button.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({super.key});

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  final TextEditingController _messageController = TextEditingController();

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
                  Text(
                    "Help & Support",
                    style: CommonTextStyles.medium20,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "How can we help you?",
                      style: CommonTextStyles.regular16.copyWith(
                        color: CommonColors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        maxLines: 8,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: CommonColors.textFieldGrey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: CommonColors.textFieldGrey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: CommonColors.textFieldGrey),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    CommonButton(
                      text: "Send",
                      backgroundColor: CommonColors.primaryColor,
                      textColor: CommonColors.white,
                      onTap: () {
                        // Add send message logic here
                        _messageController.clear();
                      },
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

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}