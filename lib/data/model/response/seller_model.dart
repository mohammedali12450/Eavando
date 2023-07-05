class SellerModel {
  Seller? seller;
  int? avgRating;
  int? totalReview;
  int? totalOrder;
  int? totalProduct;

  SellerModel({
    this.seller,
    this.avgRating,
    this.totalReview,
    this.totalOrder,
    this.totalProduct,
  });

  SellerModel.fromJson(Map<String, dynamic> json) {
    seller =
        json['seller'] != null ? new Seller.fromJson(json['seller']) : null;
    avgRating = json['avg_rating'];
    totalReview = json['total_review'];
    totalOrder = json['total_order'];
    totalProduct = json['total_product'];
  }
}

class Seller {
  int? id;
  String? fName;
  String? lName;
  String? phone;
  String? image;
  Shop? shop;

  Seller({
    this.id,
    this.fName,
    this.lName,
    this.phone,
    this.image,
    this.shop,
  });

  Seller.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    phone = json['phone'];
    image = json['image'];
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
  }
}

class Shop {
  int? id;
  int? sellerId;
  String? name;
  String? address;
  String? contact;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? banner;

  Shop({
    int? id,
    int? sellerId,
    String? name,
    String? address,
    String? contact,
    String? image,
    String? createdAt,
    String? updatedAt,
    String? banner,
  });

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = int.parse(json['seller_id'].toString());
    name = json['name'];
    address = json['address'];
    contact = json['contact'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    banner = json['banner'];
  }
}
