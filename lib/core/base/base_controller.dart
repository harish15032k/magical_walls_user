import 'package:get/get.dart';
import 'package:magical_walls_user/core/utils/network_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseController extends GetxController {
  RxBool isLoading = false.obs;

  static final NetworkApiService _networkApiService = NetworkApiService();

  NetworkApiService getNetworkApiHelper() => _networkApiService;

  late SharedPreferences preferences;

  @override
  void onInit() async {
    preferences = await SharedPreferences.getInstance();
    super.onInit();
  }
}
