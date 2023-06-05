import 'package:flutter_axtro_soft_ecommerce/data/model/response/chat_model.dart';

class MessageModel {
  int totalSize;
  String limit;
  String offset;
  List<Message> message;

  MessageModel({
    required this.totalSize,
    required this.limit,
    required this.offset,
    required this.message,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    final totalSize = json['total_size'] ?? 10;
    final limit = json['limit'] ?? "10";
    final offset = json['offset'] ?? "0";
    final message = <Message>[];
    if (json['message'] != null) {
      json['message'].forEach((v) {
        message.add(Message.fromJson(v));
      });
    }
    return MessageModel(
      totalSize: totalSize,
      limit: limit,
      offset: offset,
      message: message,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_size'] = totalSize;
    data['limit'] = limit;
    data['offset'] = offset;

    data['message'] = message.map((v) => v.toJson()).toList();

    return data;
  }
}

class Message {
  int id;
  String message;
  int sentByCustomer;
  int sentBySeller;
  int sentByAdmin;
  int seenByDeliveryMan;
  String createdAt;
  DeliveryMan deliveryMan;
  SellerInfo sellerInfo;

  Message({
    required this.id,
    required this.message,
    required this.sentByCustomer,
    required this.sentBySeller,
    required this.sentByAdmin,
    required this.seenByDeliveryMan,
    required this.createdAt,
    required this.deliveryMan,
    required this.sellerInfo,
  });

  Message.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? -1,
        message = json['message'] ?? "",
        sentByCustomer = json['sent_by_customer'] ?? -1,
        sentBySeller = json['sent_by_seller'] ?? -1,
        sentByAdmin = json['sent_by_admin'] ?? -1,
        seenByDeliveryMan =
            int.parse(json['seen_by_delivery_man']?.toString() ?? "-1"),
        createdAt = json['created_at'] ?? "",
        deliveryMan = DeliveryMan.fromJson(json['delivery_man'] ?? {}),
        sellerInfo = SellerInfo.fromJson(json['seller_info'] ?? {});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['message'] = message;
    data['sent_by_customer'] = sentByCustomer;
    data['sent_by_seller'] = sentBySeller;
    data['sent_by_admin'] = sentByAdmin;
    data['seen_by_delivery_man'] = seenByDeliveryMan;
    data['created_at'] = createdAt;

    data['delivery_man'] = deliveryMan.toJson();

    data['seller_info'] = sellerInfo.toJson();

    return data;
  }
}
