import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magical_walls_user/core/constants/app_colors.dart';
import 'package:magical_walls_user/core/constants/app_text.dart';
import 'package:magical_walls_user/core/utils/utils.dart';
import 'package:magical_walls_user/presentation/pages/Auth/controller/auth_controller.dart';
import 'package:magical_walls_user/presentation/pages/Auth/screens/otp_screen.dart';
import 'package:magical_walls_user/presentation/widgets/common_button.dart';
import 'package:magical_walls_user/presentation/widgets/common_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = AuthController();

  @override
  void initState() {
    super.initState();
    controller.onInit();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 22),
        children: [
          Container(
            color: Colors.amber,
            margin: EdgeInsets.fromLTRB(70, 70, 70, 25),
            child: Image.asset('assets/images/logo.png'),
          ),
          Text(
            'Verify Your Mobile Number',
            style: CommonTextStyles.medium24.copyWith(
              color: CommonColors.black,
            ),
          ),
          SizedBox(height: Get.height * 0.012),
          Text(
            'Enter your mobile number to receive an OTP and get started.',
            style: CommonTextStyles.regular14.copyWith(
              color: CommonColors.grey,
            ),
          ),
          SizedBox(height: Get.height * 0.04),
          CommonTextField(
            maxLength: 10,
            controller: controller.mobile,
            label: 'Mobile Number',
            hintText: 'Enter your mobile number',
            isRequired: true,
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: Get.height * 0.035),
          Obx(
            () => CommonButton(
              backgroundColor: CommonColors.primaryColor,
              textColor: CommonColors.white,
              text: 'Get OTP',
              onTap: () async {
                FocusScope.of(context).unfocus();
                if (controller.mobile.text.length != 10) {
                  showCustomSnackBar(
                    context: context,
                    errorMessage: 'Number Should be 10 digit',
                  );
                } else {
                  final bool data = await controller.authLogin(context);
                  if (data) {
                    Get.to(
                      () => OtpScreen(mobile: controller.mobile.text),
                      transition: Transition.rightToLeft,
                    );
                  }
                }
              },
              isLoading: controller.isLoading.value,
            ),
          ),
        ],
      ),
    );
  }
}
