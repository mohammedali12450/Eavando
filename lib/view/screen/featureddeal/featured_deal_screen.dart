import 'package:flutter/material.dart';

import 'package:flutter_axtro_soft_ecommerce/localization/language_constrants.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/featured_deal_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/dimensions.dart';
import 'package:flutter_axtro_soft_ecommerce/view/basewidget/custom_app_bar.dart';
import 'package:flutter_axtro_soft_ecommerce/view/screen/home/widget/featured_deal_view.dart';
import 'package:provider/provider.dart';

class FeaturedDealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Column(children: [

        CustomAppBar(title: getTranslated('featured_deals', context)),

        Expanded(child: RefreshIndicator(
          backgroundColor: Theme.of(context).primaryColor,
          onRefresh: () async {
            await Provider.of<FeaturedDealProvider>(context, listen: false).getFeaturedDealList(true, context);
          },
          child: Padding(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
            child: FeaturedDealsView(isHomePage: false),
          ),
        )),

      ]),
    );
  }
}
