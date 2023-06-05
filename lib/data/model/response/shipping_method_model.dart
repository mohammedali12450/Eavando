class ShippingMethodModel {
  int id;
  int creatorId;
  String creatorType;
  String title;
  double cost;
  String duration;
  int status;
  String createdAt;
  String updatedAt;

  ShippingMethodModel({
    required this.id,
    required this.creatorId,
    required this.creatorType,
    required this.title,
    required this.cost,
    required this.duration,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  ShippingMethodModel.init()
      : id = -1,
        creatorId = -1,
        creatorType = "",
        title = "",
        cost = 0.0,
        duration = "0",
        status = 0,
        createdAt = "",
        updatedAt = "";

  ShippingMethodModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? -1,
        creatorId = json['creator_id'] ?? -1,
        creatorType = json['creator_type'] ?? "",
        title = json['title'] ?? "",
        cost = json['cost']?.toDouble() ?? 0.0,
        duration = json['duration'] ?? "0",
        status = json['status'] ?? 0,
        createdAt = json['created_at'] ?? "",
        updatedAt = json['updated_at'] ?? "";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['creator_id'] = this.creatorId;
    data['creator_type'] = this.creatorType;
    data['title'] = this.title;
    data['cost'] = this.cost;
    data['duration'] = this.duration;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
