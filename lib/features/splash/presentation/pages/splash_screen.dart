import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/constant/app_assets.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/route/route_names.dart';
import 'package:rowad_hrag/core/services/cash_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? _token;
  bool _isFirstTime = false;

  Future<void> _getToken() async {
    _isFirstTime = !(await CashHelper.getBool("isFirstTime"));
    _token = await CashHelper.getString("token");
    await Future.delayed(const Duration(seconds: 3));

    if (_isFirstTime) {
      // mark as visited next time
      pushNamedWhileRemove(
        newPage: RouteNames.onboarding,
        context: context,
      );
    } else if (_token != null) {
      pushNamedWhileRemove(
        newPage: RouteNames.home,
        context: context,
      );
    } else {
      pushNamedWhileRemove(
        newPage: RouteNames.signIn,
        context: context,
      );
    }
  }

  @override
  void initState() {
    // Future.wait([_getToken()]);
    // TODO: implement initState
    super.initState();
    _getToken();
    // Future.delayed(
    //   Duration(seconds: 3),
    //   () => pushNamedWhileRemove(
    //     newPage: RouteNames.home,
    //     // newPage: (_token != null) ? RouteNames.home : RouteNames.signIn,
    //     context: context,
    //   ),
    // );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInUpBig(
        duration: Duration(seconds: 2),
        child: SvgPicture.asset(
          AppAssets.coloredLogo,
        ).center,
      ),
    );
  }
}
