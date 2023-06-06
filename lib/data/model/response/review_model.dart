class ReviewModel {
  int? id;
  int? productId;
  int? customerId;
  String? comment;
  List<String>? attachment;
  int? rating;
  int? status;
  String? createdAt;
  String? updatedAt;
  Customer? customer;

  ReviewModel({
    this.id,
    this.productId,
    this.customerId,
    this.comment,
    this.attachment,
    this.rating,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.customer,
  });

  ReviewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    customerId = json['customer_id'];
    comment = json['comment'];
    if (json['attachment'] != null) {
      attachment = json['attachment']?.cast<String>();
    }

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
  String? name;
  String? fName;
  String? lName;
  String? phone;
  String? image;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? streetAddress;
  String? country;
  String? city;
  String? zip;
  String? houseNo;
  String? apartmentNo;

  Customer({
    this.id,
    this.name,
    this.fName,
    this.lName,
    this.phone,
    this.image,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.streetAddress,
    this.country,
    this.city,
    this.zip,
    this.houseNo,
    this.apartmentNo,
  });

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fName = json['f_name'];
    lName = json['l_name'];
    phone = json['phone'];
    image = json['image'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    streetAddress = json['street_address'];
    country = json['country'];
    city = json['city'];
    zip = json['zip'];
    houseNo = json['house_no'];
    apartmentNo = json['apartment_no'];
  }
}
