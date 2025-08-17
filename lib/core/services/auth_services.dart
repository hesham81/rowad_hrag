import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rowad_hrag/core/services/cash_helper.dart';
import 'package:rowad_hrag/main.dart';

import '../route/route_names.dart';

abstract class AuthServices {
  static Future<void> signOut() async {
    EasyLoading.show();
    await CashHelper.remove("token");
    Navigator.pushNamedAndRemoveUntil(
      navigationKey.currentContext!,
      RouteNames.signIn,
      (route) => false,
    );
    EasyLoading.dismiss();
  }
}
