class LoyaltyPointModel {
  int? limit;
  int? offset;
  int? totalLoyaltyPoint;
  List<LoyaltyPointList>? loyaltyPointList;

  LoyaltyPointModel({
    this.limit,
    this.offset,
    this.totalLoyaltyPoint,
    this.loyaltyPointList,
  });

  LoyaltyPointModel.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    offset = json['offset'];
    totalLoyaltyPoint = json['total_loyalty_point'];
    if (json['loyalty_point_list'] != null) {
      loyaltyPointList = <LoyaltyPointList>[];
      json['loyalty_point_list'].forEach((v) {
        loyaltyPointList?.add(new LoyaltyPointList.fromJson(v));
      });
    }
  }
}

class LoyaltyPointList {
  int? id;
  int? userId;
  String? transactionId;
  int? credit;
  int? debit;
  int? balance;
  String? reference;
  String? transactionType;
  String? createdAt;
  String? updatedAt;

  LoyaltyPointList({
    this.id,
    this.userId,
    this.transactionId,
    this.credit,
    this.debit,
    this.balance,
    this.reference,
    this.transactionType,
    this.createdAt,
    this.updatedAt,
  });

  LoyaltyPointList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    transactionId = json['transaction_id'];
    credit = json['credit'];
    debit = json['debit'];
    balance = json['balance'];
    reference = json['reference'];
    transactionType = json['transaction_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
