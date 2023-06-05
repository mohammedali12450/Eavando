class TopSellerModel {
  int? id;
  int? sellerId;
  String? name;
  String? address;
  String? contact;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? banner;

  TopSellerModel({
    this.id,
    this.sellerId,
    this.name,
    this.address,
    this.contact,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.banner,
  });

  TopSellerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['seller_id'];
    name = json['name'];
    address = json['address'];
    contact = json['contact'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    banner = json['banner'];
  }
}
