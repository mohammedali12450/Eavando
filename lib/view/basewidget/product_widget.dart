import 'package:flutter/material.dart';
import 'package:flutter_axtro_soft_ecommerce/data/model/response/product_model.dart';
import 'package:flutter_axtro_soft_ecommerce/helper/price_converter.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/splash_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/color_resources.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/custom_themes.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/dimensions.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/images.dart';
import 'package:flutter_axtro_soft_ecommerce/view/basewidget/rating_bar.dart';
import 'package:flutter_axtro_soft_ecommerce/view/screen/product/product_details_screen.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  final Product? productModel;

  ProductWidget({required this.productModel});

  @override
  Widget build(BuildContext context) {
    String ratting = (productModel?.rating?.length ?? 0) != 0
        ? productModel?.rating != null
            ? productModel?.rating![0].average ?? "0"
            : "0"
        : "0";

    /// price
    double _startingPrice = 0;
    if (productModel?.variation?.length != 0) {
      List<double> _priceList = [];
      productModel?.variation
          ?.forEach((variation) => _priceList.add(variation.price ?? 0));
      _priceList.sort((a, b) => a.compareTo(b));
      _startingPrice = _priceList[0];
      if (_priceList[0] < _priceList[_priceList.length - 1]) {}
    } else {
      _startingPrice = productModel?.unitPrice ?? 0;
    }
    var startTotalPrice = ((double.parse(PriceConverter.convertPrice(
              context,
              _startingPrice,
              discount: productModel?.discount ?? 0.0,
              discountType: productModel?.discountType ?? "",
            ).replaceAll(RegExp(r'\s*[₹\€\$\¥\£৳]\s*'), "").replaceAll(',', ''))) *
            (1 + (productModel?.tax ?? 1) / 100))
        .toStringAsFixed(2);

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 1000),
              pageBuilder: (context, anim1, anim2) => ProductDetails(
                  productId: productModel?.id ?? -1,
                  slug: productModel?.slug ?? ""),
            ));
      },
      child: Container(
        height: MediaQuery.of(context).size.width / 1.5,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).highlightColor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5)
          ],
        ),
        child: Stack(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            // Product Image
            Container(
              height: MediaQuery.of(context).size.width / 2.62,
              decoration: BoxDecoration(
                color: ColorResources.getIconBg(context),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: FadeInImage.assetNetwork(
                  placeholder: Images.placeholder,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.width / 2.45,
                  image:
                      '${Provider.of<SplashProvider>(context, listen: false).baseUrls?.productThumbnailUrl}/${productModel?.thumbnail ?? ""}',
                  imageErrorBuilder: (c, o, s) => Image.asset(
                      Images.placeholder_1x1,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.width / 2.45),
                ),
              ),
            ),

            // Product Details
            Padding(
              padding: EdgeInsets.only(
                  top: Dimensions.PADDING_SIZE_SMALL,
                  bottom: 5,
                  left: 5,
                  right: 5),
              child: Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(productModel?.name ?? "",
                          textAlign: TextAlign.center,
                          style: robotoRegular.copyWith(
                              fontSize: Dimensions.FONT_SIZE_SMALL,
                              fontWeight: FontWeight.w400),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RatingBar(
                              rating: double.parse(ratting),
                              size: 18,
                            ),
                            Text(
                                '(${productModel?.reviewCount.toString() ?? ""})',
                                style: robotoRegular.copyWith(
                                  fontSize: Dimensions.FONT_SIZE_SMALL,
                                )),
                          ]),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      (productModel?.discount ?? 0) > 0
                          ? Text(
                              PriceConverter.convertPrice(
                                context,
                                productModel?.unitPrice ?? 0,
                              ),
                              // "€" + startTotalPrice,
                              style: titleRegular.copyWith(
                                color: ColorResources.getRed(context),
                                decoration: TextDecoration.lineThrough,
                                fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                              ),
                            )
                          : SizedBox.shrink(),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        // PriceConverter.convertPrice(context,productModel.unitPrice),
                        "${Provider.of<SplashProvider>(context,listen: false).myCurrency!.symbol}" + startTotalPrice,
                        style: titilliumSemiBold.copyWith(
                            color: ColorResources.getPrimary(context)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),

          // Off

          (productModel?.discount ?? 0) > 0
              ? Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    height: 20,
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    decoration: BoxDecoration(
                      color: ColorResources.getPrimary(context),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text(
                        PriceConverter.percentageCalculation(
                          context,
                          // productModel.unitPrice,
                          double.parse(startTotalPrice),
                          productModel?.discount ?? 0,
                          productModel?.discountType ?? "",
                        ),
                        style: robotoRegular.copyWith(
                            color: Theme.of(context).highlightColor,
                            fontSize: Dimensions.FONT_SIZE_SMALL),
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ]),
      ),
    );
  }
}
