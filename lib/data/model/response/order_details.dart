import 'package:flutter_axtro_soft_ecommerce/data/model/response/product_model.dart';
import 'package:flutter_axtro_soft_ecommerce/data/model/response/seller_model.dart';

class OrderDetailsModel {
  late int _id;
  late int _orderId;
  late int _productId;
  late int _sellerId;
  late String _digitalFileAfterSell;
  late Product _productDetails;
  late int _qty;
  late double _price;
  late double _tax;
  late double _discount;
  late String _deliveryStatus;
  late String _paymentStatus;
  late String _createdAt;
  late String _updatedAt;
  late int _shippingMethodId;
  late String _variant;
  late int _refundReq;
  late Seller _seller;

  OrderDetailsModel({
    required int id,
    required int orderId,
    required int productId,
    required int sellerId,
    required String digitalFileAfterSell,
    required Product productDetails,
    required int qty,
    required double price,
    required double tax,
    required double discount,
    required String deliveryStatus,
    required String paymentStatus,
    required String createdAt,
    required String updatedAt,
    required int shippingMethodId,
    required String variant,
    required int refundReq,
    required Seller seller,
  }) {
    this._id = id;
    this._orderId = orderId;
    this._productId = productId;
    this._sellerId = sellerId;

    this._digitalFileAfterSell = digitalFileAfterSell;

    this._productDetails = productDetails;
    this._qty = qty;
    this._price = price;
    this._tax = tax;
    this._discount = discount;
    this._deliveryStatus = deliveryStatus;
    this._paymentStatus = paymentStatus;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._shippingMethodId = shippingMethodId;
    this._variant = variant;
    this._refundReq = refundReq;

    this._seller = seller;
  }

  int get id => _id;
  int get orderId => _orderId;
  int get productId => _productId;
  int get sellerId => _sellerId;
  String get digitalFileAfterSell => _digitalFileAfterSell;
  Product get productDetails => _productDetails;
  int get qty => _qty;
  double get price => _price;
  double get tax => _tax;
  double get discount => _discount;
  String get deliveryStatus => _deliveryStatus;
  String get paymentStatus => _paymentStatus;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  int get shippingMethodId => _shippingMethodId;
  String get variant => _variant;
  int get refundReq => _refundReq;
  Seller get seller => _seller;

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'] ?? -1;
    _orderId = json['order_id'] ?? -1;
    _productId = json['product_id'] ?? -1;
    _sellerId = json['seller_id'] ?? -1;
    if (json['digital_file_after_sell'] != null) {
      _digitalFileAfterSell = json['digital_file_after_sell'] ?? "";
    }
    if (json['product_details'] != null) {
      _productDetails = Product.fromJson(json['product_details'] ?? {});
    }
    _qty = json['qty'] ?? 0;
    _price = json['price']?.toDouble() ?? 0.0;
    _tax = json['tax']?.toDouble() ?? 0.0;
    _discount = json['discount']?.toDouble() ?? 0.0;
    _deliveryStatus = json['delivery_status'] ?? "";
    _paymentStatus = json['payment_status'] ?? "";
    _createdAt = json['created_at'] ?? "";
    _updatedAt = json['updated_at'] ?? "";
    _shippingMethodId = json['shipping_method_id'] ?? -1;
    _variant = json['variant'] ?? "";
    _refundReq = json['refund_request'] ?? 0;
    _seller = Seller.fromJson(json['seller'] ?? {});
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['order_id'] = this._orderId;
    data['product_id'] = this._productId;
    data['seller_id'] = this._sellerId;
    data['digital_file_after_sell'] = this._digitalFileAfterSell;
    data['product_details'] = this._productDetails.toJson();
    data['qty'] = this._qty;
    data['price'] = this._price;
    data['tax'] = this._tax;
    data['discount'] = this._discount;
    data['delivery_status'] = this._deliveryStatus;
    data['payment_status'] = this._paymentStatus;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['shipping_method_id'] = this._shippingMethodId;
    data['variant'] = this._variant;
    data['refund_request'] = this._refundReq;

    data['seller'] = this._seller.toJson();

    return data;
  }
}
