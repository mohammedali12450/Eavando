class UserInfoModel {
  int? id;
  String? name;
  String? method;
  String? fName;
  String? lName;
  String? phone;
  String? image;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  double? walletBalance;
  double? loyaltyPoint;

  UserInfoModel({
    this.id,
    this.name,
    this.method,
    this.fName,
    this.lName,
    this.phone,
    this.image,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.walletBalance,
    this.loyaltyPoint,
  });

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    method = json['_method'];
    fName = json['f_name'];
    lName = json['l_name'];
    phone = json['phone'];
    image = json['image'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['wallet_balance'] != null) {
      walletBalance = json['wallet_balance']?.toDouble();
    }
    if (json['loyalty_point'] != null) {
      loyaltyPoint = json['loyalty_point']?.toDouble();
    } else {
      walletBalance = 0.0;
    }
  }
}
