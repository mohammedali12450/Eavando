class RefundInfoModel {
  bool? alreadyRequested;
  bool? expired;
  Refund? refund;

  RefundInfoModel({this.alreadyRequested, this.expired, this.refund});

  RefundInfoModel.fromJson(Map<String, dynamic> json) {
    alreadyRequested = json['already_requested'];
    expired = json['expired'];
    refund =
        json['refund'] != null ? new Refund.fromJson(json['refund']) : null;
  }
}

class Refund {
  double? productPrice;
  int? quntity;
  double? productTotalDiscount;
  double? productTotalTax;
  double? subtotal;
  double? couponDiscount;
  double? refundAmount;

  Refund({
    this.productPrice,
    this.quntity,
    this.productTotalDiscount,
    this.productTotalTax,
    this.subtotal,
    this.couponDiscount,
    this.refundAmount,
  });

  Refund.fromJson(Map<String, dynamic> json) {
    productPrice = json['product_price'].toDouble();
    quntity = json['quntity'];
    productTotalDiscount = json['product_total_discount'].toDouble();
    productTotalTax = json['product_total_tax'].toDouble();
    subtotal = json['subtotal'].toDouble();
    couponDiscount = json['coupon_discount'].toDouble();
    refundAmount = json['refund_amount'].toDouble();
  }
}
