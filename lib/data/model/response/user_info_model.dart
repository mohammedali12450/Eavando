class UserInfoModel {
  int id;
  String name;
  String method;
  String fName;
  String lName;
  String phone;
  String image;
  String email;
  String emailVerifiedAt;
  String createdAt;
  String updatedAt;
  double walletBalance;
  double loyaltyPoint;

  UserInfoModel({
    required this.id,
    required this.name,
    required this.method,
    required this.fName,
    required this.lName,
    required this.phone,
    required this.image,
    required this.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.walletBalance,
    required this.loyaltyPoint,
  });

  UserInfoModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? -1,
        name = json['name'] ?? "",
        method = json['_method'] ?? "",
        fName = json['f_name'] ?? "",
        lName = json['l_name'] ?? "",
        phone = json['phone'] ?? "",
        image = json['image'] ?? "",
        email = json['email'] ?? "",
        emailVerifiedAt = json['email_verified_at'] ?? "",
        createdAt = json['created_at'] ?? "",
        updatedAt = json['updated_at'] ?? "",
        walletBalance = json['wallet_balance']?.toDouble() ?? 0.0,
        loyaltyPoint = json['loyalty_point']?.toDouble() ?? 0.0;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['_method'] = this.method;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['wallet_balance'] = this.walletBalance;
    data['loyalty_point'] = this.loyaltyPoint;
    return data;
  }
}
