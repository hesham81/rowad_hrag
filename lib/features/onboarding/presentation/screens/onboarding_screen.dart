import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/services/cash_helper.dart';
import 'package:rowad_hrag/core/route/route_names.dart';
import 'package:rowad_hrag/features/onboarding/presentation/widgets/onboarding_page_forth.dart';
import 'package:rowad_hrag/features/onboarding/presentation/widgets/onboarding_page_one.dart';
import 'package:rowad_hrag/features/onboarding/presentation/widgets/onboarding_page_three.dart';
import 'package:rowad_hrag/features/onboarding/presentation/widgets/onboarding_page_two.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  void _finishOnboarding() async {
    await CashHelper.setBool("isFirstTime", true);
    Navigator.pushReplacementNamed(context, RouteNames.signIn);
  }

  void _goNext() {
     _currentPage < 3 ? //  go to next page
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      ):null;  //  only on last page
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      OnboardingPageOne(),
      OnboardingPageTwo(),
      OnboardingPageThree(),
      OnboardingPageForth()
    ];

    return Scaffold(
      body: GestureDetector(
        onTap: _goNext,
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              // physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index; //  this ensures tracking
                });
              },
              children: pages,
            ),
            // Skip button
            Positioned(
              top: 40,
              right: 16,
              child: TextButton(
                onPressed: _finishOnboarding,
                child: const Text(
                  "Skip",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  
                  ),
                ),
              ),
            ),           
          ],
        ),
      ),
    );
  }
}
