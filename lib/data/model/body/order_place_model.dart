import 'package:flutter_axtro_soft_ecommerce/data/model/response/cart_model.dart';
import 'package:flutter_axtro_soft_ecommerce/data/model/response/product_model.dart';

class OrderPlaceModel {
  CustomerInfo? customerInfo;
  List<CartModel>? cart;
  String? paymentMethod;
  double? discount;

  OrderPlaceModel(CustomerInfo customerInfo, List<CartModel> cart,
      String paymentMethod, double discount);

  OrderPlaceModel.fromJson(Map<String, dynamic> json) {
    customerInfo = json['customer_info'] != null
        ? new CustomerInfo.fromJson(json['customer_info'])
        : null;
    if (json['cart'] != null) {
      cart = [];
      json['cart'].forEach((v) {
        cart?.add(new CartModel.fromJson(v));
      });
    }
    paymentMethod = json['payment_method'];
    discount = json['discount'];
  }
}

class CustomerInfo {
  String? addressId;
  String? shippingAddress;
  String? billingId;
  String? billingAddress;
  String? orderNote;

  CustomerInfo(String addressId, String shippingAddress, String billingId,
      String billingAddress, String orderNote);

  CustomerInfo.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    shippingAddress = json['shipping_address'];
    billingId = json['billing_address_id'];
    billingAddress = json['billing_address_data'];
    orderNote = json['order_note'];
  }
}

class Cart {
  String? id;
  double? tax;
  int? quantity;
  double? price;
  double? discount;
  String? discountType;
  int? shippingMethodId;
  String? variant;
  List<Variation>? variation;
  double? shippingCost;

  Cart(
      this.id,
      this.tax,
      this.quantity,
      this.price,
      this.discount,
      this.discountType,
      this.shippingMethodId,
      this.variant,
      this.variation,
      this.shippingCost);

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tax = json['tax'];
    quantity = json['quantity'];
    price = json['price'];
    discount = json['discount'];
    discountType = json['discount_type'];
    shippingMethodId = json['shipping_method_id'];
    variant = json['variant'];
    if (json['variations'] != null) {
      variation = [];
      json['variations'].forEach((v) {
        variation?.add(new Variation.fromJson(v));
      });
    }
    shippingCost = json['shipping_cost'];
  }
}
