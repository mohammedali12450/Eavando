class ConfigModel {
  int? systemDefaultCurrency;
  bool? digitalPayment;
  bool? cod;
  BaseUrls? baseUrls;
  StaticUrls? staticUrls;
  String? aboutUs;
  String? privacyPolicy;
  List<Faq>? faq;
  String? termsConditions;
  String? refundPolicy;
  String? returnPolicy;
  String? cancellationPolicy;
  List<CurrencyList>? currencyList;
  String? currencySymbolPosition;
  bool? maintenanceMode;
  List<String>? language;
  List<Colors>? colors;
  List<String>? unit;
  String? shippingMethod;
  String? currencyModel;
  bool? emailVerification;
  bool? phoneVerification;
  String? countryCode;
  List<SocialLogin>? socialLogin;
  String? forgetPasswordVerification;
  Announcement? announcement;
  String? version;
  String? businessMode;
  int? decimalPointSetting;
  String? inHouseSelectedShippingType;
  int? billingAddress;
  int? walletStatus;
  int? loyaltyPointStatus;
  int? loyaltyPointExchangeRate;
  int? loyaltyPointMinimumPoint;
  String? brandSetting;
  String? digitalProductSetting;
  bool? cashOnDelivery;
  int? deliveryCountryRestriction;
  int? deliveryZipCodeAreaRestriction;

  ConfigModel({
    this.systemDefaultCurrency,
    this.digitalPayment,
    this.cod,
    this.baseUrls,
    this.staticUrls,
    this.aboutUs,
    this.privacyPolicy,
    this.faq,
    this.termsConditions,
    this.refundPolicy,
    this.returnPolicy,
    this.cancellationPolicy,
    this.currencyList,
    this.currencySymbolPosition,
    this.maintenanceMode,
    this.language,
    this.colors,
    this.unit,
    this.shippingMethod,
    this.currencyModel,
    this.emailVerification,
    this.phoneVerification,
    this.countryCode,
    this.socialLogin,
    this.forgetPasswordVerification,
    this.announcement,
    this.version,
    this.businessMode,
    this.decimalPointSetting,
    this.inHouseSelectedShippingType,
    this.billingAddress,
    this.walletStatus,
    this.loyaltyPointStatus,
    this.loyaltyPointExchangeRate,
    this.loyaltyPointMinimumPoint,
    this.brandSetting,
    this.digitalProductSetting,
    this.cashOnDelivery,
    this.deliveryCountryRestriction,
    this.deliveryZipCodeAreaRestriction,
  });

  ConfigModel.fromJson(Map<String, dynamic> json) {
    systemDefaultCurrency = json['system_default_currency'];
    digitalPayment = json['digital_payment'];
    cod = json['cash_on_delivery'];
    baseUrls = json['base_urls'] != null
        ? new BaseUrls.fromJson(json['base_urls'])
        : null;
    staticUrls = json['static_urls'] != null
        ? new StaticUrls.fromJson(json['static_urls'])
        : null;
    aboutUs = json['about_us'];
    privacyPolicy = json['privacy_policy'];
    if (json['faq'] != null) {
      faq = [];
      json['faq'].forEach((v) {
        faq?.add(new Faq.fromJson(v));
      });
    }
    termsConditions = json['terms_&_conditions'];
    refundPolicy = json['refund_policy'] != null ? json['refund_policy'] : '';
    returnPolicy = json['return_policy'] != null ? json['return_policy'] : '';
    cancellationPolicy =
        json['cancellation_policy'] != null ? json['cancellation_policy'] : '';
    if (json['currency_list'] != null) {
      currencyList = [];
      json['currency_list'].forEach((v) {
        currencyList?.add(new CurrencyList.fromJson(v));
      });
    }
    currencySymbolPosition = json['currency_symbol_position'];
    maintenanceMode = json['maintenance_mode'];
    language = json['language'].cast<String>();
    if (json['colors'] != null) {
      colors = [];
      json['colors'].forEach((v) {
        colors?.add(new Colors.fromJson(v));
      });
    }

    unit = json['unit'].cast<String>();
    shippingMethod = json['shipping_method'];
    currencyModel = json['currency_model'];
    emailVerification = json['email_verification'];
    phoneVerification = json['phone_verification'];
    countryCode = json['country_code'];
    if (json['social_login'] != null) {
      socialLogin = [];
      json['social_login'].forEach((v) {
        socialLogin?.add(new SocialLogin.fromJson(v));
      });
    }
    forgetPasswordVerification = json['forgot_password_verification'];
    announcement = json['announcement'] != null
        ? new Announcement.fromJson(json['announcement'])
        : null;

    if (json['software_version'] != null) {
      version = json['software_version'];
    }
    if (json['business_mode'] != null) {
      businessMode = json['business_mode'];
    }
    if (json['decimal_point_settings'] != null &&
        json['decimal_point_settings'] != "") {
      decimalPointSetting =
          int.parse(json['decimal_point_settings'].toString());
    }
    if (json['inhouse_selected_shipping_type'] != null) {
      inHouseSelectedShippingType =
          json['inhouse_selected_shipping_type'].toString();
    } else {
      inHouseSelectedShippingType = 'order_wise';
    }
    if (json['billing_input_by_customer'] != null) {
      try {
        billingAddress = json['billing_input_by_customer'];
      } catch (e) {
        billingAddress =
            int.parse(json['billing_input_by_customer'].toString());
      }
    }

    walletStatus = json['wallet_status'];
    loyaltyPointStatus = json['loyalty_point_status'];

    if (json['loyalty_point_exchange_rate'] != null) {
      try {
        loyaltyPointExchangeRate = json['loyalty_point_exchange_rate'];
      } catch (e) {
        loyaltyPointExchangeRate =
            int.parse(json['loyalty_point_exchange_rate'].toString());
      }
    }

    if (json['loyalty_point_minimum_point'] != null) {
      try {
        loyaltyPointMinimumPoint = json['loyalty_point_minimum_point'];
      } catch (e) {
        loyaltyPointMinimumPoint =
            int.parse(json['loyalty_point_minimum_point'].toString());
      }
    }

    brandSetting = json['brand_setting'].toString();
    digitalProductSetting = json['digital_product_setting'];
    cashOnDelivery = json['cash_on_delivery'];

    if (json['delivery_country_restriction'] != null) {
      deliveryCountryRestriction =
          int.parse(json['delivery_country_restriction'].toString());
    } else {
      deliveryCountryRestriction = 0;
    }
    if (json['delivery_zip_code_area_restriction'] != null) {
      deliveryZipCodeAreaRestriction =
          int.parse(json['delivery_zip_code_area_restriction'].toString());
    } else {
      deliveryZipCodeAreaRestriction = 0;
    }
  }
}

class BaseUrls {
  String? productImageUrl;
  String? productThumbnailUrl;
  String? brandImageUrl;
  String? customerImageUrl;
  String? bannerImageUrl;
  String? categoryImageUrl;
  String? reviewImageUrl;
  String? sellerImageUrl;
  String? shopImageUrl;
  String? notificationImageUrl;
  String? digitalProductUrl;
  String? deliveryManImage;

  BaseUrls({
    this.productImageUrl,
    this.productThumbnailUrl,
    this.brandImageUrl,
    this.customerImageUrl,
    this.bannerImageUrl,
    this.categoryImageUrl,
    this.reviewImageUrl,
    this.sellerImageUrl,
    this.shopImageUrl,
    this.notificationImageUrl,
    this.digitalProductUrl,
    this.deliveryManImage,
  });

  BaseUrls.fromJson(Map<String, dynamic> json) {
    this.productImageUrl = json['product_image_url'];
    this.productThumbnailUrl = json['product_thumbnail_url'];
    this.brandImageUrl = json['brand_image_url'];
    this.customerImageUrl = json['customer_image_url'];
    this.bannerImageUrl = json['banner_image_url'];
    this.categoryImageUrl = json['category_image_url'];
    this.reviewImageUrl = json['review_image_url'];
    this.sellerImageUrl = json['seller_image_url'];
    this.shopImageUrl = json['shop_image_url'];
    this.notificationImageUrl = json['notification_image_url'];
    this.digitalProductUrl = json['digital_product_url'];
    this.deliveryManImage = json['delivery_man_image_url'];
  }
}

class StaticUrls {
  String? contactUs;
  String? brands;
  String? categories;
  String? customerAccount;

  StaticUrls({
    this.contactUs,
    this.brands,
    this.categories,
    this.customerAccount,
  });

  StaticUrls.fromJson(Map<String, dynamic> json) {
    contactUs = json['contact_us'];
    brands = json['brands'];
    categories = json['categories'];
    customerAccount = json['customer_account'];
  }
}

class SocialLogin {
  String? loginMedium;
  bool? status;

  SocialLogin({this.loginMedium, this.status});

  SocialLogin.fromJson(Map<String, dynamic> json) {
    loginMedium = json['login_medium'];
    status = json['status'];
  }
}

class Faq {
  int? id;
  String? question;
  String? answer;
  int? ranking;
  int? status;
  String? createdAt;
  String? updatedAt;

  Faq({
    int? id,
    String? question,
    String? answer,
    int? ranking,
    int? status,
    String? createdAt,
    String? updatedAt,
  });

  Faq.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
    ranking = json['ranking'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class CurrencyList {
  int? id;
  String? name;
  String? symbol;
  String? code;
  double? exchangeRate;
  int? status;
  String? createdAt;
  String? updatedAt;

  CurrencyList({
    this.id,
    this.name,
    this.symbol,
    this.code,
    this.exchangeRate,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  CurrencyList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    code = json['code'];
    exchangeRate = json['exchange_rate'].toDouble();
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class Colors {
  int? id;
  String? name;
  String? code;
  String? createdAt;
  String? updatedAt;

  Colors({
    this.id,
    this.name,
    this.code,
    this.createdAt,
    this.updatedAt,
  });

  Colors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class Announcement {
  String? status;
  String? color;
  String? textColor;
  String? announcement;

  Announcement({
    this.status,
    this.color,
    this.textColor,
    this.announcement,
  });

  Announcement.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    color = json['color'];
    textColor = json['text_color'];
    announcement = json['announcement'];
  }
}
