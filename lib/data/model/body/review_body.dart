class ReviewBody {
  late String _productId;
  late String _comment;
  late String _rating;
  late List<String> _fileUpload;

  ReviewBody({
    required String productId,
    required String comment,
    required String rating,
    required List<String> fileUpload,
  }) {
    this._productId = productId;
    this._comment = comment;
    this._rating = rating;
    this._fileUpload = fileUpload;
  }

  String get productId => _productId;
  String get comment => _comment;
  String get rating => _rating;
  List<String> get fileUpload => _fileUpload;

  ReviewBody.fromJson(Map<String, dynamic> json) {
    _productId = json['product_id'] ?? "-1";
    _comment = json['comment'] ?? "";
    _rating = json['rating'] ?? "";
    _fileUpload = json['fileUpload']?.cast<String>() ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this._productId;
    data['comment'] = this._comment;
    data['rating'] = this._rating;
    data['fileUpload'] = this._fileUpload;
    return data;
  }
}
