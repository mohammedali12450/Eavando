import 'package:flutter_axtro_soft_ecommerce/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_axtro_soft_ecommerce/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_axtro_soft_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/app_constants.dart';

class CouponRepo {
  final DioClient dioClient;
  CouponRepo({required this.dioClient});

  Future<ApiResponse> getCoupon(String coupon) async {
    try {
      final response = await dioClient.get('${AppConstants.COUPON_URI}$coupon');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
