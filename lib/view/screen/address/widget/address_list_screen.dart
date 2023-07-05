import 'package:flutter/material.dart';
import 'package:flutter_axtro_soft_ecommerce/data/model/response/address_model.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/custom_themes.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/images.dart';

class AddressListPage extends StatelessWidget {
  final AddressModel address;
  AddressListPage({Key? key, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        address.addressType == 'Home'
            ? Images.home_image
            : address.addressType == 'Workplace'
                ? Images.bag
                : Images.more_image,
        color: Theme.of(context).colorScheme.secondary,
        height: 30,
        width: 30,
      ),
      title: Text(address.address ?? "", style: titilliumRegular),
    );
  }
}
