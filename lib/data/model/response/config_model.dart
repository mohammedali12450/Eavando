class ConfigModel {
  late int _systemDefaultCurrency;
  late bool _digitalPayment;
  late bool _cod;
  late BaseUrls _baseUrls;
  late StaticUrls _staticUrls;
  late String _aboutUs;
  late String _privacyPolicy;
  late List<Faq> _faq;
  late String _termsConditions;
  late String _refundPolicy;
  late String _returnPolicy;
  late String _cancellationPolicy;
  late List<CurrencyList> _currencyList;
  late String _currencySymbolPosition;
  late bool _maintenanceMode;
  late List<String> _language;
  late List<Colors> _colors;
  late List<String> _unit;
  late String _shippingMethod;
  late String _currencyModel;
  late bool _emailVerification;
  late bool _phoneVerification;
  late String _countryCode;
  late List<SocialLogin> _socialLogin;
  late String _forgetPasswordVerification;
  late Announcement _announcement;
  late String _version;
  late String _businessMode;
  late int _decimalPointSetting;
  late String _inHouseSelectedShippingType;
  late int _billingAddress;
  late int _walletStatus;
  late int _loyaltyPointStatus;
  late int _loyaltyPointExchangeRate;
  late int _loyaltyPointMinimumPoint;
  late String _brandSetting;
  late String _digitalProductSetting;
  late bool _cashOnDelivery;
  late int _deliveryCountryRestriction;
  late int _deliveryZipCodeAreaRestriction;

  ConfigModel({
    required int systemDefaultCurrency,
    required bool digitalPayment,
    required bool cod,
    required BaseUrls baseUrls,
    required StaticUrls staticUrls,
    required String aboutUs,
    required String privacyPolicy,
    required List<Faq> faq,
    required String termsConditions,
    required String refundPolicy,
    required String returnPolicy,
    required String cancellationPolicy,
    required List<CurrencyList> currencyList,
    required String currencySymbolPosition,
    required bool maintenanceMode,
    required List<String> language,
    required List<Colors> colors,
    required List<String> unit,
    required String shippingMethod,
    required String currencyModel,
    required bool emailVerification,
    required bool phoneVerification,
    required String countryCode,
    required List<SocialLogin> socialLogin,
    required String forgetPasswordVerification,
    required Announcement announcement,
    required String version,
    required String businessMode,
    required int decimalPointSetting,
    required String inHouseSelectedShippingType,
    required int billingAddress,
    required int walletStatus,
    required int loyaltyPointStatus,
    required int loyaltyPointExchangeRate,
    required int loyaltyPointMinimumPoint,
    required String brandSetting,
    required String digitalProductSetting,
    required bool cashOnDelivery,
    required int deliveryCountryRestriction,
    required int deliveryZipCodeAreaRestriction,
  }) {
    this._systemDefaultCurrency = systemDefaultCurrency;
    this._digitalPayment = digitalPayment;
    this._cod = cod;
    this._baseUrls = baseUrls;
    this._staticUrls = staticUrls;
    this._aboutUs = aboutUs;
    this._privacyPolicy = privacyPolicy;
    this._faq = faq;
    this._termsConditions = termsConditions;
    this._refundPolicy = refundPolicy;
    this._returnPolicy = returnPolicy;
    this._cancellationPolicy = cancellationPolicy;
    this._currencyList = currencyList;
    this._currencySymbolPosition = currencySymbolPosition;
    this._maintenanceMode = maintenanceMode;
    this._language = language;
    this._colors = colors;
    this._unit = unit;
    this._shippingMethod = shippingMethod;
    this._currencyModel = currencyModel;
    this._emailVerification = emailVerification;
    this._phoneVerification = phoneVerification;
    this._countryCode = countryCode;
    this._socialLogin = socialLogin;
    this._forgetPasswordVerification = forgetPasswordVerification;
    this._announcement = announcement;
    this._version = version;
    this._businessMode = businessMode;
    this._decimalPointSetting = decimalPointSetting;
    this._inHouseSelectedShippingType = inHouseSelectedShippingType;
    this._billingAddress = billingAddress;

    this._walletStatus = walletStatus;

    this._loyaltyPointStatus = loyaltyPointStatus;

    this._loyaltyPointExchangeRate = loyaltyPointExchangeRate;

    this._loyaltyPointMinimumPoint = loyaltyPointMinimumPoint;

    this._brandSetting = brandSetting;

    this._digitalProductSetting = digitalProductSetting;

    this._cashOnDelivery = cashOnDelivery;

    this._deliveryCountryRestriction = deliveryCountryRestriction;

    this._deliveryZipCodeAreaRestriction = deliveryZipCodeAreaRestriction;
  }

  int get systemDefaultCurrency => _systemDefaultCurrency;
  bool get digitalPayment => _digitalPayment;
  bool get cod => _cod;
  BaseUrls get baseUrls => _baseUrls;
  StaticUrls get staticUrls => _staticUrls;
  String get aboutUs => _aboutUs;
  String get privacyPolicy => _privacyPolicy;
  List<Faq> get faq => _faq;
  String get termsConditions => _termsConditions;
  String get refundPolicy => _refundPolicy;
  String get returnPolicy => _returnPolicy;
  String get cancellationPolicy => _cancellationPolicy;
  List<CurrencyList> get currencyList => _currencyList;
  String get currencySymbolPosition => _currencySymbolPosition;
  bool get maintenanceMode => _maintenanceMode;
  List<String> get language => _language;
  List<Colors> get colors => _colors;
  List<String> get unit => _unit;
  String get shippingMethod => _shippingMethod;
  String get currencyModel => _currencyModel;
  bool get emailVerification => _emailVerification;
  bool get phoneVerification => _phoneVerification;
  String get countryCode => _countryCode;
  List<SocialLogin> get socialLogin => _socialLogin;
  String get forgetPasswordVerification => _forgetPasswordVerification;
  Announcement get announcement => _announcement;
  String get version => _version;
  String get businessMode => _businessMode;
  int get decimalPointSetting => _decimalPointSetting;
  String get inHouseSelectedShippingType => _inHouseSelectedShippingType;
  int get billingAddress => _billingAddress;
  int get walletStatus => _walletStatus;
  int get loyaltyPointStatus => _loyaltyPointStatus;
  int get loyaltyPointExchangeRate => _loyaltyPointExchangeRate;
  int get loyaltyPointMinimumPoint => _loyaltyPointMinimumPoint;
  String get brandSetting => _brandSetting;
  String get digitalProductSetting => _digitalProductSetting;
  bool get cashOnDelivery => _cashOnDelivery;
  int get deliveryCountryRestriction => _deliveryCountryRestriction;
  int get deliveryZipCodeAreaRestriction => _deliveryZipCodeAreaRestriction;

  ConfigModel.fromJson(Map<String, dynamic> json) {
    _systemDefaultCurrency = json['system_default_currency'] ?? 0;
    _digitalPayment = json['digital_payment'] ?? false;
    _cod = json['cash_on_delivery'] ?? false;
    _baseUrls = BaseUrls.fromJson(json['base_urls'] ?? {});
    _staticUrls = StaticUrls.fromJson(json['static_urls'] ?? {});
    _aboutUs = json['about_us'] ?? "";
    _privacyPolicy = json['privacy_policy'] ?? "";
    _faq = [];
    if (json['faq'] != null) {
      json['faq'].forEach((v) {
        _faq.add(new Faq.fromJson(v));
      });
    }
    _termsConditions = json['terms_&_conditions'] ?? "";
    _refundPolicy = json['refund_policy'] != null ? json['refund_policy'] : '';
    _returnPolicy = json['return_policy'] != null ? json['return_policy'] : '';
    _cancellationPolicy =
        json['cancellation_policy'] != null ? json['cancellation_policy'] : '';
    _currencyList = [];
    if (json['currency_list'] != null) {
      json['currency_list'].forEach((v) {
        _currencyList.add(new CurrencyList.fromJson(v));
      });
    }
    _currencySymbolPosition = json['currency_symbol_position'] ?? "";
    _maintenanceMode = json['maintenance_mode'] ?? false;
    _language = json['language']?.cast<String>() ?? [];
    _colors = [];
    if (json['colors'] != null) {
      json['colors'].forEach((v) {
        _colors.add(new Colors.fromJson(v));
      });
    }

    _unit = json['unit']?.cast<String>() ?? [];
    _shippingMethod = json['shipping_method'] ?? "";
    _currencyModel = json['currency_model'] ?? "";
    _emailVerification = json['email_verification'] ?? false;
    _phoneVerification = json['phone_verification'] ?? false;
    _countryCode = json['country_code'] ?? "";
    _socialLogin = [];
    if (json['social_login'] != null) {
      json['social_login'].forEach((v) {
        _socialLogin.add(new SocialLogin.fromJson(v));
      });
    }
    _forgetPasswordVerification = json['forgot_password_verification'] ?? "";
    _announcement = Announcement.fromJson(json['announcement'] ?? {});

    _version = json['software_version'] ?? "";

    _businessMode = json['business_mode'] ?? "";

    _decimalPointSetting =
        int.parse(json['decimal_point_settings']?.toString() ?? "0");

    if (json['inhouse_selected_shipping_type'] != null) {
      _inHouseSelectedShippingType =
          json['inhouse_selected_shipping_type'].toString();
    } else {
      _inHouseSelectedShippingType = 'order_wise';
    }

    try {
      _billingAddress = json['billing_input_by_customer'] ?? -1;
    } catch (e) {
      _billingAddress =
          int.parse(json['billing_input_by_customer']?.toString() ?? "-1");
    }

    _walletStatus = json['wallet_status'] ?? 0;
    _loyaltyPointStatus = json['loyalty_point_status'] ?? 0;

    try {
      _loyaltyPointExchangeRate = json['loyalty_point_exchange_rate'] ?? 0;
    } catch (e) {
      _loyaltyPointExchangeRate =
          int.parse(json['loyalty_point_exchange_rate']?.toString() ?? "0");
    }

    try {
      _loyaltyPointMinimumPoint = json['loyalty_point_minimum_point'] ?? 0;
    } catch (e) {
      _loyaltyPointMinimumPoint =
          int.parse(json['loyalty_point_minimum_point']?.toString() ?? "0");
    }

    _brandSetting = json['brand_setting']?.toString() ?? "";
    _digitalProductSetting = json['digital_product_setting'] ?? "";
    _cashOnDelivery = json['cash_on_delivery'] ?? false;

    _deliveryCountryRestriction =
        int.parse(json['delivery_country_restriction']?.toString() ?? "0");

    _deliveryZipCodeAreaRestriction = int.parse(
        json['delivery_zip_code_area_restriction']?.toString() ?? "0");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['system_default_currency'] = this._systemDefaultCurrency;
    data['digital_payment'] = this._digitalPayment;
    data['cash_on_delivery'] = this._cod;

    data['base_urls'] = this._baseUrls.toJson();

    data['static_urls'] = this._staticUrls.toJson();

    data['about_us'] = this._aboutUs;
    data['privacy_policy'] = this._privacyPolicy;

    data['faq'] = this._faq.map((v) => v.toJson()).toList();

    data['terms_&_conditions'] = this._termsConditions;

    data['currency_list'] = this._currencyList.map((v) => v.toJson()).toList();

    data['currency_symbol_position'] = this._currencySymbolPosition;
    data['maintenance_mode'] = this._maintenanceMode;
    data['language'] = this._language;

    data['colors'] = this._colors.map((v) => v.toJson()).toList();

    data['unit'] = this._unit;
    data['shipping_method'] = this._shippingMethod;
    data['currency_model'] = this._currencyModel;
    data['email_verification'] = this._emailVerification;
    data['phone_verification'] = this._phoneVerification;
    data['country_code'] = this._countryCode;

    data['social_login'] = this._socialLogin.map((v) => v.toJson()).toList();

    data['forgot_password_verification'] = this._forgetPasswordVerification;

    data['announcement'] = this._announcement.toJson();

    data['software_version'] = this._version;

    data['business_mode'] = this._businessMode;

    data['decimal_point_settings'] = this._decimalPointSetting;

    data['inhouse_selected_shipping_type'] = this._inHouseSelectedShippingType;
    data['wallet_status'] = this._walletStatus;
    data['loyalty_point_status'] = this._loyaltyPointStatus;
    data['loyalty_point_exchange_rate'] = this._loyaltyPointExchangeRate;
    data['loyalty_point_minimum_point'] = this._loyaltyPointMinimumPoint;
    data['brand_setting'] = this._brandSetting;
    data['digital_product_setting'] = this._digitalProductSetting;
    data['cash_on_delivery'] = this._cashOnDelivery;
    data['delivery_country_restriction'] = this._deliveryCountryRestriction;
    data['delivery_zip_code_area_restriction'] =
        this._deliveryZipCodeAreaRestriction;

    return data;
  }
}

class BaseUrls {
  late String _productImageUrl;
  late String _productThumbnailUrl;
  late String _brandImageUrl;
  late String _customerImageUrl;
  late String _bannerImageUrl;
  late String _categoryImageUrl;
  late String _reviewImageUrl;
  late String _sellerImageUrl;
  late String _shopImageUrl;
  late String _notificationImageUrl;
  late String _digitalProductUrl;
  late String _deliveryManImage;

  BaseUrls({
    required String productImageUrl,
    required String productThumbnailUrl,
    required String brandImageUrl,
    required String customerImageUrl,
    required String bannerImageUrl,
    required String categoryImageUrl,
    required String reviewImageUrl,
    required String sellerImageUrl,
    required String shopImageUrl,
    required String notificationImageUrl,
    required String digitalProductUrl,
    required String deliveryManImage,
  }) {
    this._productImageUrl = productImageUrl;
    this._productThumbnailUrl = productThumbnailUrl;
    this._brandImageUrl = brandImageUrl;
    this._customerImageUrl = customerImageUrl;
    this._bannerImageUrl = bannerImageUrl;
    this._categoryImageUrl = categoryImageUrl;
    this._reviewImageUrl = reviewImageUrl;
    this._sellerImageUrl = sellerImageUrl;
    this._shopImageUrl = shopImageUrl;
    this._notificationImageUrl = notificationImageUrl;
    this._digitalProductUrl = digitalProductUrl;
    this._deliveryManImage = deliveryManImage;
  }

  String get productImageUrl => _productImageUrl;
  String get productThumbnailUrl => _productThumbnailUrl;
  String get brandImageUrl => _brandImageUrl;
  String get customerImageUrl => _customerImageUrl;
  String get bannerImageUrl => _bannerImageUrl;
  String get categoryImageUrl => _categoryImageUrl;
  String get reviewImageUrl => _reviewImageUrl;
  String get sellerImageUrl => _sellerImageUrl;
  String get shopImageUrl => _shopImageUrl;
  String get notificationImageUrl => _notificationImageUrl;
  String get digitalProductUrl => _digitalProductUrl;
  String get deliveryManImage => _deliveryManImage;

  BaseUrls.fromJson(Map<String, dynamic> json) {
    _productImageUrl = json['product_image_url'] ?? "";
    _productThumbnailUrl = json['product_thumbnail_url'] ?? "";
    _brandImageUrl = json['brand_image_url'] ?? "";
    _customerImageUrl = json['customer_image_url'] ?? "";
    _bannerImageUrl = json['banner_image_url'] ?? "";
    _categoryImageUrl = json['category_image_url'] ?? "";
    _reviewImageUrl = json['review_image_url'] ?? "";
    _sellerImageUrl = json['seller_image_url'] ?? "";
    _shopImageUrl = json['shop_image_url'] ?? "";
    _notificationImageUrl = json['notification_image_url'] ?? "";
    _digitalProductUrl = json['digital_product_url'] ?? "";
    _deliveryManImage = json['delivery_man_image_url'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_image_url'] = this._productImageUrl;
    data['product_thumbnail_url'] = this._productThumbnailUrl;
    data['brand_image_url'] = this._brandImageUrl;
    data['customer_image_url'] = this._customerImageUrl;
    data['banner_image_url'] = this._bannerImageUrl;
    data['category_image_url'] = this._categoryImageUrl;
    data['review_image_url'] = this._reviewImageUrl;
    data['seller_image_url'] = this._sellerImageUrl;
    data['shop_image_url'] = this._shopImageUrl;
    data['notification_image_url'] = this._notificationImageUrl;
    data['digital_product_url'] = this._digitalProductUrl;
    data['delivery_man_image_url'] = this._deliveryManImage;
    return data;
  }
}

class StaticUrls {
  late String _contactUs;
  late String _brands;
  late String _categories;
  late String _customerAccount;

  StaticUrls({
    required String contactUs,
    required String brands,
    required String categories,
    required String customerAccount,
  }) {
    this._contactUs = contactUs;
    this._brands = brands;
    this._categories = categories;
    this._customerAccount = customerAccount;
  }

  String get contactUs => _contactUs;
  String get brands => _brands;
  String get categories => _categories;
  String get customerAccount => _customerAccount;

  StaticUrls.fromJson(Map<String, dynamic> json) {
    _contactUs = json['contact_us'] ?? "";
    _brands = json['brands'] ?? "";
    _categories = json['categories'] ?? "";
    _customerAccount = json['customer_account'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contact_us'] = this._contactUs;
    data['brands'] = this._brands;
    data['categories'] = this._categories;
    data['customer_account'] = this._customerAccount;
    return data;
  }
}

class SocialLogin {
  late String _loginMedium;
  late bool _status;

  SocialLogin({required String loginMedium, required bool status}) {
    this._loginMedium = loginMedium;
    this._status = status;
  }

  String get loginMedium => _loginMedium;
  bool get status => _status;

  SocialLogin.fromJson(Map<String, dynamic> json) {
    _loginMedium = json['login_medium'] ?? "";
    _status = json['status'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login_medium'] = this._loginMedium;
    data['status'] = this._status;
    return data;
  }
}

class Faq {
  late int _id;
  late String _question;
  late String _answer;
  late int _ranking;
  late int _status;
  late String _createdAt;
  late String _updatedAt;

  Faq(
      {required int id,
      required String question,
      required String answer,
      required int ranking,
      required int status,
      required String createdAt,
      required String updatedAt}) {
    this._id = id;
    this._question = question;
    this._answer = answer;
    this._ranking = ranking;
    this._status = status;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  int get id => _id;
  String get question => _question;
  String get answer => _answer;
  int get ranking => _ranking;
  int get status => _status;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  Faq.fromJson(Map<String, dynamic> json) {
    _id = json['id'] ?? -1;
    _question = json['question'] ?? "";
    _answer = json['answer'] ?? "";
    _ranking = json['ranking'] ?? 0;
    _status = json['status'] ?? 0;
    _createdAt = json['created_at'] ?? "";
    _updatedAt = json['updated_at'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['question'] = this._question;
    data['answer'] = this._answer;
    data['ranking'] = this._ranking;
    data['status'] = this._status;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}

class CurrencyList {
  late int _id;
  late String _name;
  late String _symbol;
  late String _code;
  late double _exchangeRate;
  late int _status;
  late String _createdAt;
  late String _updatedAt;

  CurrencyList(
      {required int id,
      required String name,
      required String symbol,
      required String code,
      required double exchangeRate,
      required int status,
      required String createdAt,
      required String updatedAt}) {
    this._id = id;
    this._name = name;
    this._symbol = symbol;
    this._code = code;
    this._exchangeRate = exchangeRate;
    this._status = status;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  int get id => _id;
  String get name => _name;
  String get symbol => _symbol;
  String get code => _code;
  double get exchangeRate => _exchangeRate;
  int get status => _status;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  CurrencyList.fromJson(Map<String, dynamic> json) {
    _id = json['id'] ?? -1;
    _name = json['name'] ?? "";
    _symbol = json['symbol'] ?? "";
    _code = json['code'] ?? "";
    _exchangeRate = json['exchange_rate']?.toDouble() ?? 0.0;
    _status = json['status'] ?? 0;
    _createdAt = json['created_at'] ?? "";
    _updatedAt = json['updated_at'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['symbol'] = this._symbol;
    data['code'] = this._code;
    data['exchange_rate'] = this._exchangeRate;
    data['status'] = this._status;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}

class Colors {
  late int _id;
  late String _name;
  late String _code;
  late String _createdAt;
  late String _updatedAt;

  Colors(
      {required int id,
      required String name,
      required String code,
      required String createdAt,
      required String updatedAt}) {
    this._id = id;
    this._name = name;
    this._code = code;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  int get id => _id;
  String get name => _name;
  String get code => _code;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  Colors.fromJson(Map<String, dynamic> json) {
    _id = json['id'] ?? -1;
    _name = json['name'] ?? "";
    _code = json['code'] ?? "";
    _createdAt = json['created_at'] ?? "";
    _updatedAt = json['updated_at'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['code'] = this._code;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}

class Announcement {
  late String _status;
  late String _color;
  late String _textColor;
  late String _announcement;

  Announcement(
      {required String status,
      required String color,
      required String textColor,
      required String announcement}) {
    this._status = status;

    this._color = color;

    this._textColor = textColor;

    this._announcement = announcement;
  }

  String get status => _status;
  String get color => _color;
  String get textColor => _textColor;
  String get announcement => _announcement;

  Announcement.fromJson(Map<String, dynamic> json) {
    _status = json['status'] ?? "";
    _color = json['color'] ?? "";
    _textColor = json['text_color'] ?? "";
    _announcement = json['announcement'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['color'] = this._color;
    data['text_color'] = this._textColor;
    data['announcement'] = this._announcement;
    return data;
  }
}
