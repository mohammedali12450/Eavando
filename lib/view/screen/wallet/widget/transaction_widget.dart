import 'package:flutter/material.dart';
import 'package:flutter_axtro_soft_ecommerce/data/model/response/transaction_model.dart';
import 'package:flutter_axtro_soft_ecommerce/helper/date_converter.dart';
import 'package:flutter_axtro_soft_ecommerce/helper/price_converter.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/color_resources.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/custom_themes.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/dimensions.dart';

class TransactionWidget extends StatelessWidget {
  final WalletTransactioList transactionModel;
  const TransactionWidget({Key? key, required this.transactionModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String type = transactionModel.transactionType ?? "";
    String reformatType = "";
    if (type.contains('_')) {
      reformatType = type.replaceAll('_', ' ');
    }
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.HOME_PAGE_PADDING,
          vertical: Dimensions.PADDING_SIZE_SMALL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    PriceConverter.convertPrice(
                      context,
                      (transactionModel.credit ?? 0) > 0
                          ? transactionModel.credit ?? 0.0
                          : transactionModel.debit ?? 0.0,
                    ),
                    style: robotoRegular.copyWith(
                        color: ColorResources.getYellow(context),
                        fontSize: Dimensions.FONT_SIZE_LARGE),
                  ),
                  SizedBox(
                    height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                  ),
                  Text(
                    '$reformatType',
                    style: robotoRegular.copyWith(
                        color: ColorResources.getHint(context)),
                  ),
                ],
              )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    DateConverter.localDateToIsoStringAMPM(
                      DateTime.parse(
                        transactionModel.createdAt ?? DateTime.now().toString(),
                      ),
                    ),
                    style: robotoRegular.copyWith(
                        color: ColorResources.getHint(context)),
                  ),
                  SizedBox(
                    height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                  ),
                  Text(
                    '${(transactionModel.credit ?? 0.0) > 0 ? 'Credit' : 'Debit'}',
                    style: robotoRegular.copyWith(
                        color: (transactionModel.credit ?? 0) > 0
                            ? Colors.green
                            : Colors.red),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
            child: Divider(
              thickness: .4,
              color: Theme.of(context).hintColor.withOpacity(.8),
            ),
          ),
        ],
      ),
    );
  }
}
