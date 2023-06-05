import 'package:flutter/material.dart';
import 'package:flutter_axtro_soft_ecommerce/data/model/response/support_ticket_model.dart';
import 'package:flutter_axtro_soft_ecommerce/helper/date_converter.dart';

import 'package:flutter_axtro_soft_ecommerce/localization/language_constrants.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/auth_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/support_ticket_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/theme/light_theme.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/color_resources.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/custom_themes.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/dimensions.dart';
import 'package:flutter_axtro_soft_ecommerce/view/basewidget/custom_expanded_app_bar.dart';
import 'package:flutter_axtro_soft_ecommerce/view/basewidget/no_internet_screen.dart';
import 'package:flutter_axtro_soft_ecommerce/view/screen/support/support_conversation_screen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'issue_type_screen.dart';

// ignore: must_be_immutable
class SupportTicketScreen extends StatelessWidget {
  bool first = true;
  @override
  Widget build(BuildContext context) {
    if (first) {
      first = false;
      if (Provider.of<AuthProvider>(context, listen: false).isLoggedIn()) {
        Provider.of<SupportTicketProvider>(context, listen: false)
            .getSupportTicketList(context);
      }
    }

    return CustomExpandedAppBar(
      title: getTranslated('support_ticket', context),
      isGuestCheck: true,
      bottomChild: InkWell(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => IssueTypeScreen())),
        child: Material(
          color: ColorResources.getYellow(context).withOpacity(0.6),
          elevation: 5,
          borderRadius: BorderRadius.circular(50),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Container(
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
              decoration: BoxDecoration(
                color: ColorResources.getYellow(context),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add, color: Colors.white, size: 35),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_DEFAULT),
              child: Text(getTranslated('new_ticket', context),
                  style: titilliumSemiBold.copyWith(
                      color: Colors.white,
                      fontSize: Dimensions.FONT_SIZE_LARGE)),
            ),
          ]),
        ),
      ),
      child: Provider.of<SupportTicketProvider>(context).supportTicketList !=
              null
          ? (Provider.of<SupportTicketProvider>(context)
                          .supportTicketList
                          ?.length ??
                      0) !=
                  0
              ? Consumer<SupportTicketProvider>(
                  builder: (context, support, child) {
                    List<SupportTicketModel> supportTicketList =
                        support.supportTicketList?.reversed.toList() ?? [];
                    return RefreshIndicator(
                      backgroundColor: Theme.of(context).primaryColor,
                      onRefresh: () async {
                        await support.getSupportTicketList(context);
                      },
                      child: ListView.builder(
                        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                        itemCount: supportTicketList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => SupportConversationScreen(
                                          supportTicketModel:
                                              supportTicketList[index],
                                        ))),
                            child: Container(
                              padding:
                                  EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                              margin: EdgeInsets.only(
                                  bottom: Dimensions.PADDING_SIZE_SMALL),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    width: 1),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Place date: ${DateConverter.localDateToIsoStringAMPM(DateTime.parse(supportTicketList[index].createdAt))}',
                                      style: titilliumRegular.copyWith(
                                          fontSize: Dimensions.FONT_SIZE_SMALL),
                                    ),
                                    Text(supportTicketList[index].subject,
                                        style: titilliumSemiBold),
                                    Row(children: [
                                      Icon(Icons.notifications,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          size: 20),
                                      SizedBox(
                                          width: Dimensions.PADDING_SIZE_SMALL),
                                      Expanded(
                                          child: Text(
                                              supportTicketList[index].type,
                                              style: titilliumSemiBold)),
                                      TextButton(
                                        onPressed: null,
                                        style: TextButton.styleFrom(
                                          backgroundColor: supportTicketList[
                                                          index]
                                                      .status ==
                                                  'open'
                                              ? ColorResources.getGreen(context)
                                              // ignore: deprecated_member_use
                                              : Theme.of(context)
                                                      .buttonTheme
                                                      .colorScheme
                                                      ?.primary ??
                                                  primaryColor,
                                        ),
                                        child: Text(
                                          supportTicketList[index].status ==
                                                  'pending'
                                              ? getTranslated(
                                                  'pending', context)
                                              : getTranslated(
                                                  'solved', context),
                                          style: titilliumSemiBold.copyWith(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ]),
                                  ]),
                            ),
                          );
                        },
                      ),
                    );
                  },
                )
              : NoInternetOrDataScreen(isNoInternet: false)
          : SupportTicketShimmer(),
    );
  }
}

class SupportTicketShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
          margin: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL),
          decoration: BoxDecoration(
            color: ColorResources.IMAGE_BG,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorResources.SELLER_TXT, width: 2),
          ),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.5),
            highlightColor: Colors.grey.withOpacity(0.2),
            enabled:
                Provider.of<SupportTicketProvider>(context).supportTicketList ==
                    null,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(height: 10, width: 100, color: ColorResources.WHITE),
              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
              Container(height: 15, color: ColorResources.WHITE),
              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
              Row(children: [
                Container(height: 15, width: 15, color: ColorResources.WHITE),
                SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                Container(height: 15, width: 50, color: ColorResources.WHITE),
                Expanded(child: SizedBox.shrink()),
                Container(height: 30, width: 70, color: ColorResources.WHITE),
              ]),
            ]),
          ),
        );
      },
    );
  }
}
