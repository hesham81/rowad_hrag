import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/core/constant/api_networks.dart';
import 'cash_helper.dart';

class WebServices {
  static WebServices? _this;
  Dio freePrimaryDio = Dio();
  Dio tokenDio = Dio();

  factory WebServices() {
    return _this ??= WebServices._();
  }

  WebServices._() {
    freePrimaryDio.options.connectTimeout = Duration(minutes: 1);
    freePrimaryDio.options.baseUrl = ApiNetworks.baseUrl;

    tokenDio.options.connectTimeout = Duration(minutes: 1);
    tokenDio.options.baseUrl = ApiNetworks.baseUrl;
    initializeInterceptors();
    // Future.wait([
    //   getTokenData(),
    // ]);
    myToken = "114|3DoZ2jw4urc0SZ0dwR0IITMccTEKkfdWUw1TD4eg";
  }

  String? myToken;
  String mobileTokenAuthKey = "Auth";

  void initializeInterceptors() {
    freePrimaryDio.interceptors.clear();
    tokenDio.interceptors.clear();

    freePrimaryDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers = {
            "Accept": "application/json",
            "Content-Type": "application/json",
          };
          debugPrint("Url : ${options.baseUrl}");
          debugPrint("Headers : ${options.headers}");
          debugPrint("Query Parameters : ${options.queryParameters}");
          debugPrint("Data : ${options.data}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          debugPrint("Response : ${response.data}");
          return handler.next(response);
        },
        onError: (error, handler) {
          debugPrint("Error : ${error.response?.data}");
          return handler.next(error);
        },
      ),
    );
    tokenDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers = {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $myToken",
          };
          debugPrint("Url : ${options.baseUrl}");
          debugPrint("Headers : ${options.headers}");
          debugPrint("Query Parameters : ${options.queryParameters}");
          debugPrint("Data : ${options.data}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          debugPrint("Response : ${response.data}");
          return handler.next(response);
        },
        onError: (error, handler) {
          debugPrint("Error : ${error.response?.data}");
          return handler.next(error);
        },
      ),
    );
  }

  Future<void> getTokenData() async {
     myToken = await CashHelper.getString("token");
  }

  Future<bool> configCashing() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (myToken != null) {
      await _prefs.setString(mobileTokenAuthKey, myToken!);
      return Future.value(true);
    } else {
      await _prefs.remove(mobileTokenAuthKey);
      return Future.value(false);
    }
  }
}
