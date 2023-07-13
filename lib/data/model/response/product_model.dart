import 'dart:convert';

class ProductModel {
  int? totalSize;
  int? limit;
  int? offset;
  List<Product>? products;

  ProductModel({
    this.totalSize,
    this.limit,
    this.offset,
    this.products,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    limit = json['limit'];
    offset = json['offset'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(new Product.fromJson(v));
      });
    }
  }
}

class Product {
  int? id;
  String? addedBy;
  int? userId;
  String? name;
  String? slug;
  String? productType;
  List<CategoryIds>? categoryIds;
  String? unit;
  ImagesData? images;
  //List<String>? images;
  String? thumbnail;
  List<ProductColors>? colors;
  List<String>? attributes;
  List<ChoiceOptions>? choiceOptions;
  List<Variation>? variation;
  double? unitPrice;
  double? purchasePrice;
  double? tax;
  int? minQty;
  int? refundable;
  String? digitalProductType;
  String? digitalFileReady;
  String? taxType;
  double? discount;
  String? discountType;
  int? currentStock;
  String? details;
  String? createdAt;
  String? updatedAt;
  List<Rating>? rating;
  double? shippingCost;
  int? isMultiPly;
  int? reviewCount;
  String? videoUrl;
  int? minimumOrderQty;

  Product({
    this.id,
    this.addedBy,
    this.userId,
    this.name,
    this.slug,
    this.productType,
    this.categoryIds,
    this.unit,
    this.minQty,
    this.refundable,
    this.digitalProductType,
    this.digitalFileReady,
    this.images,
    this.thumbnail,
    this.colors,
    this.attributes,
    this.choiceOptions,
    this.variation,
    this.unitPrice,
    this.purchasePrice,
    this.tax,
    this.taxType,
    this.discount,
    this.discountType,
    this.currentStock,
    this.details,
    this.createdAt,
    this.updatedAt,
    this.rating,
    this.shippingCost,
    this.isMultiPly,
    this.reviewCount,
    this.videoUrl,
    this.minimumOrderQty,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addedBy = json['added_by'];
    userId = json['user_id'];
    name = json['name'];
    slug = json['slug'];
    productType = json['product_type'];
    if (json['category_ids'] != null) {
      categoryIds = [];
      try {
        json['category_ids'].forEach((v) {
          categoryIds?.add(new CategoryIds.fromJson(v));
        });
      } catch (e) {
        jsonDecode(json['category_ids']).forEach((v) {
          categoryIds?.add(new CategoryIds.fromJson(v));
        });
      }
    }
    unit = json['unit'];
    minQty = json['min_qty'];

    if (json['refundable'] != null) {
      refundable = int.parse(json['refundable'].toString());
    }
    if (json['digital_product_type'] != null) {
      digitalProductType = json['digital_product_type'];
    }
    if (json['digital_file_ready'] != null) {
      digitalFileReady = json['digital_file_ready'];
    }

    /*if (json['images'] != null) {
      try {
        images = json['images'];
        print("Images = $images");// != null ? json['images'].cast<String>() : [];
      } catch (e) {
        print("Catchhhh in Images : $e");
        images = ((json['images']?['AliceBlue'] ?? []) as List)
            .map((e) => "$e")
            .toList();
      }
    }*/
    images =
    json['images'] != null && json['images'] is String ? null :
    json['images'] != null ? new ImagesData.fromJson(json['images']) : null;


    thumbnail = json['thumbnail'];
    if (json['colors_formatted'] != null) {
      colors = [];
      try {
        json['colors_formatted'].forEach((v) {
          colors?.add(new ProductColors.fromJson(v));
        });
      } catch (e) {
        jsonDecode(json['colors_formatted']).forEach((v) {
          colors?.add(new ProductColors.fromJson(v));
        });
      }
    }
    if (json['attributes'] != null) {
      try {
        attributes = json['attributes'].cast<String>();
      } catch (e) {
        attributes = jsonDecode(json['attributes']).cast<String>();
      }
    }
    if (json['choice_options'] != null) {
      choiceOptions = [];
      try {
        json['choice_options'].forEach((v) {
          choiceOptions?.add(new ChoiceOptions.fromJson(v));
        });
      } catch (e) {
        jsonDecode(json['choice_options']).forEach((v) {
          choiceOptions?.add(new ChoiceOptions.fromJson(v));
        });
      }
    }
    if (json['variation'] != null) {
      variation = [];
      try {
        json['variation'].forEach((v) {
          variation?.add(new Variation.fromJson(v));
        });
      } catch (e) {
        jsonDecode(json['variation']).forEach((v) {
          variation?.add(new Variation.fromJson(v));
        });
      }
    }
    if (json['unit_price'] != null) {
      unitPrice = json['unit_price']?.toDouble();
    }
    if (json['purchase_price'] != null) {
      purchasePrice = json['purchase_price']?.toDouble();
    }

    if (json['tax'] != null) {
      tax = json['tax']?.toDouble();
    }
    taxType = json['tax_type'];
    if (json['discount'] != null) {
      discount = json['discount']?.toDouble();
    }
    discountType = json['discount_type'];
    currentStock = json['current_stock'];
    details = json['details'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['rating'] != null) {
      rating = [];
      json['rating'].forEach((v) {
        rating?.add(new Rating.fromJson(v));
      });
    } else {}
    if (json['shipping_cost'] != null) {
      shippingCost = double.parse(json['shipping_cost'].toString());
    }
    if (json['multiply_qty'] != null) {
      isMultiPly = int.parse(json['multiply_qty'].toString());
    }
    if (json['reviews_count'] != null) {
      reviewCount = int.parse(json['reviews_count'].toString());
    }
    videoUrl = json['video_url'];
    if (json['minimum_order_qty'] != null) {
      try {
        minimumOrderQty = json['minimum_order_qty'];
      } catch (e) {
        minimumOrderQty = int.parse(json['minimum_order_qty'].toString());
      }
    }
  }
}
class ImagesData {
  List<String>? yellow;
  List<String>? red;
  List<String>? orange;
  List<String>? lightSeaGreen;
  List<String>? deepSkyBlue;
  List<String>? blue;
  List<String>? darkGray;
  List<String>? moccasin;
  List<String>? lightSlateGray;
  List<String>? green;
  List<String>? darkSeaGreen;
  List<String>? chocolate;
  List<String>? gray;
  List<String>? darkOliveGreen;
  List<String>? beige;
  List<String>? forestGreen;
  List<String>? coral;

  ImagesData(
      {this.yellow,
        this.red,
        this.orange,
        this.lightSeaGreen,
        this.deepSkyBlue,
        this.blue,
        this.darkGray,
        this.moccasin,
        this.lightSlateGray,
        this.green,
        this.darkSeaGreen,
        this.chocolate,
        this.gray,
        this.darkOliveGreen,
        this.beige,
        this.forestGreen,
        this.coral});

  ImagesData.fromJson(Map<String, dynamic> json) {
    yellow = json['Yellow']!=null? json['Yellow'].cast<String>():[];
    red = json['Red']!=null?json['Red'].cast<String>():[];
    orange = json['Orange']!=null?json['Orange'].cast<String>():[];
    lightSeaGreen = json['LightSeaGreen']!=null?json['LightSeaGreen'].cast<String>():[];
    deepSkyBlue = json['DeepSkyBlue']!=null?json['DeepSkyBlue'].cast<String>():[];
    blue = json['Blue']!=null?json['Blue'].cast<String>():[];
    darkGray = json['DarkGray']!=null?json['DarkGray'].cast<String>():[];
    moccasin = json['Moccasin']!=null?json['Moccasin'].cast<String>():[];
    lightSlateGray = json['LightSlateGray']!=null?json['LightSlateGray'].cast<String>():[];
    green = json['Green']!=null?json['Green'].cast<String>():[];
    darkSeaGreen = json['DarkSeaGreen']!=null?json['DarkSeaGreen'].cast<String>():[];
    chocolate = json['Chocolate']!=null?json['Chocolate'].cast<String>():[];
    gray = json['Gray']!=null?json['Gray'].cast<String>():[];
    darkOliveGreen = json['DarkOliveGreen']!=null?json['DarkOliveGreen'].cast<String>():[];
    beige = json['Beige']!=null?json['Beige'].cast<String>():[];
    forestGreen = json['ForestGreen']!=null?json['ForestGreen'].cast<String>():[];
    coral = json['Coral']!=null?json['Coral'].cast<String>():[];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Yellow'] = this.yellow;
    data['Red'] = this.red;
    data['Orange'] = this.orange;
    data['LightSeaGreen'] = this.lightSeaGreen;
    data['DeepSkyBlue'] = this.deepSkyBlue;
    data['Blue'] = this.blue;
    data['DarkGray'] = this.darkGray;
    data['Moccasin'] = this.moccasin;
    data['LightSlateGray'] = this.lightSlateGray;
    data['Green'] = this.green;
    data['DarkSeaGreen'] = this.darkSeaGreen;
    data['Chocolate'] = this.chocolate;
    data['Gray'] = this.gray;
    data['DarkOliveGreen'] = this.darkOliveGreen;
    data['Beige'] = this.beige;
    data['ForestGreen'] = this.forestGreen;
    data['Coral'] = this.coral;
    return data;
  }
}
class CategoryIds {
  int? position;

  CategoryIds({this.position});

  CategoryIds.fromJson(Map<String, dynamic> json) {
    position = json['position'];
  }
}

class ProductColors {
  String? name;
  String? code;

  ProductColors({this.name, this.code});

  ProductColors.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
  }
}

class ChoiceOptions {
  String? name;
  String? title;
  List<String>? options;

  ChoiceOptions({this.name, this.title, this.options});

  ChoiceOptions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    if (json['options'] != null) {
      options = json['options'].cast<String>();
    }
  }
}

class Variation {
  String? type;
  double? price;
  String? sku;
  int? qty;

  Variation({this.type, this.price, this.sku, this.qty});

  Variation.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    price = json['price']?.toDouble();
    sku = json['sku'];
    qty = json['qty'];
  }
}

class Rating {
  String? average;
  int? productId;

  Rating({this.average, this.productId});

  Rating.fromJson(Map<String, dynamic> json) {
    average = json['average'].toString();
    productId = json['product_id'];
  }
}
