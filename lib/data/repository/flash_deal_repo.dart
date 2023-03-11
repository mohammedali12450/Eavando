import 'package:flutter/material.dart';
import 'package:flutter_axtro_soft_ecommerce/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_axtro_soft_ecommerce/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_axtro_soft_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/app_constants.dart';

class FlashDealRepo {
  final DioClient dioClient;
  FlashDealRepo({@required this.dioClient});

  Future<ApiResponse> getFlashDeal() async {
    try {
      final response = await dioClient.get(AppConstants.FLASH_DEAL_URI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getFlashDealList(String productID) async {
    try {
      final response = await dioClient.get('${AppConstants.FLASH_DEAL_PRODUCT_URI}$productID');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}