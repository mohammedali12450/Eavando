class ReviewBody {
  String? productId;
  String? comment;
  String? rating;
  List<String>? fileUpload;

  ReviewBody({
    this.productId,
    this.comment,
    this.rating,
    this.fileUpload,
  });

  ReviewBody.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    comment = json['comment'];
    rating = json['rating'];
    fileUpload = json['fileUpload']?.cast<String>();
  }
}
