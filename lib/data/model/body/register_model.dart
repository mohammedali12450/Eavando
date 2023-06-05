class RegisterModel {
  String email;
  String password;
  String fName;
  String lName;
  String phone;
  String socialId;
  String loginMedium;

  RegisterModel({
    required this.email,
    required this.password,
    required this.fName,
    required this.lName,
    required this.phone,
    required this.socialId,
    required this.loginMedium,
  });

  RegisterModel.init()
      : email = "",
        password = "",
        fName = "",
        lName = "",
        phone = "",
        socialId = "",
        loginMedium = "";

  RegisterModel.fromJson(Map<String, dynamic> json)
      : email = json['email'] ?? "",
        password = json['password'] ?? "",
        fName = json['f_name'] ?? "",
        lName = json['l_name'] ?? "",
        phone = json['phone'] ?? "",
        socialId = json['social_id'] ?? "-1",
        loginMedium = json['login_medium'] ?? "";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['phone'] = this.phone;
    data['social_id'] = this.socialId;
    data['login_medium'] = this.loginMedium;
    return data;
  }
}
