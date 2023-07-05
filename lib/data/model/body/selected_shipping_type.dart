class SelectedShippingType {
  int? sellerId;
  String? selectedShippingType;

  SelectedShippingType({this.sellerId, this.selectedShippingType});

  SelectedShippingType.fromJson(Map<String, dynamic> json) {
    sellerId = json['sellerId'];
    selectedShippingType = json['selectedShippingType'];
  }
}
