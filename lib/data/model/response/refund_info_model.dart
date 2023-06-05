class RefundInfoModel {
  bool alreadyRequested;
  bool expired;
  Refund refund;

  RefundInfoModel({
    required this.alreadyRequested,
    required this.expired,
    required this.refund,
  });

  RefundInfoModel.fromJson(Map<String, dynamic> json)
      : alreadyRequested = json['already_requested'] ?? false,
        expired = json['expired'] ?? false,
        refund = Refund.fromJson(json['refund'] ?? {});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['already_requested'] = this.alreadyRequested;
    data['expired'] = this.expired;
    data['refund'] = this.refund.toJson();
    return data;
  }
}

class Refund {
  double productPrice;
  int quntity;
  double productTotalDiscount;
  double productTotalTax;
  double subtotal;
  double couponDiscount;
  double refundAmount;

  Refund(
      {required this.productPrice,
      required this.quntity,
      required this.productTotalDiscount,
      required this.productTotalTax,
      required this.subtotal,
      required this.couponDiscount,
      required this.refundAmount});

  Refund.fromJson(Map<String, dynamic> json)
      : productPrice = json['product_price']?.toDouble() ?? 0.0,
        quntity = json['quntity'] ?? 0,
        productTotalDiscount =
            json['product_total_discount']?.toDouble() ?? 0.0,
        productTotalTax = json['product_total_tax']?.toDouble() ?? 0.0,
        subtotal = json['subtotal']?.toDouble() ?? 0.0,
        couponDiscount = json['coupon_discount']?.toDouble() ?? 0.0,
        refundAmount = json['refund_amount']?.toDouble() ?? 0.0;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_price'] = this.productPrice;
    data['quntity'] = this.quntity;
    data['product_total_discount'] = this.productTotalDiscount;
    data['product_total_tax'] = this.productTotalTax;
    data['subtotal'] = this.subtotal;
    data['coupon_discount'] = this.couponDiscount;
    data['refund_amount'] = this.refundAmount;
    return data;
  }
}
