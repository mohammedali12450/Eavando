class SupportReplyModel {
  int id;
  String? customerMessage;
  String? adminMessage;
  String createdAt;
  String updatedAt;

  SupportReplyModel({
    required this.id,
    this.customerMessage,
    required this.adminMessage,
    required this.createdAt,
    required this.updatedAt,
  });

  SupportReplyModel.core({
    this.customerMessage,
    required this.createdAt,
  })  : id = -1,
        adminMessage = "",
        updatedAt = "";

  SupportReplyModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? -1,
        customerMessage = json['customer_message'] ?? "",
        adminMessage = json['admin_message'] ?? "",
        createdAt = json['created_at'] ?? "",
        updatedAt = json['updated_at'] ?? "";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_message'] = this.customerMessage;
    data['admin_message'] = this.adminMessage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
