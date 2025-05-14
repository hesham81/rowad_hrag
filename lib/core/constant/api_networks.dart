abstract class ApiNetworks {
  static const String baseUrl = 'https://rowad-harag.com/api/v2';
}

abstract class ApiEndPoints {
  static const String login = '/auth/login';
  static const String signUp = '/auth/signup';
  static const String categories = '/categories';
  static const String states = '/states';
  static const String cityByStateId = '/cities-by-state';
  static const String banners = '/banners-one';
  static const String blogs = '/blogs';
  static const String reviews = '/website-reviews';
  static const String subCategories = '/sub-categories';

}