import 'package:flutter/material.dart';
import 'package:flutter_axtro_soft_ecommerce/data/model/response/product_details_model.dart'  as pd;
import 'package:flutter_axtro_soft_ecommerce/helper/price_converter.dart';
import 'package:flutter_axtro_soft_ecommerce/localization/language_constrants.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/product_details_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/splash_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/theme_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/wishlist_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/color_resources.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/custom_themes.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/dimensions.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/images.dart';
import 'package:flutter_axtro_soft_ecommerce/view/screen/product/product_image_screen.dart';
import 'package:flutter_axtro_soft_ecommerce/view/screen/product/widget/favourite_button.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class ProductImageView extends StatefulWidget {
  final pd.ProductDetailsModel productModel;
   String indexColor;
  ProductImageView({@required this.productModel,@required this.indexColor});

  @override
  State<ProductImageView> createState() => _ProductImageViewState();
}

class _ProductImageViewState extends State<ProductImageView> {
  final PageController _controller = PageController();

   List<dynamic> imagesForIndex;

   //int imagesIndex=0;

   @override
  void initState() {
     super.initState();
    if(widget.productModel.imagesWithOutColor!=null&&widget.productModel.imagesWithOutColor.length!=0){
      imagesForIndex=widget.productModel.imagesWithOutColor;
    }else {
      // widget.productModel.imagesWithColor.map((key, value) {
      //   print(value.toString());
      // });
      imagesForIndex=widget.productModel.imagesWithColor[widget.indexColor];
    }


  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // productModel.images !=null ?
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>
                ProductImageScreen(title: getTranslated('product_image', context),imageList: imagesForIndex)));
            },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              boxShadow: [BoxShadow(color: Colors.grey[Provider.of<ThemeProvider>(context).darkTheme ? 700 : 300],
                  spreadRadius: 1, blurRadius: 5)],
              gradient: Provider.of<ThemeProvider>(context).darkTheme ? null : LinearGradient(
                colors: [ColorResources.WHITE, ColorResources.IMAGE_BG],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(children: [
              SizedBox(
                height: MediaQuery.of(context).size.width,
                child: imagesForIndex != null?

                PageView.builder(
                  controller: _controller,
                  itemCount: imagesForIndex.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: FadeInImage.assetNetwork(fit: BoxFit.cover,
                        placeholder: Images.placeholder, height: MediaQuery.of(context).size.width,
                        width: MediaQuery.of(context).size.width,
                        image: '${Provider.of<SplashProvider>(context,listen: true).baseUrls.productImageUrl}/${widget.indexColor}/${imagesForIndex[index]}',
                        imageErrorBuilder: (c, o, s) => Image.asset(
                          Images.placeholder, height: MediaQuery.of(context).size.width,
                          width: MediaQuery.of(context).size.width,fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  onPageChanged: (index) {
                    Provider.of<ProductDetailsProvider>(context, listen: false).setImageSliderSelectedIndex(index);
                  },
                ):SizedBox(),
              ),


              Positioned(left: 0, right: 0, bottom: 30,
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(),
                    Spacer(),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: _indicators(context),
                    ),
                    Spacer(),


                    Provider.of<ProductDetailsProvider>(context).imageSliderIndex != null?
                    Padding(
                      padding: const EdgeInsets.only(right: Dimensions.PADDING_SIZE_DEFAULT,/*bottom: Dimensions.PADDING_SIZE_DEFAULT*/),
                      child: Text('${Provider.of<ProductDetailsProvider>(context).imageSliderIndex+1}'+'/'+'${imagesForIndex.length.toString()}'),
                    ):SizedBox(),
                  ],
                ),
              ),
              Positioned(top: 16, right: 16,
                child: Column(
                  children: [
                    FavouriteButton(
                      backgroundColor: ColorResources.getImageBg(context),
                      favColor: Colors.redAccent,
                      isSelected: Provider.of<WishListProvider>(context,listen: false).isWish,
                      productId: widget.productModel.id,
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),


                    InkWell(
                      onTap: () {
                        if(Provider.of<ProductDetailsProvider>(context, listen: false).sharableLink != null) {
                          Share.share(Provider.of<ProductDetailsProvider>(context, listen: false).sharableLink);
                        }
                      },
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                        child: Container(width: 30, height: 30,
                          decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.share, color: Theme.of(context).cardColor, size: Dimensions.ICON_SIZE_SMALL),
                        ),
                      ),
                    )
                  ],
                ),
              ),


              widget.productModel.unitPrice !=null && widget.productModel.discount != 0 ?
              Positioned(
                left: 0,top: 0,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColorResources.getRed(context),
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(Dimensions.PADDING_SIZE_SMALL))
                      ),
                      child: Text('${PriceConverter.percentageCalculation(context, widget.productModel.unitPrice,
                          widget.productModel.discount, widget.productModel.discountType)}',
                        style: titilliumRegular.copyWith(color: Theme.of(context).cardColor, fontSize: Dimensions.FONT_SIZE_LARGE),
                      ),
                    ),

                  ],
                ),
              ) : SizedBox.shrink(),
              SizedBox.shrink(),


            ]),
          ),
        )/*:SizedBox()*/,

      ],
    );
  }

  List<Widget> _indicators(BuildContext context) {
    List<Widget> indicators = [];
    for (int index = 0; index < imagesForIndex.length; index++) {
      indicators.add(TabPageSelectorIndicator(
        backgroundColor: index == Provider.of<ProductDetailsProvider>(context).imageSliderIndex ?
        Theme.of(context).colorScheme.primary : ColorResources.WHITE,
        borderColor: ColorResources.WHITE,
        size: 10,
      ));
    }
    return indicators;
  }
}
