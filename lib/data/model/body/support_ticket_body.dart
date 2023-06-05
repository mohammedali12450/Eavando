class SupportTicketBody {
  String? type;
  String? subject;
  String? description;

  SupportTicketBody(this.type, this.subject, this.description);

  SupportTicketBody.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    subject = json['subject'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['subject'] = this.subject;
    data['description'] = this.description;
    return data;
  }
}
