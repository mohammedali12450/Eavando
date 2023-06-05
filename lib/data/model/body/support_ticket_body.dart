class SupportTicketBody {
  late String _type;
  late String _subject;
  late String _description;

  SupportTicketBody({
    required String type,
    required String subject,
    required String description,
  }) {
    this._type = type;
    this._subject = subject;
    this._description = description;
  }

  String get type => _type;
  String get subject => _subject;
  String get description => _description;

  SupportTicketBody.fromJson(Map<String, dynamic> json) {
    _type = json['type'] ?? "";
    _subject = json['subject'] ?? "";
    _description = json['description'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this._type;
    data['subject'] = this._subject;
    data['description'] = this._description;
    return data;
  }
}
