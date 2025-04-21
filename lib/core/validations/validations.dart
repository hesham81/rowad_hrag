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
}
