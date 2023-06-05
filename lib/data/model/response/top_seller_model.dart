class TopSellerModel {
  late int _id;
  late int _sellerId;
  late String _name;
  late String _address;
  late String _contact;
  late String _image;
  late String _createdAt;
  late String _updatedAt;
  late String _banner;

  TopSellerModel({
    required int id,
    required int sellerId,
    required String name,
    required String address,
    required String contact,
    required String image,
    required String createdAt,
    required String updatedAt,
    required String banner,
  }) {
    this._id = id;
    this._sellerId = sellerId;
    this._name = name;
    this._address = address;
    this._contact = contact;
    this._image = image;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._banner = banner;
  }

  int get id => _id;
  int get sellerId => _sellerId;
  String get name => _name;
  String get address => _address;
  String get contact => _contact;
  String get image => _image;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  String get banner => _banner;

  TopSellerModel.init()
      : _id = -1,
        _sellerId = -1,
        _name = "",
        _address = "",
        _contact = "",
        _image = "",
        _createdAt = "",
        _updatedAt = "",
        _banner = "";

  TopSellerModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'] ?? -1;
    _sellerId = json['seller_id'] ?? -1;
    _name = json['name'] ?? "";
    _address = json['address'] ?? "";
    _contact = json['contact'] ?? "";
    _image = json['image'] ?? "";
    _createdAt = json['created_at'] ?? "";
    _updatedAt = json['updated_at'] ?? "";
    _banner = json['banner'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['seller_id'] = this._sellerId;
    data['name'] = this._name;
    data['address'] = this._address;
    data['contact'] = this._contact;
    data['image'] = this._image;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['banner'] = this._banner;
    return data;
  }
}
