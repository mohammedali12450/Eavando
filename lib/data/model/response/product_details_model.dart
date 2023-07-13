import 'package:flutter_axtro_soft_ecommerce/data/model/response/product_model.dart';

class ProductDetailsModel {
  int? id;
  String? addedBy;
  int? userId;
  String? name;
  String? slug;
  String? productType;
  List<CategoryIds>? categoryIds;
  int? brandId;
  String? unit;
  int? minQty;
  int? refundable;
  String? digitalProductType;
  String? digitalFileReady;
  ImagesData? images;
  String? thumbnail;
  int? featured;
  String? videoProvider;
  String? videoUrl;
  List<Colors>? colors;
  //ImagesData? imagesWithColor;
  Map<String, dynamic>? imagesWithColor;
  ImagesData? imagesWithOutColor;
  //List<dynamic>? imagesWithOutColor;

  int? variantProduct;
  List<int>? attributes;
  List<ChoiceOptions>? choiceOptions;
  List<Variation>? variation;
  int? published;
  double? unitPrice;
  double? purchasePrice;
  double? tax;
  String? taxType;
  double? discount;
  String? discountType;
  int? currentStock;
  int? minimumOrderQty;
  String? details;
  int? freeShipping;
  String? createdAt;
  String? updatedAt;
  int? status;
  int? featuredStatus;
  String? metaTitle;
  String? metaDescription;
  String? metaImage;
  int? requestStatus;
  String? deniedNote;
  double? shippingCost;
  int? multiplyQty;
  String? code;
  int? reviewsCount;
  String? averageReview;
  List<Reviews>? reviews;
  int? imagesListToEachColor;

  ProductDetailsModel({
    this.id,
    this.addedBy,
    this.userId,
    this.name,
    this.slug,
    this.productType,
    this.categoryIds,
    this.brandId,
    this.unit,
    this.minQty,
    this.refundable,
    this.digitalProductType,
    this.digitalFileReady,
    this.images,
    this.thumbnail,
    this.featured,
    this.videoProvider,
    this.videoUrl,
    this.colors,
    this.variantProduct,
    this.attributes,
    this.choiceOptions,
    this.variation,
    this.published,
    this.unitPrice,
    this.purchasePrice,
    this.tax,
    this.taxType,
    this.discount,
    this.discountType,
    this.currentStock,
    this.minimumOrderQty,
    this.details,
    this.freeShipping,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.featuredStatus,
    this.metaTitle,
    this.metaDescription,
    this.metaImage,
    this.imagesWithColor,
    this.imagesWithOutColor,
    this.requestStatus,
    this.deniedNote,
    this.shippingCost,
    this.multiplyQty,
    this.code,
    this.reviewsCount,
    this.averageReview,
    this.reviews,
    this.imagesListToEachColor,
  });

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addedBy = json['added_by'];
    userId = json['user_id'];
    name = json['name'];
    slug = json['slug'];
    productType = json['product_type'];
    if (json['category_ids'] != null) {
      categoryIds = <CategoryIds>[];
      json['category_ids'].forEach((v) {
        categoryIds?.add(new CategoryIds.fromJson(v));
      });
    }
    brandId = json['brand_id'];
    unit = json['unit'];
    minQty = json['min_qty'];
    refundable = json['refundable'];
    digitalProductType = json['digital_product_type'];
    digitalFileReady = json['digital_file_ready'];
    images =
    json['images'] != null && json['images'] is String ? null :
    json['images'] != null ? new ImagesData.fromJson(json['images']) : null;

    print("=================IMAGES: $images");
    thumbnail = json['thumbnail'];
    featured = json['featured'];
    videoProvider = json['video_provider'];
    videoUrl = json['video_url'];
    if (json['colors_formatted'] != null) {
      colors = <Colors>[];
      json['colors_formatted'].forEach((v) {
        colors?.add(new Colors.fromJson(v));
      });
    }
    variantProduct = int.parse(json['variant_product'].toString());
    attributes = json['attributes'].cast<int>();
    if (json['choice_options'] != null) {
      choiceOptions = <ChoiceOptions>[];
      json['choice_options'].forEach((v) {
        choiceOptions?.add(new ChoiceOptions.fromJson(v));
      });
    }

    try {
  /*    imagesWithColor =  json['images'] != null && json['images'] is String ? null :
      json['images'] != null ? new ImagesData.fromJson(json['images']) : null;
*/
      imagesWithColor = json['images'];
    } catch (_) {
      // imagesWithOutColor = json['images'] != null && json['images'] is String ? null :
      // json['images'] != null ? new ImagesData.fromJson(json['images']) : null;
      //imagesWithOutColor = json['images'];
    }

    if (json['variation'] != null) {
      variation = <Variation>[];
      json['variation'].forEach((v) {
        variation?.add(new Variation.fromJson(v));
      });
    }
    published = json['published'];
    unitPrice = json['unit_price']?.toDouble();
    purchasePrice = json['purchase_price']?.toDouble();
    tax = json['tax']?.toDouble();
    taxType = json['tax_type'];
    discount = json['discount']?.toDouble();
    discountType = json['discount_type'];
    currentStock = json['current_stock'];
    if (json['minimum_order_qty'] != null) {
      minimumOrderQty = int.parse(json['minimum_order_qty'].toString());
    } else {
      minimumOrderQty = 1;
    }
    imagesListToEachColor = json["images_list_to_each_color"];
    details = json['details'];
    freeShipping = json['free_shipping'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    featuredStatus = json['featured_status'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaImage = json['meta_image'];
    requestStatus = int.parse(json['request_status'].toString());
    deniedNote = json['denied_note'];
    shippingCost = json['shipping_cost']?.toDouble();
    multiplyQty = json['multiply_qty'];
    code = json['code'];
    reviewsCount = int.parse(json['reviews_count'].toString());
    this.averageReview = json['average_review'].toString();
    if (json['reviews'] != null) {
      this.reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        this.reviews?.add(new Reviews.fromJson(v));
      });
    }
  }
}

class CategoryIds {
  String? id;
  int? position;

  CategoryIds({this.id, this.position});

  CategoryIds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    position = json['position'];
  }
}

class Colors {
  String? name;
  String? code;

  Colors({this.name, this.code});

  Colors.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
  }
}

class Reviews {
  int? id;
  int? productId;
  int? customerId;
  String? comment;
  String? attachment;
  int? rating;
  int? status;
  String? createdAt;
  String? updatedAt;
  Customer? customer;

  Reviews(
      {this.id,
      this.productId,
      this.customerId,
      this.comment,
      this.attachment,
      this.rating,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.customer});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    customerId = json['customer_id'];
    comment = json['comment'];
    attachment = json['attachment'];
    rating = json['rating'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
  }
}

class Customer {
  int? id;
  String? fName;
  String? lName;
  String? phone;
  String? image;
  String? email;

  Customer({
    this.id,
    this.fName,
    this.lName,
    this.phone,
    this.image,
    this.email,
  });

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    phone = json['phone'];
    image = json['image'];
    email = json['email'];
  }
}
