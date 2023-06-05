class ChatModel {
  final int totalSize;
  final String limit;
  final String offset;
  final List<Chat> chat;

  ChatModel({
    required this.totalSize,
    required this.limit,
    required this.offset,
    required this.chat,
  });

  ChatModel.fromJson(Map<String, dynamic> json)
      : totalSize = json['total_size'] ?? 0,
        limit = json['limit'] ?? "",
        offset = json['offset'] ?? "",
        chat = ((json['chat'] ?? []) as List)
            .map((e) => Chat.fromJson(e))
            .toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_size'] = this.totalSize;
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    data['chat'] = this.chat.map((v) => v.toJson()).toList();
    return data;
  }
}

class Chat {
  int id;
  int userId;
  int sellerId;
  int adminId;
  int deliveryManId;
  String message;
  int sentByCustomer;
  int sentBySeller;
  int sentByAdmin;
  int sentByDeliveryMan;
  int seenByCustomer;
  int status;
  String createdAt;
  String updatedAt;
  SellerInfo sellerInfo;
  DeliveryMan deliveryMan;

  Chat({
    required this.id,
    required this.userId,
    required this.sellerId,
    required this.adminId,
    required this.deliveryManId,
    required this.message,
    required this.sentByCustomer,
    required this.sentBySeller,
    required this.sentByAdmin,
    required this.sentByDeliveryMan,
    required this.seenByCustomer,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.sellerInfo,
    required this.deliveryMan,
  });

  Chat.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? -1,
        userId = json['user_id'] ?? -1,
        sellerId = json['seller_id'] ?? -1,
        adminId = json['admin_id'] ?? -1,
        deliveryManId = int.parse(json['delivery_man_id']?.toString() ?? "-1"),
        message = json['message'] ?? "",
        sentByCustomer = json['sent_by_customer'] ?? -1,
        sentBySeller = json['sent_by_seller'] ?? -1,
        sentByAdmin = json['sent_by_admin'] ?? -1,
        sentByDeliveryMan = json['sent_by_delivery_man'] ?? -1,
        seenByCustomer = json['seen_by_customer'] ?? -1,
        status = json['status'] ?? 0,
        createdAt = json['created_at'] ?? "",
        updatedAt = json['updated_at'] ?? "",
        sellerInfo = SellerInfo.fromJson(json['seller_info'] ?? {}),
        deliveryMan = DeliveryMan.fromJson(json['delivery_man'] ?? {});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['seller_id'] = this.sellerId;
    data['admin_id'] = this.adminId;
    data['delivery_man_id'] = this.deliveryManId;
    data['message'] = this.message;
    data['sent_by_customer'] = this.sentByCustomer;
    data['sent_by_seller'] = this.sentBySeller;
    data['sent_by_admin'] = this.sentByAdmin;
    data['sent_by_delivery_man'] = this.sentByDeliveryMan;
    data['seen_by_customer'] = this.seenByCustomer;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['delivery_man'] = deliveryMan.toJson();
    data['seller_info'] = sellerInfo.toJson();
    return data;
  }
}

class SellerInfo {
  List<Shops> shops;

  SellerInfo({required this.shops});

  factory SellerInfo.fromJson(Map<String, dynamic> json) {
    final shops = <Shops>[];
    if (json['shops'] != null) {
      json['shops'].forEach((v) {
        shops.add(Shops.fromJson(v));
      });
    }

    return SellerInfo(shops: shops);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shops'] = shops.map((v) => v.toJson()).toList();
    return data;
  }
}

class Shops {
  int id;
  int sellerId;
  String name;
  String image;

  Shops({
    required this.id,
    required this.sellerId,
    required this.name,
    required this.image,
  });

  Shops.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? -1,
        sellerId = int.parse(json['seller_id']?.toString() ?? "-1"),
        name = json['name'] ?? "",
        image = json['image'] ?? "";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['seller_id'] = sellerId;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}

class DeliveryMan {
  int id;
  String fName;
  String lName;
  String image;

  DeliveryMan({
    required this.id,
    required this.fName,
    required this.lName,
    required this.image,
  });

  DeliveryMan.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? -1,
        fName = json['f_name'] ?? "",
        lName = json['l_name'] ?? "",
        image = json['image'] ?? "";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['image'] = this.image;
    return data;
  }
}
