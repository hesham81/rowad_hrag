abstract class ApiNetworks {
  static const String baseUrl = 'https://rowad-harag.com/api/v2';
}

abstract class ApiEndPoints {
  static const String login = '/auth/login';
  static const String signUp = '/auth/signup';
  static const String categories = '/categories'; ///categories/home
  static const String states = '/states';
  static const String cityByStateId = '/cities-by-state';
  static const String banners = '/banners-one';
  static const String secondBanner = '/banners-two';
  static const String blogs = '/blogs';
  static const String reviews = '/website-reviews';
  static const String subCategories = '/sub-categories';
  static const String specialProducts = '/products/featured';
  static const String peopleWithSpecialNeeds = '/products/special-needs';
  static const String productiveFamilies = '/products/productive-families';
  static const String visitorState = '/visitor-stats';
  static const String topSellers = '/seller/top';
  static const String productDetails = '/product';
  static const String plans = '/seller/plans';
  static const String allCategories = '/all_categories';
  static const String profile = '/seller/shop/info';
  static const String getAllNotifications = '/user/notifications';
  static const String getAllAdds = '/seller/products/all';
  static const String getAllFiles = '/seller/file/all';
  static const String getAllContacts = '/seller/support-tickets';

}