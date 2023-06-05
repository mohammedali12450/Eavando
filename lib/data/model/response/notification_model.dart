class NotificationModel {
  late int _id;
  late String _title;
  late String _description;
  late String _image;
  late int _status;
  late String _createdAt;
  late String _updatedAt;

  NotificationModel({
    required int id,
    required String title,
    required String description,
    required String image,
    required int status,
    required String createdAt,
    required String updatedAt,
  }) {
    this._id = id;
    this._title = title;
    this._description = description;
    this._image = image;
    this._status = status;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  int get id => _id;
  String get title => _title;
  String get description => _description;
  String get image => _image;
  int get status => _status;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  NotificationModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'] ?? -1;
    _title = json['title'] ?? "";
    _description = json['description'] ?? "";
    _image = json['image'] ?? "";
    _status = json['status'] ?? 0;
    _createdAt = json['created_at'] ?? "";
    _updatedAt = json['updated_at'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['description'] = this._description;
    data['image'] = this._image;
    data['status'] = this._status;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
