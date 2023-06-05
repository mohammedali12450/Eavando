import 'package:flutter_axtro_soft_ecommerce/data/model/response/cart_model.dart';
import 'package:flutter_axtro_soft_ecommerce/data/model/response/product_model.dart';

class OrderPlaceModel {
  late CustomerInfo _customerInfo;
  late List<CartModel> _cart;
  late String _paymentMethod;
  late double _discount;

  OrderPlaceModel(CustomerInfo customerInfo, List<CartModel> cart,
      String paymentMethod, double discount) {
    this._customerInfo = customerInfo;
    this._cart = cart;
    this._paymentMethod = paymentMethod;
    this._discount = discount;
  }

  CustomerInfo get customerInfo => _customerInfo;
  List<CartModel> get cart => _cart;
  String get paymentMethod => _paymentMethod;
  double get discount => _discount;

  OrderPlaceModel.fromJson(Map<String, dynamic> json) {
    _customerInfo = CustomerInfo.fromJson(json['customer_info'] ?? {});
    _cart = [];
    if (json['cart'] != null) {
      json['cart'].forEach((v) {
        _cart.add(new CartModel.fromJson(v));
      });
    }
    _paymentMethod = json['payment_method'] ?? "";
    _discount = json['discount'] ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_info'] = this._customerInfo.toJson();

    data['cart'] = this._cart.map((v) => v.toJson()).toList();

    data['payment_method'] = this._paymentMethod;
    data['discount'] = this._discount;
    return data;
  }
}

class CustomerInfo {
  late String _addressId;
  late String _shippingAddress;
  late String _billingId;
  late String _billingAddress;
  late String _orderNote;

  CustomerInfo(String addressId, String shippingAddress, String billingId,
      String billingAddress, String orderNote) {
    this._addressId = addressId;
    this._shippingAddress = shippingAddress;
    this._addressId = billingId;
    this._billingAddress = billingAddress;
    this._orderNote = orderNote;
  }

  String get addressId => _addressId;
  String get shippingAddress => _shippingAddress;
  String get billingId => _billingId;
  String get billingAddress => _billingAddress;
  String get orderNote => _orderNote;

  CustomerInfo.fromJson(Map<String, dynamic> json) {
    _addressId = json['address_id'] ?? "-1";
    _shippingAddress = json['shipping_address'] ?? "";
    _billingId = json['billing_address_id'] ?? "-1";
    _billingAddress = json['billing_address_data'] ?? "";
    _orderNote = json['order_note'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this._addressId;
    data['shipping_address'] = this._shippingAddress;
    data['billing_address_id'] = this._billingId;
    data['billing_address_data'] = this._billingAddress;
    data['order_note'] = this._orderNote;
    return data;
  }
}

class Cart {
  late String _id;
  late double _tax;
  late int _quantity;
  late double _price;
  late double _discount;
  late String _discountType;
  late int _shippingMethodId;
  late String _variant;
  late List<Variation> _variation;
  late double _shippingCost;

  Cart(
      String id,
      double tax,
      int quantity,
      double price,
      double discount,
      String discountType,
      int shippingMethodId,
      String variant,
      List<Variation> variation,
      double shippingCost) {
    this._id = id;
    this._tax = tax;
    this._quantity = quantity;
    this._price = price;
    this._discount = discount;
    this._discountType = discountType;
    this._shippingMethodId = shippingMethodId;
    this._variant = variant;
    this._variation = variation;
    this._shippingCost = shippingCost;
  }

  String get id => _id;
  double get tax => _tax;
  int get quantity => _quantity;
  double get price => _price;
  double get discount => _discount;
  String get discountType => _discountType;
  int get shippingMethodId => _shippingMethodId;
  String get variant => _variant;
  List<Variation> get variation => _variation;
  double get shippingCost => _shippingCost;

  Cart.fromJson(Map<String, dynamic> json) {
    _id = json['id'] ?? "-1";
    _tax = json['tax'] ?? 0.0;
    _quantity = json['quantity'] ?? 0;
    _price = json['price'] ?? 0.0;
    _discount = json['discount'] ?? 0.0;
    _discountType = json['discount_type'] ?? "";
    _shippingMethodId = json['shipping_method_id'] ?? 0;
    _variant = json['variant'];
    if (json['variations'] != null) {
      _variation = [];
      json['variations'].forEach((v) {
        _variation.add(new Variation.fromJson(v));
      });
    }
    _shippingCost = json['shipping_cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['tax'] = this._tax;
    data['quantity'] = this._quantity;
    data['price'] = this._price;
    data['discount'] = this._discount;
    data['discount_type'] = this._discountType;
    data['shipping_method_id'] = this._shippingMethodId;
    data['variant'] = this._variant;

    data['variations'] = this._variation.map((v) => v.toJson()).toList();

    data['shipping_cost'] = this._shippingCost;
    return data;
  }
}
