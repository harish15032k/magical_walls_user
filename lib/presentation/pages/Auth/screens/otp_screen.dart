import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magical_walls_user/core/constants/app_colors.dart';
import 'package:magical_walls_user/core/constants/app_text.dart';
import 'package:magical_walls_user/core/utils/utils.dart';
import 'package:magical_walls_user/presentation/pages/Auth/controller/auth_controller.dart';
import 'package:magical_walls_user/presentation/pages/Home/screens/bottom_bar.dart';
import 'package:magical_walls_user/presentation/pages/location/screens/location_access.dart';
import 'package:magical_walls_user/presentation/widgets/common_button.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  final String mobile;

  const OtpScreen({super.key, required this.mobile});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final FocusNode _otpFocus = FocusNode();
  final controller = AuthController();

  @override
  void initState() {
    super.initState();
    controller.onInit();
    controller.mobile.text = widget.mobile;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_otpFocus);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    _otpFocus.dispose();
    super.dispose();
  }

  String pin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
        children: [
          Container(
            color: Colors.amber,
            margin: const EdgeInsets.fromLTRB(70, 70, 70, 25),
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
            'Enter the OTP sent to +91xxxxxxxx${widget.mobile.substring(8, 10)}',
            style: CommonTextStyles.regular14.copyWith(
              color: CommonColors.grey,
            ),
          ),
          SizedBox(height: Get.height * 0.04),

          Pinput(
            focusNode: _otpFocus,
            separatorBuilder: (index) => const SizedBox(width: 22),
            length: 4,
            defaultPinTheme: PinTheme(
              height: 56,
              width: 76,
              textStyle: CommonTextStyles.medium18.copyWith(
                color: CommonColors.black,
              ),
              decoration: BoxDecoration(
                color: CommonColors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: CommonColors.placeholderText,
                  width: 1,
                ),
              ),
            ),
            focusedPinTheme: PinTheme(
              height: 56,
              width: 76,
              textStyle: CommonTextStyles.medium18.copyWith(
                color: CommonColors.black,
              ),
              decoration: BoxDecoration(
                color: CommonColors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: CommonColors.pinFieldColor, width: 1),
              ),
            ),
            submittedPinTheme: PinTheme(
              height: 56,
              width: 76,
              textStyle: CommonTextStyles.medium18.copyWith(
                color: CommonColors.black,
              ),
              decoration: BoxDecoration(
                color: CommonColors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: CommonColors.pinFieldColor, width: 1),
              ),
            ),
            onChanged: (value) {
              pin = value;
            },
            onCompleted: (value) {
              pin = value;
            },
          ),

          SizedBox(height: Get.height * 0.035),
          Column(
            children: [
              Obx(
                () => CommonButton(
                  isLoading: controller.isLoading.value,
                  backgroundColor: CommonColors.primaryColor,
                  textColor: CommonColors.white,
                  text: 'Verify OTP',
                  onTap: () async {
                    FocusScope.of(context).unfocus();
                    if (pin.length != 4) {
                      showCustomSnackBar(
                        context: context,
                        errorMessage: "Pin should be 4 digit",
                      );
                    } else {
                      final data = await controller.verifyOtp(
                        context,
                        widget.mobile,
                        pin,
                      );
                      if (data) {
                        Get.to(
                          () => LocationAccessScreen(),
                          transition: Transition.rightToLeft,
                        );
                      }
                    }
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Didn’t receive the code?',
                    style: CommonTextStyles.regular14.copyWith(
                      color: CommonColors.black,
                    ),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () async {
                      final bool data = await controller.authLogin(
                        context,
                        true,
                      );
                    },
                    child: Obx(
                      () => controller.isResendOtp.value
                          ? SizedBox(width: 14,height: 14,
                              child: CircularProgressIndicator(
                                color: CommonColors.primaryColor,
                                strokeWidth: 2,
                              ),
                            )
                          : Text(
                              'Resend OTP',
                              style: CommonTextStyles.regular14.copyWith(
                                color: CommonColors.primaryColor,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
