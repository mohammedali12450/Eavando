import 'package:flutter/material.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/chat_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/color_resources.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ChatShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      shrinkWrap: true,
      reverse: true,
      itemBuilder: (context, index) {
        bool isMe = index % 2 == 0;
        return Shimmer.fromColors(
          baseColor: isMe ? Color(0xFFE0E0E0) : ColorResources.IMAGE_BG,
          highlightColor: isMe
              ? Color(0xFFF5F5F5)
              : ColorResources.IMAGE_BG.withOpacity(0.9),
          enabled: Provider.of<ChatProvider>(context).chatList == null,
          child: Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              isMe
                  ? SizedBox.shrink()
                  : InkWell(child: CircleAvatar(child: Icon(Icons.person))),
              Expanded(
                child: Container(
                  margin: isMe
                      ? EdgeInsets.fromLTRB(50, 5, 10, 5)
                      : EdgeInsets.fromLTRB(10, 5, 50, 5),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft:
                            isMe ? Radius.circular(10) : Radius.circular(0),
                        bottomRight:
                            isMe ? Radius.circular(0) : Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: isMe
                          ? ColorResources.IMAGE_BG
                          : ColorResources.WHITE),
                  child: Container(height: 20),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
