import 'package:flutter/material.dart';
import 'package:flutter_axtro_soft_ecommerce/localization/language_constrants.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/auth_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/cart_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/profile_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/social_media_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/splash_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/theme_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/wallet_transaction_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/wishlist_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/theme/light_theme.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/app_constants.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/color_resources.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/custom_themes.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/dimensions.dart';
import 'package:flutter_axtro_soft_ecommerce/utill/images.dart';
import 'package:flutter_axtro_soft_ecommerce/view/basewidget/animated_custom_dialog.dart';
import 'package:flutter_axtro_soft_ecommerce/view/basewidget/guest_dialog.dart';
import 'package:flutter_axtro_soft_ecommerce/view/screen/cart/cart_screen.dart';
import 'package:flutter_axtro_soft_ecommerce/view/screen/category/all_category_screen.dart';
import 'package:flutter_axtro_soft_ecommerce/view/screen/chat/inbox_screen.dart';
import 'package:flutter_axtro_soft_ecommerce/view/screen/loyaltyPoint/loyalty_point_screen.dart';
import 'package:flutter_axtro_soft_ecommerce/view/screen/more/web_view_screen.dart';
import 'package:flutter_axtro_soft_ecommerce/view/screen/more/widget/html_view_Screen.dart';
import 'package:flutter_axtro_soft_ecommerce/view/screen/more/widget/sign_out_confirmation_dialog.dart';
import 'package:flutter_axtro_soft_ecommerce/view/screen/notification/notification_screen.dart';
import 'package:flutter_axtro_soft_ecommerce/view/screen/offer/offers_screen.dart';
import 'package:flutter_axtro_soft_ecommerce/view/screen/order/order_screen.dart';
import 'package:flutter_axtro_soft_ecommerce/view/screen/profile/address_list_screen.dart';
import 'package:flutter_axtro_soft_ecommerce/view/screen/profile/profile_screen.dart';
import 'package:flutter_axtro_soft_ecommerce/view/screen/setting/settings_screen.dart';
import 'package:flutter_axtro_soft_ecommerce/view/screen/support/support_ticket_screen.dart';
import 'package:flutter_axtro_soft_ecommerce/view/screen/wallet/wallet_screen.dart';
import 'package:flutter_axtro_soft_ecommerce/view/screen/wishlist/wishlist_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'faq_screen.dart';

class MoreScreen extends StatefulWidget {
  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  late bool isGuestMode;
  String version = "1.0.0";
  bool singleVendor = false;
  @override
  void initState() {
    isGuestMode =
        !Provider.of<AuthProvider>(context, listen: false).isLoggedIn();
    if (!isGuestMode) {
      Provider.of<ProfileProvider>(context, listen: false).getUserInfo(context);
      version = Provider.of<SplashProvider>(context, listen: false)
                  .configModel
                  ?.version !=
              null
          ? Provider.of<SplashProvider>(context, listen: false)
                  .configModel
                  ?.version ??
              "version"
          : 'version';
      Provider.of<ProfileProvider>(context, listen: false).getUserInfo(context);
      if (Provider.of<SplashProvider>(context, listen: false)
              .configModel
              ?.walletStatus ==
          1) {
        Provider.of<WalletTransactionProvider>(context, listen: false)
            .getTransactionList(context, 1);
      }
      if (Provider.of<SplashProvider>(context, listen: false)
              .configModel
              ?.loyaltyPointStatus ==
          1) {
        Provider.of<WalletTransactionProvider>(context, listen: false)
            .getLoyaltyPointList(context, 1);
      }
    }
    singleVendor = Provider.of<SplashProvider>(context, listen: false)
            .configModel
            ?.businessMode ==
        "single";
    super.initState();
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            Images.more_page_header,
            height: 150,
            fit: BoxFit.fill,
            color: Provider.of<ThemeProvider>(context).darkTheme
                ? Colors.black
                : Theme.of(context).primaryColor,
          ),
        ),
        Positioned(
          top: 40,
          left: Dimensions.PADDING_SIZE_SMALL,
          right: Dimensions.PADDING_SIZE_SMALL,
          child: Consumer<ProfileProvider>(
            builder: (context, profile, child) {
              return Row(children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: Dimensions.HOME_PAGE_PADDING),
                  child: Image.asset(
                    Images.eavando_logo,
                    height: 35,
                    width: 180,
                  ),
                ),
                Expanded(child: SizedBox.shrink()),
                InkWell(
                  onTap: () {
                    if (isGuestMode) {
                      showAnimatedDialog(context, GuestDialog(), isFlip: true);
                    } else {
                      if (Provider.of<ProfileProvider>(context, listen: false)
                              .userInfoModel !=
                          null) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                      }
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: Dimensions.HOME_PAGE_PADDING),
                    child: Row(children: [
                      Text(
                          !isGuestMode
                              ? profile.userInfoModel != null
                                  ? '${profile.userInfoModel?.fName} ${profile.userInfoModel?.lName}'
                                  : 'Full Name'
                              : 'Guest',
                          style: titilliumRegular.copyWith(
                              color: ColorResources.WHITE)),
                      SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                      isGuestMode
                          ? CircleAvatar(
                              backgroundColor: Theme.of(context)
                                      .buttonTheme
                                      .colorScheme
                                      ?.primary ??
                                  primaryColor,
                              child: Icon(
                                Icons.person,
                                size: 30,
                                color: Colors.white,
                              ),
                            )
                          : profile.userInfoModel == null
                              ? CircleAvatar(
                                  backgroundColor: Theme.of(context)
                                          .buttonTheme
                                          .colorScheme
                                          ?.primary ??
                                      primaryColor,
                                  child: Icon(
                                    Icons.person,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: Images.placeholder,
                                    width: 35,
                                    height: 35,
                                    fit: BoxFit.cover,
                                    image:
                                        '${Provider.of<SplashProvider>(context, listen: false).baseUrls?.customerImageUrl ?? ""}/'
                                        '${profile.userInfoModel?.image ?? ""}',
                                    imageErrorBuilder: (c, o, s) =>
                                        CircleAvatar(
                                      backgroundColor: Theme.of(context)
                                              .buttonTheme
                                              .colorScheme
                                              ?.primary ??
                                          primaryColor,
                                      child: Icon(
                                        Icons.person,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                    ]),
                  ),
                ),
              ]);
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 120),
          decoration: BoxDecoration(
            color: ColorResources.getIconBg(context),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                  // Top Row Items
                  Container(
                    height: MediaQuery.of(context).size.width / 4.5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios,
                              color: Theme.of(context).primaryColor),
                          Expanded(
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                children: [
                                  Provider.of<SplashProvider>(context,
                                                  listen: false)
                                              .configModel
                                              ?.walletStatus ==
                                          1
                                      ? SquareButton(
                                          image: Images.wallet,
                                          title:
                                              getTranslated('wallet', context),
                                          navigateTo: WalletScreen(),
                                          count: 1,
                                          hasCount: false)
                                      : SizedBox(),
                                  Provider.of<SplashProvider>(context,
                                                  listen: false)
                                              .configModel
                                              ?.loyaltyPointStatus ==
                                          1
                                      ? SquareButton(
                                          image: Images.loyalty_point,
                                          title: getTranslated(
                                              'loyalty_point', context),
                                          navigateTo: LoyaltyPointScreen(),
                                          count: 1,
                                          hasCount: false,
                                        )
                                      : SizedBox(),
                                  SquareButton(
                                    image: Images.shopping_image,
                                    title: getTranslated('orders', context),
                                    navigateTo: OrderScreen(),
                                    count: 1,
                                    hasCount: false,
                                  ),
                                  SquareButton(
                                    image: Images.cart_image,
                                    title: getTranslated('CART', context),
                                    navigateTo: CartScreen(),
                                    count: Provider.of<CartProvider>(context,
                                            listen: false)
                                        .cartList
                                        .length,
                                    hasCount: true,
                                  ),
                                  SquareButton(
                                    image: Images.offers,
                                    title: getTranslated('offers', context),
                                    navigateTo: OffersScreen(),
                                    count: 0,
                                    hasCount: false,
                                  ),
                                  SquareButton(
                                    image: Images.wishlist,
                                    title: getTranslated('wishlist', context),
                                    navigateTo: WishListScreen(),
                                    count: Provider.of<AuthProvider>(context,
                                                    listen: false)
                                                .isLoggedIn() &&
                                            Provider.of<WishListProvider>(
                                                        context,
                                                        listen: false)
                                                    .wishList !=
                                                null &&
                                            (Provider.of<WishListProvider>(
                                                            context,
                                                            listen: false)
                                                        .wishList
                                                        ?.length ??
                                                    0) >
                                                0
                                        ? (Provider.of<WishListProvider>(
                                                    context,
                                                    listen: false)
                                                .wishList
                                                ?.length ??
                                            0)
                                        : 0,
                                    hasCount: false,
                                  ),
                                ]),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                  // Buttons
                  TitleButton(
                      image: Images.fast_delivery,
                      title: getTranslated('address', context),
                      navigateTo: AddressListScreen()),

                  TitleButton(
                      image: Images.more_filled_image,
                      title: getTranslated('all_category', context),
                      navigateTo: AllCategoryScreen()),

                  TitleButton(
                      image: Images.notification_filled,
                      title: getTranslated('notification', context),
                      navigateTo: NotificationScreen()),

                  singleVendor
                      ? SizedBox()
                      : TitleButton(
                          image: Images.chats,
                          title: getTranslated('chats', context),
                          navigateTo: InboxScreen()),

                  TitleButton(
                      image: Images.settings,
                      title: getTranslated('settings', context),
                      navigateTo: SettingsScreen()),

                  TitleButton(
                      image: Images.preference,
                      title: getTranslated('support_ticket', context),
                      navigateTo: SupportTicketScreen()),

                  TitleButton(
                      image: Images.term_condition,
                      title: getTranslated('terms_condition', context),
                      navigateTo: HtmlViewScreen(
                        title: getTranslated('terms_condition', context),
                        url: Provider.of<SplashProvider>(context, listen: false)
                                .configModel
                                ?.termsConditions ??
                            " ",
                      )),

                  TitleButton(
                    image: Images.privacy_policy,
                    title: getTranslated('privacy_policy', context),
                    navigateTo: HtmlViewScreen(
                      title: getTranslated('privacy_policy', context),
                      url: Provider.of<SplashProvider>(context, listen: false)
                              .configModel
                              ?.privacyPolicy ??
                          "",
                    ),
                  ),

                  TitleButton(
                    image: Images.refund_policy,
                    title: getTranslated('refund_policy', context),
                    navigateTo: HtmlViewScreen(
                      title: getTranslated('refund_policy', context),
                      url: Provider.of<SplashProvider>(context, listen: false)
                              .configModel
                              ?.refundPolicy ??
                          "",
                    ),
                  ),

                  TitleButton(
                    image: Images.return_policy,
                    title: getTranslated('return_policy', context),
                    navigateTo: HtmlViewScreen(
                      title: getTranslated('return_policy', context),
                      url: Provider.of<SplashProvider>(context, listen: false)
                              .configModel
                              ?.returnPolicy ??
                          "",
                    ),
                  ),

                  TitleButton(
                    image: Images.c_policy,
                    title: getTranslated('cancellation_policy', context),
                    navigateTo: HtmlViewScreen(
                      title: getTranslated('cancellation_policy', context),
                      url: Provider.of<SplashProvider>(context, listen: false)
                              .configModel
                              ?.cancellationPolicy ??
                          "",
                    ),
                  ),

                  TitleButton(
                      image: Images.help_center,
                      title: getTranslated('faq', context),
                      navigateTo: FaqScreen(
                        title: getTranslated('faq', context),
                      )),

                  TitleButton(
                    image: Images.about_us,
                    title: getTranslated('about_us', context),
                    navigateTo: HtmlViewScreen(
                      title: getTranslated('about_us', context),
                      url: Provider.of<SplashProvider>(context, listen: false)
                              .configModel
                              ?.aboutUs ??
                          "",
                    ),
                  ),

                  TitleButton(
                      image: Images.contact_us,
                      title: getTranslated('contact_us', context),
                      navigateTo: WebViewScreen(
                        title: getTranslated('contact_us', context),
                        url: Provider.of<SplashProvider>(context, listen: false)
                                .configModel
                                ?.staticUrls
                                .contactUs ??
                            "",
                      )),

                  ListTile(
                    leading: Image.asset(Images.logo_image,
                        width: 25,
                        height: 25,
                        fit: BoxFit.fill,
                        color: Theme.of(context).colorScheme.primary),
                    title: Text(getTranslated('app_info', context),
                        style: titilliumRegular.copyWith(
                            fontSize: Dimensions.FONT_SIZE_LARGE,
                            color: Theme.of(context).primaryColor)),
                    trailing: Text(AppConstants.APP_VERSION),
                  ),

                  isGuestMode
                      ? SizedBox()
                      : ListTile(
                          leading: Icon(Icons.exit_to_app,
                              color: Theme.of(context).colorScheme.primary,
                              size: 25),
                          title: Text(getTranslated('sign_out', context),
                              style: titilliumRegular.copyWith(
                                  fontSize: Dimensions.FONT_SIZE_LARGE,
                                  color: Theme.of(context).primaryColor)),
                          onTap: () => showAnimatedDialog(
                              context, SignOutConfirmationDialog(),
                              isFlip: true),
                        ),
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                  //social media
                  Consumer<SocialMediaProvider>(
                    builder: (context, social, child) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: GridView.builder(
                            padding: EdgeInsets.all(0),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 6,
                                    childAspectRatio: 1,
                                    crossAxisSpacing: 10),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: social.socialMediaList.length,
                            itemBuilder: (ctx, index) {
                              return InkWell(
                                onTap: () {
                                  _launchUrl(
                                      social.socialMediaList[index].link);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(
                                      Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: SvgPicture.network(
                                        social.socialMediaList[index].iconUrl,
                                        // ignore: deprecated_member_use
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                  ),
                                ),
                              );
                            }),
                      );
                    },
                  ),

                  SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("From",
                            style: titleHeader.copyWith(
                                color: ColorResources.axtroSoftLogo(context))),
                        SizedBox(height: 8),
                        Image.asset(Images.axtro_soft_logo, width: 120),
                        SizedBox(height: 15)
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ]),
    );
  }
}

class SquareButton extends StatelessWidget {
  final String image;
  final String title;
  final Widget navigateTo;
  final int count;
  final bool hasCount;

  SquareButton({
    required this.image,
    required this.title,
    required this.navigateTo,
    required this.count,
    required this.hasCount,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 100;
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => navigateTo)),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: width / 5,
            height: width / 5,
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorResources.getPrimary(context),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(image, color: Theme.of(context).highlightColor),
                hasCount
                    ? Positioned(
                        top: -5,
                        right: -5,
                        child: Consumer<CartProvider>(
                            builder: (context, cart, child) {
                          return CircleAvatar(
                            radius: 7,
                            backgroundColor: ColorResources.RED,
                            child: Text(count.toString(),
                                style: titilliumSemiBold.copyWith(
                                  color: Theme.of(context).cardColor,
                                  fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                                )),
                          );
                        }),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
        Flexible(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.clip,
            style:
                titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
          ),
        ),
      ]),
    );
  }
}

class TitleButton extends StatelessWidget {
  final String image;
  final String title;
  final Widget navigateTo;
  TitleButton({
    required this.image,
    required this.title,
    required this.navigateTo,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        image,
        width: 25,
        height: 25,
        fit: BoxFit.fill,
        color: Theme.of(context).colorScheme.secondary,
      ),
      title: Text(title,
          style: titilliumRegular.copyWith(
              fontSize: Dimensions.FONT_SIZE_LARGE,
              color: Theme.of(context).primaryColor)),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => navigateTo),
      ),
    );
  }
}
