class SupportTicketModel {
  late int _id;
  late int _customerId;
  late String _subject;
  late String _type;
  late String _priority;
  late String _description;
  late String _reply;
  late String _status;
  late String _createdAt;
  late String _updatedAt;

  int get id => _id;
  int get customerId => _customerId;
  String get subject => _subject;
  String get type => _type;
  String get priority => _priority;
  String get description => _description;
  String get reply => _reply;
  String get status => _status;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  SupportTicketModel({
    required int id,
    required int customerId,
    required String subject,
    required String type,
    required String priority,
    required String description,
    required String reply,
    required String status,
    required String createdAt,
    required String updatedAt,
  }) {
    this._id = id;
    this._customerId = customerId;
    this._subject = subject;
    this._type = type;
    this._priority = priority;
    this._description = description;
    this._reply = reply;
    this._status = status;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  //  description: supportTicketBody.description,
  //       type: supportTicketBody.type,
  //       subject: supportTicketBody.subject,
  //       createdAt: DateConverter.formatDate(DateTime.now()),
  //       status: 'pending',

  SupportTicketModel.core({
    required String subject,
    required String type,
    required String description,
    required String status,
    required String createdAt,
  })  : _id = -1,
        _customerId = -1,
        _subject = subject,
        _type = type,
        _priority = "",
        _description = description,
        _reply = "",
        _status = status,
        _createdAt = createdAt,
        _updatedAt = "";

  SupportTicketModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'] ?? -1;
    _customerId = json['customer_id'] ?? -1;
    _subject = json['subject'] ?? "";
    _type = json['type'] ?? "";
    _priority = json['priority'] ?? "";
    _description = json['description'] ?? "";
    _reply = json['reply'] ?? "";
    _status = json['status'] ?? "";
    _createdAt = json['created_at'] ?? "";
    _updatedAt = json['updated_at'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['customer_id'] = this._customerId;
    data['subject'] = this._subject;
    data['type'] = this._type;
    data['priority'] = this._priority;
    data['description'] = this._description;
    data['reply'] = this._reply;
    data['status'] = this._status;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
