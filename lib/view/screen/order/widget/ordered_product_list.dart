import 'package:flutter/material.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/order_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/view/basewidget/show_custom_snakbar.dart';
import 'package:flutter_axtro_soft_ecommerce/view/screen/order/widget/order_details_widget.dart';

class OrderProductList extends StatelessWidget {
  final OrderProvider order;
  final String orderType;
  const OrderProductList({
    Key? key,
    required this.order,
    required this.orderType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(0),
      itemCount: order.orderDetails?.length ?? 0,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) => OrderDetailsWidget(
        orderDetailsModel: order.orderDetails?[i],
        callback: () {
          showCustomSnackBar('Review submitted successfully', context,
              isError: false);
        },
        orderType: orderType,
        paymentStatus: order.trackingModel?.paymentStatus ?? "",
      ),
    );
  }
}
