class ChosenShippingMethodModel {
  int? id;
  String? cartGroupId;
  int? shippingMethodId;
  double? shippingCost;
  String? createdAt;
  String? updatedAt;

  ChosenShippingMethodModel({
    this.id,
    this.cartGroupId,
    this.shippingMethodId,
    this.shippingCost,
    this.createdAt,
    this.updatedAt,
  });

  ChosenShippingMethodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cartGroupId = json['cart_group_id'];
    shippingMethodId = int.parse(json['shipping_method_id'].toString());
    shippingCost = double.parse(json['shipping_cost'].toString());
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
