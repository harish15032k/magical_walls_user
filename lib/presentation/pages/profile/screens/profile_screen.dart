import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magical_walls_user/core/constants/app_colors.dart';
import 'package:magical_walls_user/core/constants/app_text.dart';

import 'package:magical_walls_user/presentation/pages/profile/screens/profile_edit.dart';
import 'package:magical_walls_user/presentation/pages/profile/screens/profile_suppport.dart';
import 'package:magical_walls_user/presentation/widgets/common_button.dart';

import 'my_bookings.dart';

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
        child: Stack(
          children: [

            ClipPath(
              clipper: ProfileClipper(),
              child: Container(
                height: 180,
                color: Colors.grey.shade200,
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Profile", style: CommonTextStyles.medium20),
                  const SizedBox(height: 20),


                  Center(
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 35),
                              child: CircleAvatar(
                                radius: 45,
                                backgroundColor: CommonColors.primaryColor,
                                child: Text(
                                  "S",
                                  style: CommonTextStyles.medium20.copyWith(
                                    color: CommonColors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 14,
                              backgroundColor: CommonColors.textFieldGrey,
                              child: Icon(Icons.edit, size: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text("Sankarapandian",
                            style: CommonTextStyles.medium18),
                        Text("+91 6381946117",
                            style: CommonTextStyles.regular14),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  _buildMenuItem(
                    iconPath: 'assets/images/calendar.png',
                    title: "My Bookings",
                    onTap: () {
                      Get.to(() => MyBookings(),
                          transition: Transition.rightToLeft);
                    },
                  ),
                  _buildMenuItem(
                    iconPath: 'assets/images/location.png',
                    title: "Manage Address",
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    iconPath: 'assets/images/star.png',
                    title: "My Ratings",
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    iconPath: 'assets/images/setting-2.png',
                    title: "Settings",
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    iconPath: 'assets/images/head.png',
                    title: "Help & Support",
                    onTap: () {
                      Get.to(() => HelpAndSupportScreen(),
                          transition: Transition.rightToLeft);
                    },
                  ),
                ],
              ),
            ),
          ],
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



  void _showLogoutPopup(BuildContext context) {
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
                        Navigator.of(context).pop();
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

                        Navigator.of(context).pop();

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
class ProfileClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40);


    path.quadraticBezierTo(
      size.width / 2, size.height,
      size.width, size.height - 40,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}