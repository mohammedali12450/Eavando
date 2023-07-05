class SupportReplyModel {
  int? id;
  String? customerMessage;
  String? adminMessage;
  String? createdAt;
  String? updatedAt;

  SupportReplyModel({
    this.id,
    this.customerMessage,
    this.adminMessage,
    this.createdAt,
    this.updatedAt,
  });

  SupportReplyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerMessage = json['customer_message'];
    adminMessage = json['admin_message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
