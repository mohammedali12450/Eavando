import 'package:flutter/material.dart';
import 'package:flutter_axtro_soft_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_axtro_soft_ecommerce/data/model/response/social_media_model.dart';
import 'package:flutter_axtro_soft_ecommerce/data/repository/social_media_repo.dart';
import 'package:flutter_axtro_soft_ecommerce/helper/api_checker.dart';

class SocialMediaProvider extends ChangeNotifier {
  final SocialMediaRepo socialMediaRepo;

  SocialMediaProvider({required this.socialMediaRepo});

  List<SocialMedia> _socialMediaList = [];
  List<SocialMedia> get socialMediaList => _socialMediaList;
  int? _socialMediaSelectedIndex;
  int? get categorySelectedIndex => _socialMediaSelectedIndex;

  Future<void> getSocialMediaList(BuildContext context, bool reload) async {
    if (_socialMediaList.length == 0 || reload) {
      ApiResponse apiResponse = await socialMediaRepo.getSocialMediaList();
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        _socialMediaList = [];
        apiResponse.response!.data.forEach((social) {
          _socialMediaList.add(SocialMedia.fromJson(social));
        });
        _socialMediaSelectedIndex = 0;
        notifyListeners();
      } else {
        ApiChecker.checkApi(context, apiResponse);
      }
    }
  }

  void changeSelectedIndex(int selectedIndex) {
    _socialMediaSelectedIndex = selectedIndex;
    notifyListeners();
  }
}
