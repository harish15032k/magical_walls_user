import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magical_walls_user/core/constants/app_colors.dart';
import 'package:magical_walls_user/core/constants/app_text.dart';
import 'package:magical_walls_user/presentation/pages/profile/screens/personal_info.dart';
import 'package:magical_walls_user/presentation/pages/profile/screens/profile_bank.dart';
import 'package:magical_walls_user/presentation/pages/profile/screens/profile_doc.dart';
import 'package:magical_walls_user/presentation/pages/profile/screens/profile_edit.dart';
import 'package:magical_walls_user/presentation/pages/profile/screens/profile_suppport.dart';
import 'package:magical_walls_user/presentation/widgets/common_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.white,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 18,
          right: 18,
          bottom: MediaQuery.of(context).viewInsets.bottom + 40,
        ),
        child: CommonButton(
          text: "Logout",
          isimageneed: true,
          imagefile: 'assets/images/logout.png',
          onTap: () {
            _showLogoutPopup(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Profile", style: CommonTextStyles.medium20),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/man.png'),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Ashok Kumar", style: CommonTextStyles.medium22),
                      Row(
                        children: [
                          Text(
                            "Electrician",
                            style: CommonTextStyles.regular14.copyWith(
                              color: CommonColors.secondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ProfileEdit(), transition: Transition.rightToLeft);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: CommonColors.primaryColor),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                        child: Text(
                          "Edit Profile",
                          style: CommonTextStyles.medium14.copyWith(
                            color: CommonColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildMenuItem(
                iconPath: 'assets/images/calendar.png',
                title: "Professional Info",
                onTap: () {
                  Get.to(() => PersonalInfo(), transition: Transition.rightToLeft);
                },
              ),
              _buildMenuItem(
                iconPath: 'assets/images/location.png',
                title: "Documents",
                onTap: () {
                  Get.to(() => DocumentsScreen(), transition: Transition.rightToLeft);
                },
              ),
              _buildMenuItem(
                iconPath: 'assets/images/star.png',
                title: "Bank Details",
                onTap: () {
                  Get.to(() => BankDetailsScreen(), transition: Transition.rightToLeft);
                },
              ),
              _buildMenuItem(
                iconPath: 'assets/images/head.png',
                title: "Help & Support",
                onTap: () {
                  Get.to(() => HelpAndSupportScreen(), transition: Transition.rightToLeft);
                },
              ),
              _buildAvailabilityItem(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required String iconPath,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Image.asset(iconPath, width: 24, height: 24),
            const SizedBox(width: 12),
            Text(title, style: CommonTextStyles.regular16),
            const Spacer(),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: Image.asset(
                'assets/images/arrow-left.png',
                width: 16,
                height: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvailabilityItem() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isAvailable = !_isAvailable;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0),
        child: Row(
          children: [
            Image.asset(
              'assets/images/notification.png',
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 12),
            Text("Availability", style: CommonTextStyles.regular16),
            const Spacer(),
            Transform.scale(
              scale: 0.9,
              child: Switch(
                value: _isAvailable,
                onChanged: (value) {
                  setState(() {
                    _isAvailable = value;
                  });
                },
                activeColor: Colors.green,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey[300],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // User must tap a button to dismiss
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.fromLTRB(14, 6, 14, 6),
          backgroundColor: CommonColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const SizedBox(height: 10),
                Image.asset('assets/images/logout.png',width: 35,),
                const SizedBox(height: 7),
                Text(
                  "Are you sure you want to logout?",
                  style: CommonTextStyles.medium18,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonButton(
                      width: 100,
                      height: 55,
                      text: "Cancel",
                    borderColor: CommonColors.purple,
                      textColor: CommonColors.purple,
                      onTap: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                    ),
                    SizedBox(width: 15,),
                    CommonButton(
                      width: 100,
                      height: 55,
                      text: "Logout",
                      backgroundColor: CommonColors.primaryColor,
                      textColor: CommonColors.white,
                      onTap: () {
                        // Add logout logic here (e.g., clear session, navigate to login screen)
                        Navigator.of(context).pop();
                        Get.offAllNamed('/login'); // Example navigation to login screen
                      },
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
}