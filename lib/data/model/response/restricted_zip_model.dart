class RestrictedZipModel {
  int? id;
  String? zipcode;
  RestrictedZipModel({this.id, this.zipcode});

  RestrictedZipModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    zipcode = json['zipcode'];
  }
}
