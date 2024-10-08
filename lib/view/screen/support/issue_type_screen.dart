import 'package:flutter/material.dart';
import 'package:flutter_axtro_soft_ecommerce/localization/language_constrants.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/custom_themes.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/dimensions.dart';
import 'package:flutter_axtro_soft_ecommerce/view/basewidget/custom_expanded_app_bar.dart';
import 'package:flutter_axtro_soft_ecommerce/view/screen/support/add_ticket_screen.dart';

class IssueTypeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> issueTypeList = [
      'Website Problem',
      'Partner request',
      'Complaint',
      'Info inquiry'
    ];

    return CustomExpandedAppBar(
      title: getTranslated('support_ticket', context),
      isGuestCheck: true,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(
              top: Dimensions.PADDING_SIZE_LARGE,
              left: Dimensions.PADDING_SIZE_LARGE),
          child: Text(getTranslated('add_new_ticket', context),
              style: titilliumSemiBold.copyWith(
                  fontSize: 20, color: Theme.of(context).primaryColor)),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: Dimensions.PADDING_SIZE_LARGE,
              bottom: Dimensions.PADDING_SIZE_LARGE),
          child: Text(getTranslated('select_your_category', context),
              style: titilliumRegular.copyWith(
                  color: Theme.of(context).colorScheme.secondary)),
        ),
        Expanded(
            child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_LARGE,
              vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
          itemCount: issueTypeList.length,
          itemBuilder: (context, index) {
            return Container(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              margin: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL),
              child: ListTile(
                leading: Icon(Icons.query_builder,
                    color: Theme.of(context).colorScheme.secondary),
                title: Text(issueTypeList[index],
                    style: robotoBold.copyWith(
                        color: Theme.of(context).primaryColor)),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              AddTicketScreen(type: issueTypeList[index])));
                },
              ),
            );
          },
        )),
      ]),
    );
  }
}
