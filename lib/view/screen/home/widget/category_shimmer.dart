import 'package:flutter/material.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/category_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/theme_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/color_resources.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: (1 / 1),
      ),
      itemCount: 8,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Provider.of<ThemeProvider>(context).darkTheme
                    ? Color(0xFF616161)
                    : Color(0xFFEEEEEE),
                spreadRadius: 2,
                blurRadius: 5)
          ]),
          margin: EdgeInsets.all(3),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Expanded(
              flex: 7,
              child: Shimmer.fromColors(
                baseColor: Color(0xFFE0E0E0),
                highlightColor: Color(0xFFF5F5F5),
                enabled: Provider.of<CategoryProvider>(context)
                        .categoryList
                        ?.length ==
                    0,
                child: Container(
                    decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                )),
              ),
            ),
            Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorResources.getTextBg(context),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: Shimmer.fromColors(
                    baseColor: Color(0xFFE0E0E0),
                    highlightColor: Color(0xFFF5F5F5),
                    enabled: Provider.of<CategoryProvider>(context)
                            .categoryList
                            ?.length ==
                        0,
                    child: Container(
                        height: 10,
                        color: Colors.white,
                        margin: EdgeInsets.only(left: 15, right: 15)),
                  ),
                )),
          ]),
        );
      },
    );
  }
}
