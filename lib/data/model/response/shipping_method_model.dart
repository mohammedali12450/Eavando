class ShippingMethodModel {
  int? id;
  int? creatorId;
  String? creatorType;
  String? title;
  double? cost;
  String? duration;
  int? status;
  String? createdAt;
  String? updatedAt;

  ShippingMethodModel({
    this.id,
    this.creatorId,
    this.creatorType,
    this.title,
    this.cost,
    this.duration,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  ShippingMethodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    creatorId = json['creator_id'];
    creatorType = json['creator_type'];
    title = json['title'];
    cost = json['cost']?.toDouble();
    duration = json['duration'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
