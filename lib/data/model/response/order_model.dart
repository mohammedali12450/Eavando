class OrderModel {
  int? id;
  int? customerId;
  String? customerType;
  String? paymentStatus;
  String? orderStatus;
  String? paymentMethod;
  String? transactionRef;
  double? orderAmount;
  int? shippingAddress;
  int? billingAddress;
  ShippingAddressData? shippingAddressData;
  BillingAddressData? billingAddressData;
  int? sellerId;
  int? shippingMethodId;
  double? shippingCost;
  String? createdAt;
  String? updatedAt;
  double? discountAmount;
  String? discountType;
  String? orderNote;
  String? orderType;
  double? extraDiscount;
  String? extraDiscountType;
  String? thirdPartyServiceName;
  String? thirdPartyTrackingId;
  DeliveryMan? deliveryMan;

  OrderModel(
      {this.id,
      this.customerId,
      this.customerType,
      this.paymentStatus,
      this.orderStatus,
      this.paymentMethod,
      this.transactionRef,
      this.orderAmount,
      this.shippingAddress,
      this.billingAddress,
      this.shippingAddressData,
      this.billingAddressData,
      this.sellerId,
      this.shippingMethodId,
      this.shippingCost,
      this.createdAt,
      this.updatedAt,
      this.discountAmount,
      this.discountType,
      this.orderNote,
      this.orderType,
      this.extraDiscount,
      this.extraDiscountType,
      this.thirdPartyTrackingId,
      this.deliveryMan,
      d});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    customerType = json['customer_type'];
    paymentStatus = json['payment_status'];
    orderStatus = json['order_status'];
    paymentMethod = json['payment_method'];
    transactionRef = json['transaction_ref'];
    orderAmount = json['order_amount'].toDouble();
    shippingAddress = json['shipping_address'];
    shippingAddressData = json['shipping_address_data'] != null
        ? new ShippingAddressData.fromJson(json['shipping_address_data'])
        : null;
    billingAddress = json['billing_address'];
    billingAddressData = json['billing_address_data'] != null
        ? new BillingAddressData.fromJson(json['billing_address_data'])
        : null;

    if (json['seller_id'] != null && json['seller_id'] != '') {
      sellerId = json['seller_id'];
    }
    shippingMethodId = int.parse(json['shipping_method_id'].toString());
    shippingCost = double.parse(json['shipping_cost'].toString());
    if (json['created_at'] != null) {
      createdAt = json['created_at'];
    }
    updatedAt = json['updated_at'];
    discountAmount = json['discount_amount'].toDouble();
    discountType = json['discount_type'];
    orderNote = json['order_note'];
    orderType = json['order_type'];
    extraDiscount = json['extra_discount'].toDouble();
    extraDiscountType = json['extra_discount_type'];
    if (json['delivery_service_name'] != null &&
        json['delivery_service_name'] != "") {
      thirdPartyServiceName = json['delivery_service_name'];
    }
    if (json['third_party_delivery_tracking_id'] != null &&
        json['third_party_delivery_tracking_id'] != "") {
      thirdPartyTrackingId = json['third_party_delivery_tracking_id'];
    }
    deliveryMan = json['delivery_man'] != null
        ? new DeliveryMan.fromJson(json['delivery_man'])
        : null;
  }
}

class BillingAddressData {
  int? id;
  int? customerId;
  String? contactPersonName;
  String? addressType;
  String? address;
  String? city;
  String? zip;
  String? phone;
  String? createdAt;
  String? updatedAt;
  String? country;
  String? latitude;
  String? longitude;
  int? isBilling;

  BillingAddressData({
    this.id,
    this.customerId,
    this.contactPersonName,
    this.addressType,
    this.address,
    this.city,
    this.zip,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.country,
    this.latitude,
    this.longitude,
    this.isBilling,
  });

  BillingAddressData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    contactPersonName = json['contact_person_name'];
    addressType = json['address_type'];
    address = json['address'];
    city = json['city'];
    zip = json['zip'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    country = json['country'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isBilling = json['is_billing'];
  }
}

class ShippingAddressData {
  int? id;
  int? customerId;
  String? contactPersonName;
  String? addressType;
  String? address;
  String? city;
  String? zip;
  String? phone;
  String? createdAt;
  String? updatedAt;
  String? country;

  ShippingAddressData({
    this.id,
    this.customerId,
    this.contactPersonName,
    this.addressType,
    this.address,
    this.city,
    this.zip,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.country,
  });

  ShippingAddressData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    contactPersonName = json['contact_person_name'];
    addressType = json['address_type'];
    address = json['address'];
    city = json['city'];
    zip = json['zip'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    country = json['country'];
  }
}

class DeliveryMan {
  int? id;
  String? fName;
  String? lName;
  String? phone;
  String? email;
  String? image;
  DeliveryMan({
    this.id,
    this.fName,
    this.lName,
    this.phone,
    this.email,
    this.image,
  });

  DeliveryMan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    phone = json['phone'];
    email = json['email'];
    image = json['image'];
  }
}
