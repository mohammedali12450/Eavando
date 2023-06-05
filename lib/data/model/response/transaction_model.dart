class TransactionModel {
  int? limit;
  int? offset;
  double? totalWalletBalance;
  int? totalWalletTransactio;
  List<WalletTransactioList>? walletTransactioList;

  TransactionModel({
    this.limit,
    this.offset,
    this.totalWalletBalance,
    this.totalWalletTransactio,
    this.walletTransactioList,
  });

  TransactionModel.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    offset = json['offset'];
    if (json['total_wallet_balance'] != null) {
      totalWalletBalance = json['total_wallet_balance'].toDouble();
    } else {
      totalWalletBalance = 0.0;
    }
    totalWalletTransactio = json['total_wallet_transactio'];
    if (json['wallet_transactio_list'] != null) {
      walletTransactioList = <WalletTransactioList>[];
      json['wallet_transactio_list'].forEach((v) {
        walletTransactioList?.add(new WalletTransactioList.fromJson(v));
      });
    }
  }
}

class WalletTransactioList {
  int? id;
  int? userId;
  String? transactionId;
  double? credit;
  double? debit;
  double? adminBonus;
  double? balance;
  String? transactionType;
  String? reference;
  String? createdAt;
  String? updatedAt;

  WalletTransactioList(
      {this.id,
      this.userId,
      this.transactionId,
      this.credit,
      this.debit,
      this.adminBonus,
      this.balance,
      this.transactionType,
      this.reference,
      this.createdAt,
      this.updatedAt});

  WalletTransactioList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    transactionId = json['transaction_id'];
    credit = json['credit'].toDouble();
    debit = json['debit'].toDouble();
    adminBonus = json['admin_bonus'].toDouble();
    balance = json['balance'].toDouble();
    transactionType = json['transaction_type'];
    reference = json['reference'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
