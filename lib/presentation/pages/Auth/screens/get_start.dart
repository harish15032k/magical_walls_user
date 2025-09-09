import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magical_walls_user/core/constants/app_colors.dart';
import 'package:magical_walls_user/core/constants/app_text.dart';
import 'package:magical_walls_user/presentation/pages/Auth/screens/login.dart';
import 'package:magical_walls_user/presentation/widgets/common_button.dart';

class GetStart extends StatefulWidget {
  const GetStart({super.key});

  @override
  State<GetStart> createState() => _GetStartState();
}

class _GetStartState extends State<GetStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.white,
      body: ListView(
        padding: EdgeInsets.only(top: 0),
        children: [

          SizedBox(height: Get.height * 0.025),
          Image.asset("assets/images/painters.png"),
          SizedBox(height: Get.height * 0.025),
          Center(
            child: Text(
              'All Your Home Services in \n              One App',
              style: CommonTextStyles.medium24,
            ),
          ),
          SizedBox(height: Get.height * 0.018),
          Center(
            child: Text(
              '      From cleaning to repairs, book trusted  \nprofessionals near you — anytime, anywhere.',
              style: CommonTextStyles.regular16.copyWith(
                color: CommonColors.secondary,
              ),
            ),
          ),
          SizedBox(height: Get.height * 0.13),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: CommonButton(
              backgroundColor: CommonColors.primaryColor,
              textColor: CommonColors.white,
              text: 'Login',
              onTap: () {
                Get.to(
                  () => LoginScreen(),
                  transition: Transition.downToUp,
                  duration: Duration(milliseconds: 500),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
