abstract class Validations {
  static String? isEmailValid(String email) {
    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (email.isEmpty) {
      return "ادخل بريد الكتروني";
    } else if (!emailRegex.hasMatch(email)) {
      return "ادخل بريد الكتروني صحيح";
    }
    return null;
  }

  static String? isPasswordValid(String password) {
    if (password.isEmpty) {
      return "ادخل كلمه المرور";
    } else if (password.length < 6) {
      return "كلمه المرور يجب ان تكون اكثر من 6 حروف";
    }
    return null;
  }

  static String? isNameValid(String name) {
    if (name.isEmpty) {
      return "ادخل اسمك";
    }
    return null;
  }

  static String? rePasswordValid(String password, String rePassword) {
    if (password != rePassword) {
      return "كلمه المرور غير متوافقه مع تاكيد كلمه المرور";
    }
    return null;
  }

  // Link/URL Validation
  static String? isLinkValid(String link) {
    if (link.isEmpty) {
      return "الرجاء إدخال رابط";
    }

    // Basic URL regex pattern (supports http, https, with or without www)
    final urlPattern = RegExp(
      r'^https?:\/\/' // http:// or https://
      r'(?:(?:[A-Z0-9](?:[A-Z0-9-]{0,61}[A-Z0-9])?\.)+' // domain name
      r'(?:[A-Z]{2,6}\.?|[A-Z0-9-]{2,}\.?)|' // domain extension
      r'localhost|' // localhost
      r'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})' // IP address
      r'(?::\d+)?' // optional port
      r'(?:\/(?:[^\s?#])+?(?:\?[^\s#]*)?(?:#[^\s]*)?)?$', // path, query, fragment
      caseSensitive: false,
    );

    if (!urlPattern.hasMatch(link)) {
      return "الرجاء إدخال رابط صالح";
    }

    return null;
  }
}