class RefundResultModel {
  double productPrice;
  int quntity;
  double productTotalDiscount;
  double productTotalTax;
  double subtotal;
  double couponDiscount;
  double refundAmount;
  List<RefundRequest> refundRequest;

  RefundResultModel({
    required this.productPrice,
    required this.quntity,
    required this.productTotalDiscount,
    required this.productTotalTax,
    required this.subtotal,
    required this.couponDiscount,
    required this.refundAmount,
    required this.refundRequest,
  });

  factory RefundResultModel.fromJson(Map<String, dynamic> json) {
    final productPrice = json['product_price']?.toDouble() ?? 0.0;
    final quntity = json['quntity'] ?? 0;
    final productTotalDiscount =
        json['product_total_discount']?.toDouble() ?? 0.0;
    final productTotalTax = json['product_total_tax']?.toDouble() ?? 0.0;
    final subtotal = json['subtotal']?.toDouble() ?? 0.0;
    final couponDiscount = json['coupon_discount']?.toDouble() ?? 0.0;
    final refundAmount = json['refund_amount']?.toDouble() ?? 0.0;
    final refundRequest = <RefundRequest>[];
    if (json['refund_request'] != null) {
      json['refund_request'].forEach((v) {
        refundRequest.add(new RefundRequest.fromJson(v));
      });
    }

    return RefundResultModel(
        productPrice: productPrice,
        quntity: quntity,
        productTotalDiscount: productTotalDiscount,
        productTotalTax: productTotalTax,
        subtotal: subtotal,
        couponDiscount: couponDiscount,
        refundAmount: refundAmount,
        refundRequest: refundRequest);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_price'] = this.productPrice;
    data['quntity'] = this.quntity;
    data['product_total_discount'] = this.productTotalDiscount;
    data['product_total_tax'] = this.productTotalTax;
    data['subtotal'] = this.subtotal;
    data['coupon_discount'] = this.couponDiscount;
    data['refund_amount'] = this.refundAmount;

    data['refund_request'] = this.refundRequest.map((v) => v.toJson()).toList();

    return data;
  }
}

class RefundRequest {
  int id;
  int orderDetailsId;
  int customerId;
  String status;
  double amount;
  int productId;
  int orderId;
  String refundReason;
  List<String> images;
  String createdAt;
  String updatedAt;
  String approvedNote;
  String rejectedNote;
  String paymentInfo;
  String changeBy;

  RefundRequest({
    required this.id,
    required this.orderDetailsId,
    required this.customerId,
    required this.status,
    required this.amount,
    required this.productId,
    required this.orderId,
    required this.refundReason,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
    required this.approvedNote,
    required this.rejectedNote,
    required this.paymentInfo,
    required this.changeBy,
  });

  RefundRequest.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? -1,
        orderDetailsId = json['order_details_id'] ?? -1,
        customerId = json['customer_id'] ?? -1,
        status = json['status'] ?? "",
        amount = json['amount']?.toDouble() ?? 0.0,
        productId = json['product_id'] ?? -1,
        orderId = json['order_id'] ?? -1,
        refundReason = json['refund_reason'] ?? "",
        images = json['images']?.cast<String>() ?? [],
        createdAt = json['created_at'] ?? "",
        updatedAt = json['updated_at'] ?? "",
        approvedNote = json['approved_note'] ?? "",
        rejectedNote = json['rejected_note'] ?? "",
        paymentInfo = json['payment_info'] ?? "",
        changeBy = json['change_by'] ?? "";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_details_id'] = this.orderDetailsId;
    data['customer_id'] = this.customerId;
    data['status'] = this.status;
    data['amount'] = this.amount;
    data['product_id'] = this.productId;
    data['order_id'] = this.orderId;
    data['refund_reason'] = this.refundReason;
    data['images'] = this.images;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['approved_note'] = this.approvedNote;
    data['rejected_note'] = this.rejectedNote;
    data['payment_info'] = this.paymentInfo;
    data['change_by'] = this.changeBy;
    return data;
  }
}
