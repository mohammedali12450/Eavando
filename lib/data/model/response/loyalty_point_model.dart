class LoyaltyPointModel {
  late int _limit;
  late int _offset;
  late int _totalLoyaltyPoint;
  late List<LoyaltyPointList> _loyaltyPointList;

  LoyaltyPointModel(
      {required int limit,
      required int offset,
      required int totalLoyaltyPoint,
      required List<LoyaltyPointList> loyaltyPointList}) {
    this._limit = limit;

    this._offset = offset;

    this._totalLoyaltyPoint = totalLoyaltyPoint;

    this._loyaltyPointList = loyaltyPointList;
  }

  int get limit => _limit;
  int get offset => _offset;
  int get totalLoyaltyPoint => _totalLoyaltyPoint;
  List<LoyaltyPointList> get loyaltyPointList => _loyaltyPointList;

  LoyaltyPointModel.fromJson(Map<String, dynamic> json) {
    _limit = json['limit'] ?? 10;
    _offset = json['offset'] ?? 0;
    _totalLoyaltyPoint = json['total_loyalty_point'] ?? 0;
    _loyaltyPointList = <LoyaltyPointList>[];
    if (json['loyalty_point_list'] != null) {
      json['loyalty_point_list'].forEach((v) {
        _loyaltyPointList.add(new LoyaltyPointList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limit'] = this._limit;
    data['offset'] = this._offset;
    data['total_loyalty_point'] = this._totalLoyaltyPoint;

    data['loyalty_point_list'] =
        this._loyaltyPointList.map((v) => v.toJson()).toList();

    return data;
  }
}

class LoyaltyPointList {
  late int _id;
  late int _userId;
  late String _transactionId;
  late int _credit;
  late int _debit;
  late int _balance;
  late String _reference;
  late String _transactionType;
  late String _createdAt;
  late String _updatedAt;

  LoyaltyPointList(
      {required int id,
      required int userId,
      required String transactionId,
      required int credit,
      required int debit,
      required int balance,
      required String reference,
      required String transactionType,
      required String createdAt,
      required String updatedAt}) {
    this._id = id;

    this._userId = userId;

    this._transactionId = transactionId;

    this._credit = credit;

    this._debit = debit;

    this._balance = balance;

    this._reference = reference;

    this._transactionType = transactionType;

    this._createdAt = createdAt;

    this._updatedAt = updatedAt;
  }

  int get id => _id;
  int get userId => _userId;
  String get transactionId => _transactionId;
  int get credit => _credit;
  int get debit => _debit;
  int get balance => _balance;
  String get reference => _reference;
  String get transactionType => _transactionType;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  LoyaltyPointList.fromJson(Map<String, dynamic> json) {
    _id = json['id'] ?? -1;
    _userId = json['user_id'] ?? -1;
    _transactionId = json['transaction_id'] ?? "-1";
    _credit = json['credit'] ?? 0;
    _debit = json['debit'] ?? 0;
    _balance = json['balance'] ?? 0;
    _reference = json['reference'] ?? "";
    _transactionType = json['transaction_type'] ?? "";
    _createdAt = json['created_at'] ?? "";
    _updatedAt = json['updated_at'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['user_id'] = this._userId;
    data['transaction_id'] = this._transactionId;
    data['credit'] = this._credit;
    data['debit'] = this._debit;
    data['balance'] = this._balance;
    data['reference'] = this._reference;
    data['transaction_type'] = this._transactionType;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
