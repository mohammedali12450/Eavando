import 'package:flutter_axtro_soft_ecommerce/data/model/response/product_model.dart';

class BannerModel {
  final int id;
  final String photo;
  final String bannerType;
  final int published;
  final String createdAt;
  final String updatedAt;
  final String url;
  final String resourceType;
  final int resourceId;
  final Product product;

  BannerModel({
    required this.id,
    required this.photo,
    required this.bannerType,
    required this.published,
    required this.createdAt,
    required this.updatedAt,
    required this.url,
    required this.resourceType,
    required this.resourceId,
    required this.product,
  });

  BannerModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? -1,
        photo = json['photo'] ?? "",
        bannerType = json['banner_type'] ?? "",
        published = json['published'] ?? 0,
        createdAt = json['created_at'] ?? "",
        updatedAt = json['updated_at'] ?? "",
        url = json['url'] ?? "",
        resourceType = json['resource_type'] ?? "",
        resourceId = json['resource_id'] ?? -1,
        product = Product.fromJson(json['product'] ?? {});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['photo'] = this.photo;
    data['banner_type'] = this.bannerType;
    data['published'] = this.published;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['url'] = this.url;
    data['resource_type'] = this.resourceType;
    data['resource_id'] = this.resourceId;
    data['product'] = this.product.toJson();

    return data;
  }
}
