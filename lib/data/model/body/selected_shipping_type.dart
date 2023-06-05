class SelectedShippingType {
  late int _sellerId;
  late String _selectedShippingType;

  SelectedShippingType({
    required int sellerId,
    required String selectedShippingType,
  }) {
    this._sellerId = sellerId;

    this._selectedShippingType = selectedShippingType;
  }

  int get sellerId => _sellerId;
  String get selectedShippingType => _selectedShippingType;

  SelectedShippingType.fromJson(Map<String, dynamic> json) {
    _sellerId = json['sellerId'] ?? -1;
    _selectedShippingType = json['selectedShippingType'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sellerId'] = this._sellerId;
    data['selectedShippingType'] = this._selectedShippingType;
    return data;
  }
}
