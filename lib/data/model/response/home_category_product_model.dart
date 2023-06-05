import 'package:flutter_axtro_soft_ecommerce/data/model/response/product_model.dart';

class HomeCategoryProduct {
  int id;
  String name;
  String slug;
  String icon;
  int parentId;
  int position;
  String createdAt;
  String updatedAt;
  List<Product> products;
  List<dynamic> translations;

  HomeCategoryProduct({
    required this.id,
    required this.name,
    required this.slug,
    required this.icon,
    required this.parentId,
    required this.position,
    required this.createdAt,
    required this.updatedAt,
    required this.products,
    required this.translations,
  });

  factory HomeCategoryProduct.fromJson(Map<String, dynamic> json) {
    final id = json['id'] ?? -1;
    final name = json['name'] ?? "";
    final slug = json['slug'] ?? "";
    final icon = json['icon'] ?? "";
    final parentId = json['parent_id'] ?? -1;
    final position = json['position'] ?? 0;
    final createdAt = json['created_at'] ?? "";
    final updatedAt = json['updated_at'] ?? "";
    final products = <Product>[];
    if (json['products'] != null) {
      json['products'].forEach((v) {
        products.add(new Product.fromJson(v));
      });
    }
    var translations = [];

    if (json['translations'] != null) {
      translations = List<dynamic>.from(translations.map((x) => x));
    }

    return HomeCategoryProduct(
      id: id,
      name: name,
      slug: slug,
      icon: icon,
      parentId: parentId,
      position: position,
      createdAt: createdAt,
      updatedAt: updatedAt,
      products: products,
      translations: translations,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['icon'] = this.icon;
    data['parent_id'] = this.parentId;
    data['position'] = this.position;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;

    data['products'] = this.products.map((v) => v.toJson()).toList();

    data['translations'] = this.translations.map((v) => v.toJson()).toList();

    return data;
  }
}
