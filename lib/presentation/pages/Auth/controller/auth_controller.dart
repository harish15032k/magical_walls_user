import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magical_walls_user/core/base/base_controller.dart';
import 'package:magical_walls_user/core/constants/app_constants.dart';
import 'package:magical_walls_user/core/utils/preference_service.dart';
import 'package:magical_walls_user/core/utils/utils.dart';
import 'package:magical_walls_user/presentation/pages/Auth/model/verify_model.dart';
import 'package:magical_walls_user/presentation/pages/Auth/repository/auth_repository.dart';

class AuthController extends BaseController {
  final TextEditingController mobile = TextEditingController();
  late AuthRepository authRepo;
  RxBool isResendOtp = false.obs;

  @override
  void onInit() {
    authRepo = AuthRepository(networkApiService: getNetworkApiHelper());
    super.onInit();
  }

  Future<bool> authLogin(BuildContext context, bool isOtp) async {
    if (isOtp) {
      isResendOtp.value = true;
    } else {
      isLoading.value = true;
    }
    final response = await authRepo.loginApi({
      AppConstants.phone: mobile.text,
      AppConstants.fcmToken: preferences.getString(PreferenceService.fcmToken),
    });
    if (response.message?.isNotEmpty == true &&
            response.status != true &&
            context.mounted == true ||
        isOtp) {
      showCustomSnackBar(context: context, errorMessage: response.message!);
    }
    if (isOtp) {
      isResendOtp.value = false;
    } else {
      isLoading.value = false;
    }
    return response.status == true;
  }

  Future<bool> verifyOtp(
    BuildContext context,
    String number,
    String otp,
  ) async {
    isLoading.value = true;
    final response = await authRepo.verifyOtpApi({
      AppConstants.phone: number,
      AppConstants.code: otp,
    });
    if (response.message?.isNotEmpty == true &&
        response.status != true &&
        context.mounted == true) {
      showCustomSnackBar(context: context, errorMessage: response.message!);
    }
    if (response.status == true &&
        response.data != null &&
        response.data is Map) {
      final VerifyModel verifyModel = VerifyModel.fromJson(response.data);
      if(verifyModel.token?.isNotEmpty == true){
        preferences.setString(PreferenceService.token, verifyModel.token!);
      }

    }
    isLoading.value = false;
    return response.status == true;
  }

  @override
  void dispose() {
    mobile.dispose();
    super.dispose();
  }
}
