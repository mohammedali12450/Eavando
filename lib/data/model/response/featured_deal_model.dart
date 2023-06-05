import 'package:flutter_axtro_soft_ecommerce/data/model/response/product_model.dart';

class FeaturedDealModel {
  Product? product;

  FeaturedDealModel({this.product});

  FeaturedDealModel.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }
}
