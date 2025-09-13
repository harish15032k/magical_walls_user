import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magical_walls_user/core/constants/app_colors.dart';
import 'package:magical_walls_user/core/constants/app_text.dart';
import 'package:magical_walls_user/core/utils/preference_service.dart';
import 'package:magical_walls_user/presentation/pages/Auth/controller/auth_controller.dart';
import 'package:magical_walls_user/presentation/pages/Home/screens/bottom_bar.dart';
import 'package:magical_walls_user/presentation/pages/location/screens/location_access.dart';

import 'get_start.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;
  final controller = AuthController();

  @override
  void initState() {
    super.initState();
    controller.onInit();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      _loadAppData();
    });
  }

  Future<void> _loadAppData() async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        if (controller.preferences
                .getString(PreferenceService.token)
                ?.isNotEmpty ==
            true) {
          if (controller.preferences
                  .getString(PreferenceService.myLocation)
                  ?.isNotEmpty ==
              true) {
            Get.to(
              () => const BottomBar(),
              transition: Transition.rightToLeft,
              duration: const Duration(milliseconds: 500),
            );
          } else {
            Get.to(
              () => const LocationAccessScreen(),
              transition: Transition.rightToLeft,
              duration: const Duration(milliseconds: 500),
            );
          }
        } else {
          Get.to(
            () => const GetStart(),
            transition: Transition.rightToLeft,
            duration: const Duration(milliseconds: 500),
          );
        }
      }
    } catch (e) {
      debugPrint("Error loading app: $e");
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Center(
            child: Image.asset(
              "assets/images/logo.png",
              width: 350,
              height: 350,
            ),
          ),

          Spacer(),
          if (_isLoading) ...[
            Text("Loading", style: CommonTextStyles.regular12),
            SizedBox(height: Get.height * 0.01),
            SizedBox(
              width: 100,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey.shade300,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            ),
          ],
          SizedBox(height: Get.height * 0.06),
        ],
      ),
    );
  }
}
