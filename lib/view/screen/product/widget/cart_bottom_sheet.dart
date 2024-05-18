import 'package:flutter/material.dart';
import 'package:flutter_axtro_soft_ecommerce/data/model/response/cart_model.dart';
import 'package:flutter_axtro_soft_ecommerce/data/model/response/product_details_model.dart'
    as pd;
import 'package:flutter_axtro_soft_ecommerce/data/model/response/product_model.dart';
import 'package:flutter_axtro_soft_ecommerce/helper/price_converter.dart';
import 'package:flutter_axtro_soft_ecommerce/localization/language_constrants.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/auth_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/cart_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/product_details_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/seller_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/splash_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/theme/light_theme.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/color_resources.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/custom_themes.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/dimensions.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/images.dart';
import 'package:flutter_axtro_soft_ecommerce/view/basewidget/button/custom_button.dart';
import 'package:flutter_axtro_soft_ecommerce/view/basewidget/show_custom_snakbar.dart';
import 'package:flutter_axtro_soft_ecommerce/view/screen/cart/cart_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class CartBottomSheet extends StatefulWidget {
  final pd.ProductDetailsModel? product;
  final Function? callback;
  CartBottomSheet({this.product, this.callback});

  @override
  _CartBottomSheetState createState() => _CartBottomSheetState();
}

class _CartBottomSheetState extends State<CartBottomSheet> {
  route(bool isRoute, String message) async {
    if (isRoute) {
      showCustomSnackBar(message, context, isError: false);
      Navigator.pop(context);
    } else {
      Navigator.pop(context);
      showCustomSnackBar(message, context);
    }
  }

  @override
  void initState() {
    Provider.of<ProductDetailsProvider>(context, listen: false)
        .initData(widget.product, widget.product?.minimumOrderQty, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
          decoration: BoxDecoration(
            color: Theme.of(context).highlightColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: Consumer<ProductDetailsProvider>(
            builder: (ctx, details, child) {
              Variation _variation = Variation.fromJson(const {});
              String? _variantName = widget.product?.colors?.length != 0 &&
                      details.variantIndex != null
                  ? (widget.product?.colors?[details.variantIndex!].name ?? "")
                  : null;
              List<String> _variationList = [];
              for (int index = 0;
                  index < (widget.product?.choiceOptions?.length ?? 0);
                  index++) {
                _variationList.add(widget.product?.choiceOptions?[index]
                        .options?[details.variationIndex[index]]
                        .trim() ??
                    "");
              }
              String variationType = '';
              if (_variantName != null) {
                variationType = _variantName;
                _variationList.forEach(
                    (variation) => variationType = '$variationType-$variation');
              } else {
                bool isFirst = true;
                _variationList.forEach((variation) {
                  if (isFirst) {
                    variationType = '$variationType$variation';
                    isFirst = false;
                  } else {
                    variationType = '$variationType-$variation';
                  }
                });
              }
              double _startingPrice = 0;
              if (widget.product?.variation != null &&
                  widget.product?.variation?.length != 0) {
                List<double> _priceList = [];
                widget.product?.variation?.forEach(
                    (variation) => _priceList.add(variation.price ?? 0.0));
                _priceList.sort((a, b) => a.compareTo(b));
                _startingPrice = _priceList[0];
                if (_priceList[0] < _priceList[_priceList.length - 1]) {}
              } else {
                _startingPrice = widget.product?.unitPrice ?? 0.0;
              }
              var startTotalPrice = ((double.parse(PriceConverter.convertPrice(
                        context,
                        _startingPrice,
                        discount: widget.product?.discount ?? 0.0,
                        discountType: widget.product?.discountType ?? "",
                      ).replaceAll(RegExp(r'\s*[₹\€\$\¥\£৳]\s*'), "").replaceAll(',', ''))) *
                      (1 + (widget.product?.tax ?? 1) / 100))
                  .toStringAsFixed(2);
              // print(startTotalPrice);

              double price = widget.product?.unitPrice ?? 0.0;
              print(price);
              int _stock = widget.product?.currentStock ?? 0;
              variationType = variationType.replaceAll(' ', '');
              for (Variation variation in widget.product?.variation ?? []) {
                if (variation.type == variationType) {
                  // print(price);
                  price = variation.price ?? 0.0;
                  _variation = variation;
                  _stock = variation.qty ?? 0;
                  break;
                }
              }
              double priceWithDiscount = PriceConverter.convertWithDiscount(
                context,
                price,
                widget.product?.discount ?? 0.0,
                widget.product?.discountType ?? "",
              );
              // print(priceWithDiscount);
              double priceWithQuantity = priceWithDiscount * details.quantity;

              double total = 0, avg = 0;
              widget.product?.reviews?.forEach((review) {
                total += review.rating ?? 0;
              });
              avg = total / (widget.product?.reviews?.length ?? 1);
              print('avarage=>$avg');

              String ratting = widget.product?.reviews != null &&
                      widget.product?.reviews?.length != 0
                  ? avg.toString()
                  : "0";

              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Close Button
                    Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorResources.getRed(context),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context).hintColor,
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                  )
                                ]),
                            child: Icon(
                              Icons.clear,
                              size: Dimensions.ICON_SIZE_SMALL,
                              color: Colors.white,
                            ),
                          ),
                        )),

                    // Product details
                    Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    color: ColorResources.getImageBg(context),
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: .5,
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(.20))),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: Images.placeholder,
                                    image:
                                        '${Provider.of<SplashProvider>(context, listen: false).baseUrls?.productThumbnailUrl ?? ""}/${widget.product?.thumbnail ?? ""}',
                                    imageErrorBuilder: (c, o, s) =>
                                        Image.asset(Images.placeholder),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(widget.product?.name ?? '',
                                          style: titilliumRegular.copyWith(
                                              fontSize:
                                                  Dimensions.FONT_SIZE_LARGE),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis),
                                      SizedBox(
                                          height:
                                              Dimensions.PADDING_SIZE_SMALL),
                                      Row(
                                        children: [
                                          Icon(Icons.star,
                                              color: Colors.orange),
                                          Text(
                                              double.parse(ratting)
                                                  .toStringAsFixed(1),
                                              style: titilliumSemiBold.copyWith(
                                                  fontSize: Dimensions
                                                      .FONT_SIZE_LARGE),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis),
                                        ],
                                      ),
                                    ]),
                              ),
                            ]),
                        Row(
                          children: [
                            (widget.product?.discount ?? 0) > 0
                                ? Container(
                                    margin: EdgeInsets.only(
                                        top: Dimensions
                                            .PADDING_SIZE_EXTRA_SMALL),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Dimensions
                                            .PADDING_SIZE_EXTRA_SMALL),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: ColorResources.getRed(context),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        PriceConverter.percentageCalculation(
                                          context,
                                          double.parse(startTotalPrice),
                                          widget.product?.discount ?? 0.0,
                                          widget.product?.discountType ?? "",
                                        ),
                                        style: titilliumRegular.copyWith(
                                            color: Theme.of(context).cardColor,
                                            fontSize:
                                                Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    ),
                                  )
                                : SizedBox(width: 93),
                            SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${Provider.of<SplashProvider>(context,listen: false).myCurrency!.symbol}" + startTotalPrice,
                                      // PriceConverter.convertPrice(context, widget.product.unitPrice, discountType: widget.product.discountType, discount: widget.product.discount),
                                      style: titilliumRegular.copyWith(
                                          color: ColorResources.getPrimary(
                                              context),
                                          fontSize:
                                              Dimensions.FONT_SIZE_EXTRA_LARGE),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                        '${getTranslated('included_vat', context)}',
                                        style: titilliumRegular.copyWith(
                                          color: Theme.of(context)
                                                  .buttonTheme
                                                  .colorScheme
                                                  ?.primary ??
                                              primaryColor,
                                          fontSize: Dimensions.FONT_SIZE_SMALL,
                                        )),
                                  ],
                                ),
                                (widget.product?.discount ?? 0) > 0
                                    ? Padding(
                                        padding: const EdgeInsets.only(top: 3),
                                        child: Text(
                                          "${Provider.of<SplashProvider>(context,listen: false).myCurrency!.symbol}" + startTotalPrice,
                                          // PriceConverter.convertPrice(context, widget.product.unitPrice),
                                          style: titilliumRegular.copyWith(
                                              color: ColorResources.getRed(
                                                  context),
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                      )
                                    : SizedBox(),
                              ],
                            ),
                            // SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                    // Variant
                    (widget.product?.colors?.length ?? 0) > 0
                        ? Row(children: [
                            Text(
                                '${getTranslated('select_variant', context)} : ',
                                style: titilliumRegular.copyWith(
                                    fontSize: Dimensions.FONT_SIZE_DEFAULT)),
                            SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),
                            Expanded(
                              child: SizedBox(
                                height: 40,
                                child: ListView.builder(
                                  itemCount:
                                      widget.product?.colors?.length ?? 0,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (ctx, index) {
                                    String colorString = '0xff' +
                                        (widget.product!.colors?[index].code
                                                ?.substring(1, 7) ??
                                            "");
                                    return InkWell(
                                      onTap: () {
                                        Provider.of<ProductDetailsProvider>(
                                                context,
                                                listen: false)
                                            .setCartVariantIndex(
                                          widget.product?.minimumOrderQty ?? 0,
                                          index,
                                          context,
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions
                                                    .PADDING_SIZE_EXTRA_SMALL),
                                            border:
                                                details.variantIndex == index
                                                    ? Border.all(
                                                        width: 1,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary)
                                                    : null),
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                              Dimensions
                                                  .PADDING_SIZE_EXTRA_SMALL),
                                          child: Container(
                                            height: Dimensions.topSpace,
                                            width: Dimensions.topSpace,
                                            padding: EdgeInsets.all(Dimensions
                                                .PADDING_SIZE_EXTRA_SMALL),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color:
                                                  Color(int.parse(colorString)),
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
                    (widget.product?.colors?.length ?? 0) > 0
                        ? SizedBox(height: Dimensions.PADDING_SIZE_SMALL)
                        : SizedBox(),

                    // Variation
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.product?.choiceOptions?.length ?? 0,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, index) {
                        return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                  '${getTranslated('available', context)} ' +
                                      ' ' +
                                      '${widget.product?.choiceOptions?[index].title ?? ""} : ',
                                  style: titilliumRegular.copyWith(
                                      fontSize: Dimensions.FONT_SIZE_DEFAULT)),
                              SizedBox(
                                  width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    height: 25,
                                    child: ListView.builder(
                                      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      //   crossAxisCount: 4,
                                      //   crossAxisSpacing: 5,
                                      //   mainAxisSpacing: 5,
                                      //   childAspectRatio: (1 / .7),
                                      // ),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      // physics: NeverScrollableScrollPhysics(),
                                      itemCount: widget
                                              .product
                                              ?.choiceOptions?[index]
                                              .options
                                              ?.length ??
                                          0,
                                      itemBuilder: (ctx, i) {
                                        return InkWell(
                                          onTap: () => Provider.of<
                                                      ProductDetailsProvider>(
                                                  context,
                                                  listen: false)
                                              .setCartVariationIndex(
                                                  widget.product
                                                          ?.minimumOrderQty ??
                                                      0,
                                                  index,
                                                  i,
                                                  context),
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 3),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 3),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              // border: details.variationIndex[index] != i ?  null :
                                              // Border.all(color: Theme.of(context).primaryColor,),
                                              border: details.variationIndex[
                                                          index] ==
                                                      i
                                                  ? null
                                                  : Border.all(
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                    ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                  widget
                                                          .product
                                                          ?.choiceOptions?[
                                                              index]
                                                          .options?[i] ??
                                                      "" + "  ",
                                                  // .trim(), maxLines: 1,
                                                  // overflow: TextOverflow.ellipsis,
                                                  style:
                                                      titilliumRegular.copyWith(
                                                    fontSize: Dimensions
                                                        .FONT_SIZE_DEFAULT,
                                                    // color: details.variationIndex[index] != i ?
                                                    // ColorResources.getTextTitle(context) : Theme.of(context).primaryColor,
                                                    color:
                                                        details.variationIndex[
                                                                    index] ==
                                                                i
                                                            ? Theme.of(context)
                                                                .colorScheme
                                                                .primary
                                                            : ColorResources
                                                                .getTextTitle(
                                                                    context),
                                                  )),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ]);
                      },
                    ),
                    SizedBox(
                      height: Dimensions.PADDING_SIZE_SMALL,
                    ),

                    // Quantity
                    Row(children: [
                      Text(getTranslated('quantity', context),
                          style: robotoBold),
                      QuantityButton(
                        isIncrement: false,
                        quantity: details.quantity,
                        stock: _stock,
                        minimumOrderQuantity:
                            widget.product?.minimumOrderQty ?? 0,
                        digitalProduct:
                            widget.product?.productType == "digital",
                      ),
                      Text(details.quantity.toString(),
                          style: titilliumSemiBold),
                      QuantityButton(
                          isIncrement: true,
                          quantity: details.quantity,
                          stock: _stock,
                          minimumOrderQuantity:
                              widget.product?.minimumOrderQty ?? 0,
                          digitalProduct:
                              widget.product?.productType == "digital"),
                    ]),
                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(getTranslated('total_price', context),
                          style: robotoBold),
                      SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                      Text(
                        PriceConverter.convertPrice(
                            context,
                            double.parse((priceWithQuantity *
                                    (1 + (widget.product?.tax ?? 1) / 100))
                                .toStringAsFixed(2))),
                        style: titilliumBold.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: Dimensions.FONT_SIZE_LARGE),
                      ),
                    ]),
                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                    Row(
                      children: [
                        Provider.of<CartProvider>(context).addToCartLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                    Theme.of(context).primaryColor,
                                  ),
                                ),
                              )
                            : Expanded(
                                child: CustomButton(
                                    buttonText: getTranslated(
                                        _stock <
                                                    (widget.product
                                                            ?.minimumOrderQty ??
                                                        0) &&
                                                widget.product?.productType ==
                                                    "physical"
                                            ? 'out_of_stock'
                                            : 'add_to_cart',
                                        context),
                                    onTap: _stock <
                                                (widget.product
                                                        ?.minimumOrderQty ??
                                                    0) &&
                                            widget.product?.productType ==
                                                "physical"
                                        ? null
                                        : () {
                                            if (_stock >=
                                                    (widget.product
                                                            ?.minimumOrderQty ??
                                                        0) ||
                                                widget.product?.productType ==
                                                    "digital") {
                                              CartModel cart = CartModel(
                                                id: widget.product?.id ?? -1,
                                                productId:
                                                    widget.product?.id ?? -1,
                                                thumbnail:
                                                    widget.product?.thumbnail ??
                                                        "",
                                                sellerId: -1,
                                                sellerIs: "",
                                                image: "",
                                                name:
                                                    widget.product?.name ?? "",
                                                seller: widget
                                                            .product?.addedBy ==
                                                        'seller'
                                                    ? '${Provider.of<SellerProvider>(context, listen: false).sellerModel?.seller?.fName ?? ""} '
                                                        '${Provider.of<SellerProvider>(context, listen: false).sellerModel?.seller?.lName ?? ""}'
                                                    : 'admin',
                                                price: double.parse(
                                                    startTotalPrice),
                                                discountedPrice:
                                                    priceWithDiscount,
                                                quantity: details.quantity,
                                                maxQuantity: _stock,
                                                color: (widget.product?.colors
                                                                    ?.length ??
                                                                0) >
                                                            0 &&
                                                        details.variantIndex !=
                                                            null
                                                    ? (widget
                                                            .product
                                                            ?.colors?[details
                                                                .variantIndex!]
                                                            .name ??
                                                        "")
                                                    : '',
                                                variant: (widget.product?.colors
                                                                    ?.length ??
                                                                0) >
                                                            0 &&
                                                        details.variantIndex !=
                                                            null
                                                    ? (widget
                                                            .product
                                                            ?.colors?[details
                                                                .variantIndex!]
                                                            .name ??
                                                        "")
                                                    : '',
                                                variation: _variation,
                                                discount:
                                                    widget.product?.discount ??
                                                        0.0,
                                                discountType: widget.product
                                                        ?.discountType ??
                                                    "",
                                                tax: widget.product?.tax ?? 0.0,
                                                taxType:
                                                    widget.product?.taxType ??
                                                        "",
                                                shippingMethodId: 1,
                                                shippingType: "",
                                                cartGroupId: widget
                                                        .product?.userId
                                                        .toString() ??
                                                    "-1",
                                                shopInfo: '',
                                                productInfo:
                                                    ProductInfo.fromJson(
                                                        const {}),
                                                choiceOptions: widget.product
                                                        ?.choiceOptions ??
                                                    [],
                                                variationIndexes: Provider.of<
                                                            ProductDetailsProvider>(
                                                        context,
                                                        listen: false)
                                                    .variationIndex,
                                                shippingCost: widget.product
                                                            ?.multiplyQty ==
                                                        1
                                                    ? (widget.product
                                                                ?.shippingCost ??
                                                            0) *
                                                        details.quantity
                                                    : widget.product
                                                            ?.shippingCost ??
                                                        0,
                                                minimumOrderQuantity: widget
                                                        .product
                                                        ?.minimumOrderQty ??
                                                    0,
                                                productType: widget
                                                        .product?.productType ??
                                                    "",
                                                slug:
                                                    widget.product?.slug ?? "",
                                              );

                                              // cart.variations = _variation;
                                              if (Provider.of<AuthProvider>(
                                                      context,
                                                      listen: false)
                                                  .isLoggedIn()) {
                                                Provider.of<CartProvider>(
                                                        context,
                                                        listen: false)
                                                    .addToCartAPI(
                                                  cart,
                                                  route,
                                                  context,
                                                  widget.product
                                                          ?.choiceOptions ??
                                                      [],
                                                  Provider.of<ProductDetailsProvider>(
                                                          context,
                                                          listen: false)
                                                      .variationIndex,
                                                );
                                              } else {
                                                Provider.of<CartProvider>(
                                                        context,
                                                        listen: false)
                                                    .addToCart(cart);
                                                Navigator.pop(context);
                                                showCustomSnackBar(
                                                    getTranslated(
                                                        'added_to_cart',
                                                        context),
                                                    context,
                                                    isError: false);
                                              }
                                            }
                                          }),
                              ),
                        SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),
                        Provider.of<CartProvider>(context, listen: false)
                                .addToCartLoading
                            ? SizedBox()
                            : Expanded(
                                child: CustomButton(
                                    isBuy: true,
                                    buttonText: getTranslated(
                                        _stock <
                                                    (widget.product
                                                            ?.minimumOrderQty ??
                                                        0) &&
                                                widget.product?.productType ==
                                                    "physical"
                                            ? 'out_of_stock'
                                            : 'buy_now',
                                        context),
                                    onTap: _stock <
                                                (widget.product
                                                        ?.minimumOrderQty ??
                                                    0) &&
                                            widget.product?.productType ==
                                                "physical"
                                        ? null
                                        : () {
                                            if (_stock >=
                                                    (widget.product
                                                            ?.minimumOrderQty ??
                                                        0) ||
                                                widget.product?.productType ==
                                                    "digital") {
                                              CartModel cart = CartModel(
                                                id: widget.product?.id ?? -1,
                                                productId:
                                                    widget.product?.id ?? -1,
                                                sellerId: -1,
                                                sellerIs: "",
                                                image: "",
                                                thumbnail:
                                                    widget.product?.thumbnail ??
                                                        "",
                                                name:
                                                    widget.product?.name ?? "",
                                                seller: widget
                                                            .product?.addedBy ==
                                                        'seller'
                                                    ? '${Provider.of<SellerProvider>(context, listen: false).sellerModel?.seller?.fName ?? ""} '
                                                        '${Provider.of<SellerProvider>(context, listen: false).sellerModel?.seller?.lName ?? ""}'
                                                    : 'admin',
                                                price: double.parse(
                                                    startTotalPrice),
                                                discountedPrice:
                                                    priceWithDiscount,
                                                quantity: details.quantity,
                                                maxQuantity: _stock,
                                                variant: (widget.product?.colors
                                                                    ?.length ??
                                                                0) >
                                                            0 &&
                                                        details.variantIndex !=
                                                            null
                                                    ? (widget
                                                            .product
                                                            ?.colors?[details
                                                                .variantIndex!]
                                                            .name ??
                                                        "")
                                                    : '',
                                                color: (widget.product?.colors
                                                                    ?.length ??
                                                                0) >
                                                            0 &&
                                                        details.variantIndex !=
                                                            null
                                                    ? (widget
                                                            .product
                                                            ?.colors?[details
                                                                .variantIndex!]
                                                            .code ??
                                                        "")
                                                    : '',
                                                variation: _variation,
                                                discount:
                                                    widget.product?.discount ??
                                                        0.0,
                                                discountType: widget.product
                                                        ?.discountType ??
                                                    "",
                                                tax: widget.product?.tax ?? 0.0,
                                                taxType:
                                                    widget.product?.taxType ??
                                                        "",
                                                shippingMethodId: 1,
                                                cartGroupId: widget
                                                        .product?.userId
                                                        .toString() ??
                                                    "-1",
                                                shopInfo: '',
                                                shippingType: '',
                                                productInfo:
                                                    ProductInfo.fromJson({}),
                                                choiceOptions: widget.product
                                                        ?.choiceOptions ??
                                                    [],
                                                variationIndexes: Provider.of<
                                                            ProductDetailsProvider>(
                                                        context,
                                                        listen: false)
                                                    .variationIndex,
                                                shippingCost: widget.product
                                                            ?.multiplyQty ==
                                                        1
                                                    ? (widget.product
                                                                ?.shippingCost ??
                                                            0) *
                                                        details.quantity
                                                    : (widget.product
                                                            ?.shippingCost ??
                                                        0),
                                                minimumOrderQuantity: widget
                                                        .product
                                                        ?.minimumOrderQty ??
                                                    0,
                                                productType: widget
                                                        .product?.productType ??
                                                    "",
                                                slug:
                                                    widget.product?.slug ?? "",
                                              );

                                              // cart.variations = _variation;
                                              if (Provider.of<AuthProvider>(
                                                      context,
                                                      listen: false)
                                                  .isLoggedIn()) {
                                                Provider.of<CartProvider>(
                                                        context,
                                                        listen: false)
                                                    .addToCartAPI(
                                                  cart,
                                                  route,
                                                  context,
                                                  widget.product
                                                          ?.choiceOptions ??
                                                      [],
                                                  Provider.of<ProductDetailsProvider>(
                                                          context,
                                                          listen: false)
                                                      .variationIndex,
                                                )
                                                    .then((value) {
                                                  if (value.response!
                                                          .statusCode ==
                                                      200) {
                                                    _navigateToNextScreen(
                                                        context);
                                                  }
                                                });
                                              } else {
                                                Fluttertoast.showToast(
                                                    msg: 'You are not loggedIn',
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.CENTER,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        Theme.of(context)
                                                            .primaryColor,
                                                    textColor: Theme.of(context)
                                                        .cardColor,
                                                    fontSize: 16.0);
                                              }
                                            }
                                          }),
                              ),
                      ],
                    ),
                  ]);
            },
          ),
        ),
      ],
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CartScreen()));
  }
}

class QuantityButton extends StatelessWidget {
  final bool isIncrement;
  final int quantity;
  final bool isCartWidget;
  final int stock;
  final int minimumOrderQuantity;
  final bool digitalProduct;

  QuantityButton({
    required this.isIncrement,
    required this.quantity,
    required this.stock,
    this.isCartWidget = false,
    required this.minimumOrderQuantity,
    required this.digitalProduct,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (!isIncrement && quantity > 1) {
          if (quantity > minimumOrderQuantity) {
            Provider.of<ProductDetailsProvider>(context, listen: false)
                .setQuantity(quantity - 1);
          } else {
            Fluttertoast.showToast(
                msg:
                    '${getTranslated('minimum_quantity_is', context)}$minimumOrderQuantity',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        } else if (isIncrement && quantity < stock || digitalProduct) {
          Provider.of<ProductDetailsProvider>(context, listen: false)
              .setQuantity(quantity + 1);
        }
      },
      icon: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border:
                Border.all(width: 1, color: Theme.of(context).primaryColor)),
        child: Icon(
          isIncrement ? Icons.add : Icons.remove,
          color: isIncrement
              ? quantity >= stock && !digitalProduct
                  ? ColorResources.getLowGreen(context)
                  : ColorResources.getPrimary(context)
              : quantity > 1
                  ? ColorResources.getPrimary(context)
                  : ColorResources.getTextTitle(context),
          size: isCartWidget ? 26 : 20,
        ),
      ),
    );
  }
}
