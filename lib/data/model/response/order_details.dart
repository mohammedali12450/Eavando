import 'package:flutter_axtro_soft_ecommerce/data/model/response/product_model.dart';
import 'package:flutter_axtro_soft_ecommerce/data/model/response/seller_model.dart';

class OrderDetailsModel {
  int? id;
  int? orderId;
  int? productId;
  int? sellerId;
  String? digitalFileAfterSell;
  Product? productDetails;
  int? qty;
  double? price;
  double? tax;
  double? discount;
  String? deliveryStatus;
  String? paymentStatus;
  String? createdAt;
  String? updatedAt;
  int? shippingMethodId;
  String? variant;
  int? refundReq;
  Seller? seller;

  OrderDetailsModel({
    this.id,
    this.orderId,
    this.productId,
    this.sellerId,
    this.digitalFileAfterSell,
    this.productDetails,
    this.qty,
    this.price,
    this.tax,
    this.discount,
    this.deliveryStatus,
    this.paymentStatus,
    this.createdAt,
    this.updatedAt,
    this.shippingMethodId,
    this.variant,
    this.refundReq,
    this.seller,
  });

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    sellerId = json['seller_id'];
    if (json['digital_file_after_sell'] != null) {
      digitalFileAfterSell = json['digital_file_after_sell'];
    }
    if (json['product_details'] != null) {
      productDetails = Product.fromJson(json['product_details']);
    }
    qty = json['qty'];
    price = json['price']?.toDouble();
    tax = json['tax']?.toDouble();
    discount = json['discount']?.toDouble();
    deliveryStatus = json['delivery_status'];
    paymentStatus = json['payment_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shippingMethodId = json['shipping_method_id'];
    variant = json['variant'];
    refundReq = json['refund_request'];
    seller =
        json['seller'] != null ? new Seller.fromJson(json['seller']) : null;
  }
}
