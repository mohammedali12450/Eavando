import 'dart:convert';

import 'package:flutter_axtro_soft_ecommerce/data/model/response/product_model.dart';

class CartModel {
  final int id;
  final int productId;
  final String image;
  final String name;
  final String thumbnail;
  final int sellerId;
  final String sellerIs;
  final String seller;
  final double price;
  final double discountedPrice;
  late final int quantity;
  final int maxQuantity;
  final String variant;
  final String color;
  final Variation variation;
  final double discount;
  final String discountType;
  final double tax;
  final String taxType;
  final int shippingMethodId;
  final String cartGroupId;
  final String shopInfo;
  final List<ChoiceOptions> choiceOptions;
  final List<int> variationIndexes;
  final double shippingCost;
  final String shippingType;
  final int minimumOrderQuantity;
  final ProductInfo productInfo;
  final String productType;
  final String slug;

  CartModel({
    required this.id,
    required this.productId,
    required this.image,
    required this.name,
    required this.thumbnail,
    required this.sellerId,
    required this.sellerIs,
    required this.seller,
    required this.price,
    required this.discountedPrice,
    required this.quantity,
    required this.maxQuantity,
    required this.variant,
    required this.color,
    required this.variation,
    required this.discount,
    required this.discountType,
    required this.tax,
    required this.taxType,
    required this.shippingMethodId,
    required this.cartGroupId,
    required this.shopInfo,
    required this.choiceOptions,
    required this.variationIndexes,
    required this.shippingCost,
    required this.shippingType,
    required this.minimumOrderQuantity,
    required this.productInfo,
    required this.productType,
    required this.slug,
  });

  CartModel.fromMap(Map<String, dynamic> json)
      : id = json['id'] ?? -1,
        productId = int.parse(json['product_id']?.toString() ?? "-1"),
        name = json['name'] ?? "",
        seller = json['seller'] ?? "",
        thumbnail = json['thumbnail'] ?? "",
        sellerId = int.parse(json['seller_id']?.toString() ?? "-1"),
        sellerIs = json['seller_is'] ?? "",
        image = json['image'] ?? "",
        price = json['price']?.toDouble() ?? 0.0,
        discountedPrice = json['discounted_price'] ?? 0.0,
        quantity = int.parse(json['quantity']?.toString() ?? "0"),
        maxQuantity = json['max_quantity'] ?? 0,
        variant = json['variant'] ?? "",
        color = json['color'] ?? "",
        variation = Variation.fromJson(json['variation'] ?? {}),
        discount = json['discount'].toDouble() ?? 0.0,
        discountType = json['discount_type'] ?? "",
        tax = json['tax'].toDouble() ?? 0.0,
        taxType = json['tax_type'] ?? "",
        shippingMethodId = json['shipping_method_id'] ?? -1,
        cartGroupId = json['cart_group_id'] ?? "-1",
        shopInfo = json['shop_info'] ?? "",
        choiceOptions = (json['choice_options'] as List)
            .map((e) => ChoiceOptions.fromJson(e))
            .toList(),
        variationIndexes = json['variation_indexes'] != null
            ? json['variation_indexes'].cast<int>()
            : [],
        shippingCost = double.parse(json['shipping_cost']?.toString() ?? "0.0"),
        shippingType = json['shipping_type'] ?? "",
        minimumOrderQuantity = json['minimum_order_quantity'] ?? 0.0,
        productInfo = ProductInfo.fromJson(json['product'] ?? {}),
        productType = json['product_type'] ?? "",
        slug = json['slug'] ?? "";

  CartModel.init() : this.fromMap(const {});

  CartModel copyWith({
    int? id,
    int? productId,
    String? image,
    String? name,
    String? thumbnail,
    int? sellerId,
    String? sellerIs,
    String? seller,
    double? price,
    double? discountedPrice,
    int? quantity,
    int? maxQuantity,
    String? variant,
    String? color,
    Variation? variation,
    double? discount,
    String? discountType,
    double? tax,
    String? taxType,
    int? shippingMethodId,
    String? cartGroupId,
    String? shopInfo,
    List<ChoiceOptions>? choiceOptions,
    List<int>? variationIndexes,
    double? shippingCost,
    String? shippingType,
    int? minimumOrderQuantity,
    ProductInfo? productInfo,
    String? productType,
    String? slug,
  }) {
    return CartModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      image: image ?? this.image,
      name: name ?? this.name,
      thumbnail: thumbnail ?? this.thumbnail,
      sellerId: sellerId ?? this.sellerId,
      sellerIs: sellerIs ?? this.sellerIs,
      seller: seller ?? this.seller,
      price: price ?? this.price,
      discountedPrice: discountedPrice ?? this.discountedPrice,
      quantity: quantity ?? this.quantity,
      maxQuantity: maxQuantity ?? this.maxQuantity,
      variant: variant ?? this.variant,
      color: color ?? this.color,
      variation: variation ?? this.variation,
      discount: discount ?? this.discount,
      discountType: discountType ?? this.discountType,
      tax: tax ?? this.tax,
      taxType: taxType ?? this.taxType,
      shippingMethodId: shippingMethodId ?? this.shippingMethodId,
      cartGroupId: cartGroupId ?? this.cartGroupId,
      shopInfo: shopInfo ?? this.shopInfo,
      choiceOptions: choiceOptions ?? this.choiceOptions,
      variationIndexes: variationIndexes ?? this.variationIndexes,
      shippingCost: shippingCost ?? this.shippingCost,
      shippingType: shippingType ?? this.shippingType,
      minimumOrderQuantity: minimumOrderQuantity ?? this.minimumOrderQuantity,
      productInfo: productInfo ?? this.productInfo,
      productType: productType ?? this.productType,
      slug: slug ?? this.slug,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'productId': productId,
      'image': image,
      'name': name,
      'thumbnail': thumbnail,
      'sellerId': sellerId,
      'sellerIs': sellerIs,
      'seller': seller,
      'price': price,
      'discountedPrice': discountedPrice,
      'quantity': quantity,
      'maxQuantity': maxQuantity,
      'variant': variant,
      'color': color,
      'variation': variation.toJson(),
      'discount': discount,
      'discountType': discountType,
      'tax': tax,
      'taxType': taxType,
      'shippingMethodId': shippingMethodId,
      'cartGroupId': cartGroupId,
      'shopInfo': shopInfo,
      'choiceOptions': choiceOptions.map((x) => x.toJson()).toList(),
      'variationIndexes': variationIndexes,
      'shippingCost': shippingCost,
      'shippingType': shippingType,
      'minimumOrderQuantity': minimumOrderQuantity,
      'productInfo': productInfo.toJson(),
      'productType': productType,
      'slug': slug,
    };
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ProductInfo {
  final int minimumOrderQty;
  final int totalCurrentStock;

  ProductInfo({
    required this.minimumOrderQty,
    required this.totalCurrentStock,
  });

  factory ProductInfo.fromJson(Map<String, dynamic> json) {
    int minimumOrderQty = 0;

    try {
      minimumOrderQty = json['minimum_order_qty'] ?? 0;
    } catch (e) {
      minimumOrderQty = int.parse(json['minimum_order_qty']?.toString() ?? "0");
    }

    int totalCurrentStock = json['total_current_stock'] ?? 0;
    return ProductInfo(
      minimumOrderQty: minimumOrderQty,
      totalCurrentStock: totalCurrentStock,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['minimum_order_qty'] = this.minimumOrderQty;
    data['total_current_stock'] = this.totalCurrentStock;
    return data;
  }
}
