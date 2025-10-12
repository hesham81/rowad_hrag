import '/core/validations/validations.dart';

abstract class PhoneValidation extends Validations {
  static String? check({
    required String phoneNumber,
  }) {
    // إزالة جميع الرموز غير الرقمية (مثل +، -، مسافات، أقواس)
    String cleaned = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');

    // التحقق من الطول والبادئة بعد التنظيف
    if (cleaned.isEmpty) {
      return "من فضلك أدخل رقم الهاتف";
    }

    // الحالة 1: يبدأ بـ 966 ويتبعه 9 أرقام (المجموع 12 رقمًا)
    if (cleaned.startsWith('966')) {
      if (cleaned.length == 12 && cleaned[3] == '5') {
        return null; // صحيح
      }
    }
    // الحالة 2: يبدأ بـ 05 ويتبعه 8 أرقام (المجموع 10 أرقام)
    else if (cleaned.startsWith('05')) {
      if (cleaned.length == 10) {
        return null; // صحيح
      }
    }
    // الحالة 3: يبدأ بـ 5 ويتبعه 8 أرقام (المجموع 9 أرقام) — رقم محلي بدون بادئة
    else if (cleaned.startsWith('5')) {
      if (cleaned.length == 9) {
        return null; // صحيح
      }
    }

    return "من فضلك ادخل رقم هاتف سعودي صحيح";
  }
}