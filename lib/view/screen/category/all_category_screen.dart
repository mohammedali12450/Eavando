import 'package:flutter/material.dart';
import 'package:flutter_axtro_soft_ecommerce/data/model/response/category.dart';
import 'package:flutter_axtro_soft_ecommerce/localization/language_constrants.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/category_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/splash_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/theme_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/color_resources.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/custom_themes.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/dimensions.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/images.dart';
import 'package:flutter_axtro_soft_ecommerce/view/screen/product/brand_and_category_product_screen.dart';
import 'package:provider/provider.dart';

class AllCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.getIconBg(context),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          getTranslated('CATEGORY', context),
        ),
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back_ios, size: 20, color: ColorResources.WHITE),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          // CustomAppBar(title: getTranslated('CATEGORY', context)),
          Expanded(child: Consumer<CategoryProvider>(
            builder: (context, categoryProvider, child) {
              return categoryProvider.categoryList != null &&
                      categoryProvider.categoryList!.length != 0
                  ? Row(children: [
                      Container(
                        width: 100,
                        margin: EdgeInsets.only(top: 3),
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).highlightColor,
                          boxShadow: [
                            BoxShadow(
                                color: Provider.of<ThemeProvider>(context)
                                        .darkTheme
                                    ? Color(0xFF616161)
                                    : Color(0xFFEEEEEE),
                                spreadRadius: 1,
                                blurRadius: 1)
                          ],
                        ),
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: categoryProvider.categoryList!.length,
                          padding: EdgeInsets.all(0),
                          itemBuilder: (context, index) {
                            Category _category =
                                categoryProvider.categoryList![index];
                            return InkWell(
                              onTap: () => Provider.of<CategoryProvider>(
                                      context,
                                      listen: false)
                                  .changeSelectedIndex(index),
                              child: CategoryItem(
                                title: _category.name ?? "",
                                icon: _category.icon ?? "",
                                isSelected:
                                    categoryProvider.categorySelectedIndex ==
                                        index,
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                          child: ListView.builder(
                        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                        itemCount: categoryProvider
                                .categoryList![
                                    categoryProvider.categorySelectedIndex ?? 0]
                                .subCategories
                                ?.length ??
                            0 + 1,
                        itemBuilder: (context, index) {
                          SubCategory _subCategory = SubCategory();
                          if (index != 0) {
                            _subCategory = categoryProvider
                                .categoryList![
                                    categoryProvider.categorySelectedIndex ?? 0]
                                .subCategories![index - 1];
                          }
                          if (index == 0) {
                            return Ink(
                              color: Theme.of(context).highlightColor,
                              child: ListTile(
                                title: Text(getTranslated('all', context),
                                    style: titilliumSemiBold.copyWith(
                                        color: Theme.of(context).primaryColor),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis),
                                trailing: Icon(
                                  Icons.navigate_next,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          BrandAndCategoryProductScreen(
                                        isBrand: false,
                                        id: categoryProvider
                                            .categoryList![categoryProvider
                                                    .categorySelectedIndex ??
                                                0]
                                            .id
                                            .toString(),
                                        name: categoryProvider
                                                .categoryList![categoryProvider
                                                        .categorySelectedIndex ??
                                                    0]
                                                .name ??
                                            "",
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          } else if (_subCategory.subSubCategories != null &&
                              _subCategory.subSubCategories!.length != 0) {
                            return Ink(
                              color: Theme.of(context).highlightColor,
                              child: Theme(
                                data: Provider.of<ThemeProvider>(context)
                                        .darkTheme
                                    ? ThemeData.dark()
                                    : ThemeData.light(),
                                child: ExpansionTile(
                                  key: Key(
                                      '${Provider.of<CategoryProvider>(context).categorySelectedIndex}$index'),
                                  title: Text(_subCategory.name ?? "",
                                      style: titilliumSemiBold.copyWith(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.color),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis),
                                  children: _getSubSubCategories(
                                      context, _subCategory),
                                ),
                              ),
                            );
                          } else {
                            return Ink(
                              color: Theme.of(context).highlightColor,
                              child: ListTile(
                                title: Text(_subCategory.name ?? "",
                                    style: titilliumSemiBold,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis),
                                trailing: Icon(Icons.navigate_next,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.color),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          BrandAndCategoryProductScreen(
                                        isBrand: false,
                                        id: _subCategory.id.toString(),
                                        name: _subCategory.name ?? "",
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                        },
                      )),
                    ])
                  : Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColor),
                      ),
                    );
            },
          )),
        ],
      ),
    );
  }

  List<Widget> _getSubSubCategories(
      BuildContext context, SubCategory subCategory) {
    List<Widget> _subSubCategories = [];
    _subSubCategories.add(Container(
      color: ColorResources.getIconBg(context),
      margin:
          EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
      child: ListTile(
        title: Row(
          children: [
            Container(
              height: 7,
              width: 7,
              decoration: BoxDecoration(
                  color: ColorResources.getPrimary(context),
                  shape: BoxShape.circle),
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
            Flexible(
                child: Text(
              getTranslated('all', context),
              style: titilliumSemiBold.copyWith(
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BrandAndCategoryProductScreen(
                isBrand: false,
                id: subCategory.id.toString(),
                name: subCategory.name ?? "",
              ),
            ),
          );
        },
      ),
    ));
    for (int index = 0;
        index < (subCategory.subSubCategories?.length ?? 0);
        index++) {
      _subSubCategories.add(Container(
        color: ColorResources.getIconBg(context),
        margin: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
        child: ListTile(
          title: Row(
            children: [
              Container(
                height: 7,
                width: 7,
                decoration: BoxDecoration(
                    color: ColorResources.getPrimary(context),
                    shape: BoxShape.circle),
              ),
              SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
              Flexible(
                  child: Text(
                subCategory.subSubCategories![index].name ?? "",
                style: titilliumSemiBold.copyWith(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BrandAndCategoryProductScreen(
                  isBrand: false,
                  id: subCategory.subSubCategories![index].id.toString(),
                  name: subCategory.subSubCategories![index].name ?? "",
                ),
              ),
            );
          },
        ),
      ));
    }
    return _subSubCategories;
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSelected;
  CategoryItem({
    required this.title,
    required this.icon,
    required this.isSelected,
  });

  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.symmetric(
          vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL,
          horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected ? ColorResources.getPrimary(context) : null,
      ),
      child: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 2,
                  color: isSelected
                      ? Theme.of(context).highlightColor
                      : Theme.of(context).hintColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage.assetNetwork(
                placeholder: Images.placeholder,
                fit: BoxFit.cover,
                image:
                    '${Provider.of<SplashProvider>(context, listen: false).baseUrls?.categoryImageUrl ?? ""}/$icon',
                imageErrorBuilder: (c, o, s) =>
                    Image.asset(Images.placeholder, fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            child: Text(title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: titilliumSemiBold.copyWith(
                  fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                  color: isSelected
                      ? Theme.of(context).highlightColor
                      : Theme.of(context).hintColor,
                )),
          ),
        ]),
      ),
    );
  }
}
