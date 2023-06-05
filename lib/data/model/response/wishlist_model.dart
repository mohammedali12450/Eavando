import 'package:flutter_axtro_soft_ecommerce/data/model/response/product_model.dart';

class WishListModel {
  int id;
  int customerId;
  int productId;
  String createdAt;
  String updatedAt;
  Product product;

  WishListModel({
    required this.id,
    required this.customerId,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
  });

  WishListModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? -1,
        customerId = json['customer_id'] ?? -1,
        productId = json['product_id'] ?? -1,
        createdAt = json['created_at'] ?? "",
        updatedAt = json['updated_at'] ?? "",
        product = Product.fromJson(json['product'] ?? {});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['product_id'] = this.productId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['product'] = this.product.toJson();
    return data;
  }
}
