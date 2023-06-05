import 'package:flutter/material.dart';
import 'package:flutter_axtro_soft_ecommerce/data/model/response/product_details_model.dart'
    as pd;
import 'package:flutter_axtro_soft_ecommerce/helper/price_converter.dart';
import 'package:flutter_axtro_soft_ecommerce/localization/language_constrants.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/product_details_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/theme/light_theme.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/color_resources.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/custom_themes.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/dimensions.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProductTitleView extends StatefulWidget {
  pd.ProductDetailsModel? productModel;
  final String averageRatting;
  ValueChanged callback;
  int colorIndex;

  ProductTitleView({
    required this.productModel,
    required this.averageRatting,
    required this.colorIndex,
    required this.callback,
  });

  @override
  State<ProductTitleView> createState() => _ProductTitleViewState();
}

class _ProductTitleViewState extends State<ProductTitleView> {
  @override
  Widget build(BuildContext context) {
    double _startingPrice = 0;
    double _endingPrice = 0;
    if (widget.productModel?.variation != null &&
        widget.productModel!.variation.length != 0) {
      List<double> _priceList = [];
      widget.productModel!.variation
          .forEach((variation) => _priceList.add(variation.price));
      _priceList.sort((a, b) => a.compareTo(b));
      _startingPrice = _priceList[0];
      if (_priceList[0] < _priceList[_priceList.length - 1]) {
        _endingPrice = _priceList[_priceList.length - 1];
      }
    } else {
      _startingPrice = widget.productModel?.unitPrice ?? 0.0;
    }
    var startTotalPrice = ((double.parse(PriceConverter.convertPrice(
              context,
              _startingPrice,
              discount: widget.productModel?.discount,
              discountType: widget.productModel?.discountType,
            ).replaceAll(RegExp(r'€'), ""))) *
            (1 + (widget.productModel?.tax ?? 1) / 100))
        .toStringAsFixed(2);
    // print(startTotalPrice);
    return widget.productModel != null
        ? Container(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
            child: Consumer<ProductDetailsProvider>(
              builder: (context, details, child) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Expanded(
                            child: Text(widget.productModel?.name ?? '',
                                style: titleRegular.copyWith(
                                    fontSize: Dimensions.FONT_SIZE_LARGE),
                                maxLines: 2)),
                      ]),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      Row(
                        children: [
                          Text(
                            // '${_startingPrice != null ? PriceConverter.convertPrice(context, _startingPrice, discount: widget.productModel.discount, discountType: widget.productModel.discountType) : ''}'
                            _startingPrice != 0
                                ? "€" + startTotalPrice
                                : '${_endingPrice != 0.0 ? ' - ${PriceConverter.convertPrice(context, _endingPrice, discount: widget.productModel?.discount ?? 0.0, discountType: widget.productModel?.discountType ?? "")}' : ''}',
                            style: titilliumBold.copyWith(
                                color: ColorResources.getPrimary(context),
                                fontSize: Dimensions.FONT_SIZE_LARGE),
                          ),
                          SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          widget.productModel?.discount != null &&
                                  widget.productModel!.discount > 0
                              ? Text(
                                  _startingPrice != 0
                                      ? "€" + startTotalPrice
                                      :
                                      // '${PriceConverter.convertPrice(context, _startingPrice)}'
                                      '${_endingPrice != 0 ? ' - ${PriceConverter.convertPrice(context, _endingPrice)}' : ''}',
                                  style: titilliumRegular.copyWith(
                                      color: Theme.of(context).hintColor,
                                      decoration: TextDecoration.lineThrough),
                                )
                              : SizedBox(),
                        ],
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      Text('${getTranslated('included_vat', context)}',
                          style: titilliumRegular.copyWith(
                            color: Theme.of(context)
                                    .buttonTheme
                                    .colorScheme
                                    ?.primary ??
                                primaryColor,
                            fontSize: Dimensions.FONT_SIZE_SMALL,
                          )),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      Row(children: [
                        Text(
                            '${details.reviewList != null ? details.reviewList!.length : 0} reviews | ',
                            style: titilliumRegular.copyWith(
                              color: Theme.of(context).hintColor,
                              fontSize: Dimensions.FONT_SIZE_DEFAULT,
                            )),
                        Text('${details.orderCount} orders | ',
                            style: titilliumRegular.copyWith(
                              color: Theme.of(context).hintColor,
                              fontSize: Dimensions.FONT_SIZE_DEFAULT,
                            )),
                        Text('${details.wishCount} wish',
                            style: titilliumRegular.copyWith(
                              color: Theme.of(context).hintColor,
                              fontSize: Dimensions.FONT_SIZE_DEFAULT,
                            )),
                        Expanded(child: SizedBox.shrink()),
                        SizedBox(width: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            Text(
                                '${widget.productModel?.reviews != null ? (widget.productModel?.reviews.length ?? 0) > 0 ? double.parse(widget.averageRatting) : 0.0 : 0.0}')
                          ],
                        ),
                      ]),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      (widget.productModel?.colors.length ?? 0) > 0
                          ? Row(children: [
                              Text(
                                  '${getTranslated('select_variant', context)} : ',
                                  style: titilliumRegular.copyWith(
                                      fontSize: Dimensions.FONT_SIZE_LARGE)),
                              Expanded(
                                child: SizedBox(
                                  height: 40,
                                  child: ListView.builder(
                                    itemCount:
                                        widget.productModel?.colors.length ?? 0,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      String colorString = '0xff' +
                                          widget
                                              .productModel!.colors[index].code
                                              .substring(1, 7);
                                      return InkWell(
                                        onTap: () {
                                          // Provider.of<ProductDetailsProvider>(context, listen: false).changeIndex(index);
                                          widget.callback(index);
                                          //   widget.productModel=  Provider.of<ProductDetailsProvider>(context,listen: true).productDetailsModel;

                                          //widget.colorIndex = index;
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .circular(Dimensions
                                                      .PADDING_SIZE_EXTRA_SMALL),
                                              border: Border.all(
                                                  color: widget.colorIndex ==
                                                          index
                                                      ? Theme.of(context)
                                                          .colorScheme
                                                          .secondary
                                                      : Colors.transparent)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(
                                                Dimensions
                                                    .PADDING_SIZE_EXTRA_SMALL),
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              padding: EdgeInsets.all(Dimensions
                                                  .PADDING_SIZE_EXTRA_SMALL),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Color(
                                                    int.parse(colorString)),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ])
                          : SizedBox(),
                      (widget.productModel?.colors.length ?? 0) > 0
                          ? SizedBox(height: Dimensions.PADDING_SIZE_SMALL)
                          : SizedBox(),
                      widget.productModel?.choiceOptions != null &&
                              widget.productModel!.choiceOptions.length > 0
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  widget.productModel!.choiceOptions.length,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                          '${getTranslated('available', context)}' +
                                              ' ' +
                                              '${widget.productModel!.choiceOptions[index].title} :',
                                          style: titilliumRegular.copyWith(
                                              fontSize:
                                                  Dimensions.FONT_SIZE_LARGE)),
                                      SizedBox(
                                          height: Dimensions
                                              .PADDING_SIZE_EXTRA_SMALL),
                                      // Expanded(
                                      //   child: Padding(
                                      //     padding: const EdgeInsets.all(2.0),
                                      //     child: Container(
                                      //       height: 30,
                                      //       child: ListView.builder(
                                      //         // gridDelegate:
                                      //         //     SliverGridDelegateWithFixedCrossAxisCount(
                                      //         //   crossAxisCount: 6,
                                      //         //   crossAxisSpacing: 5,
                                      //         //   mainAxisSpacing: 5,
                                      //         //   childAspectRatio: (1 / .7),
                                      //         // ),
                                      //         scrollDirection: Axis.horizontal,
                                      //         shrinkWrap: true,
                                      //         // physics:
                                      //         //     NeverScrollableScrollPhysics(),
                                      //         itemCount: widget.productModel
                                      //             .choiceOptions[index]
                                      //             .options
                                      //             .length,
                                      //         itemBuilder: (context, i) {
                                      //           return Container(
                                      //             decoration: BoxDecoration(
                                      //               // border: Border.all(
                                      //               //     width: .3,
                                      //               //     color: Colors.grey),
                                      //               borderRadius:
                                      //                   BorderRadius.circular(5),
                                      //             ),
                                      //             child: Center(
                                      //               child: Text(
                                      //                   widget.productModel
                                      //                       .choiceOptions[index]
                                      //                       .options[i] + "  ",
                                      //                       // .trim(),
                                      //                   // maxLines: 2,
                                      //                   // overflow:
                                      //                   //     TextOverflow.ellipsis,
                                      //                   style: titilliumRegular
                                      //                       .copyWith(
                                      //                     color: Theme.of(context).primaryColor,
                                      //                     fontSize: Dimensions
                                      //                         .FONT_SIZE_DEFAULT,
                                      //                   )),
                                      //             ),
                                      //           );
                                      //         },
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      Wrap(
                                        runSpacing: 5,
                                        alignment: WrapAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: widget.productModel!
                                            .choiceOptions[index].options
                                            .map((e) => SizedBox(
                                                  child: Text(e + "  ",
                                                      style: titilliumRegular
                                                          .copyWith(
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        fontSize: Dimensions
                                                            .FONT_SIZE_DEFAULT,
                                                      )),
                                                ))
                                            .toList(),
                                      )
                                    ]);
                              },
                            )
                          : SizedBox(),
                    ]);
              },
            ),
          )
        : SizedBox();
  }
}
