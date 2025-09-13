import 'package:flutter/material.dart';
import 'package:magical_walls_user/core/base/base_controller.dart';
import 'package:magical_walls_user/core/constants/app_constants.dart';
import 'package:magical_walls_user/core/utils/preference_service.dart';
import 'package:magical_walls_user/core/utils/utils.dart';
import 'package:magical_walls_user/presentation/pages/Auth/repository/auth_repository.dart';

class AuthController extends BaseController {
  final TextEditingController mobile = TextEditingController();
  late AuthRepository authRepo;

  @override
  void onInit() {
    authRepo = AuthRepository(networkApiService: getNetworkApiHelper());
    super.onInit();
  }

  Future<bool> authLogin(BuildContext context) async {
    isLoading.value = true;
    final response = await authRepo.loginApi({
      AppConstants.phone: mobile.text,
      AppConstants.fcmToken: preferences.getString(PreferenceService.fcmToken),
    });
    if (response.message?.isNotEmpty == true &&
        response.status != true &&
        context.mounted == true) {
      showCustomSnackBar(context: context, errorMessage: response.message!);
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
