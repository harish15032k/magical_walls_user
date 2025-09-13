import 'package:magical_walls_user/core/base/base_response.dart';
import 'package:magical_walls_user/core/constants/api_urls.dart';
import 'package:magical_walls_user/core/utils/network_service.dart';

class AuthRepository {
  NetworkApiService networkApiService;

  AuthRepository({required this.networkApiService});

  Future<BaseResponse> loginApi(dynamic data) async {
    final apiResponse = await networkApiService.getPostApiResponse(
      ApiUrl.getCodeApi,
      data,
    );
    return apiResponse;
  }
}
