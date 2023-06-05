class SupportTicketModel {
  int? id;
  int? customerId;
  String? subject;
  String? type;
  String? priority;
  String? description;
  String? reply;
  String? status;
  String? createdAt;
  String? updatedAt;

  SupportTicketModel({
    this.id,
    this.customerId,
    this.subject,
    this.type,
    this.priority,
    this.description,
    this.reply,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  SupportTicketModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    subject = json['subject'];
    type = json['type'];
    priority = json['priority'];
    description = json['description'];
    reply = json['reply'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
