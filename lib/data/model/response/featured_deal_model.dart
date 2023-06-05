import 'package:flutter_axtro_soft_ecommerce/data/model/response/product_model.dart';

class FeaturedDealModel {
  Product product;

  FeaturedDealModel({required this.product});

  FeaturedDealModel.fromJson(Map<String, dynamic> json)
      : product = Product.fromJson(json['product'] ?? {});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['product'] = this.product.toJson();

    return data;
  }
}
