class AddressModel {
  final int id;
  final int customerId;
  final String contactPersonName;
  final String addressType;
  final String address;
  final String city;
  final String zip;
  final String phone;
  final String createdAt;
  final String updatedAt;
  final String state;
  final String country;
  final String latitude;
  final String longitude;
  final int isBilling;

  AddressModel copyWith({
    int? id,
    int? customerId,
    String? contactPersonName,
    String? addressType,
    String? address,
    String? city,
    String? zip,
    String? phone,
    String? createdAt,
    String? updatedAt,
    String? state,
    String? country,
    String? latitude,
    String? longitude,
    int? isBilling,
  }) {
    return AddressModel(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      contactPersonName: contactPersonName ?? this.contactPersonName,
      addressType: addressType ?? this.addressType,
      address: address ?? this.address,
      city: city ?? this.city,
      zip: zip ?? this.zip,
      phone: phone ?? this.phone,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      state: state ?? this.state,
      country: country ?? this.country,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isBilling: isBilling ?? this.isBilling,
    );
  }

  AddressModel({
    required this.id,
    required this.customerId,
    required this.contactPersonName,
    required this.addressType,
    required this.address,
    required this.city,
    required this.zip,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
    required this.state,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.isBilling,
  });

  AddressModel.core({
    required this.contactPersonName,
    required this.addressType,
    required this.address,
    required this.city,
    required this.zip,
    required this.phone,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.isBilling,
  })  : id = -1,
        customerId = -1,
        updatedAt = "",
        createdAt = "",
        state = "";

  const AddressModel.init()
      : id = -1,
        customerId = -1,
        contactPersonName = "",
        addressType = "",
        address = "",
        city = "",
        zip = "",
        phone = "",
        createdAt = "",
        updatedAt = "",
        state = "",
        country = "",
        latitude = "0.0",
        longitude = "0.0",
        isBilling = 0;

  AddressModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? -1,
        customerId = json['customer_id'] ?? -1,
        contactPersonName = json['contact_person_name'] ?? "",
        addressType = json['address_type'] ?? "",
        address = json['address'] ?? "",
        city = json['city'] ?? "",
        zip = json['zip'] ?? "",
        phone = json['phone'] ?? "",
        createdAt = json['created_at'] ?? "",
        updatedAt = json['updated_at'] ?? "",
        state = json['state'] ?? "",
        country = json['country'] ?? "",
        latitude = json['latitude'] ?? "",
        longitude = json['longitude'] ?? "",
        isBilling = json['is_billing'] ?? 0;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['contact_person_name'] = this.contactPersonName;
    data['address_type'] = this.addressType;
    data['address'] = this.address;
    data['city'] = this.city;
    data['zip'] = this.zip;
    data['phone'] = this.phone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['state'] = this.state;
    data['country'] = this.country;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['is_billing'] = this.isBilling;
    return data;
  }
}
