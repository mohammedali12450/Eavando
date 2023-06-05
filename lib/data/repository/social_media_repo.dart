import 'package:flutter_axtro_soft_ecommerce/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_axtro_soft_ecommerce/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_axtro_soft_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/app_constants.dart';

class SocialMediaRepo {
  final DioClient dioClient;
  SocialMediaRepo({required this.dioClient});

  Future<ApiResponse> getSocialMediaList() async {
    try {
      final response = await dioClient.get(AppConstants.SOCIAL_MEDIA_URI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
