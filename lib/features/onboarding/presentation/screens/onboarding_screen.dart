import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/features/home/presentation/screens/bottom_nav_bar.dart';
import 'package:veloura/features/home/presentation/screens/home_screen.dart';
import 'package:veloura/features/onboarding/domain/data/onboarding_data.dart';
import 'package:veloura/features/onboarding/presentation/widgets/bottom_controls.dart';
import 'package:veloura/features/onboarding/presentation/widgets/onboarding_page_content.dart';
import 'package:veloura/features/onboarding/presentation/widgets/onboarding_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _removeSplash();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.12),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeOut));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.jumpToPage(_currentPage);
      _fadeController.forward();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void _removeSplash() async {
    await Future.delayed(const Duration(seconds: 5));

    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OnboardingAppBar(onSkip: _handleGetStarted),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return OnboardingPageContent(
                    page: pages[index],
                    fadeAnimation: _fadeAnimation,
                    slideAnimation: _slideAnimation,
                  );
                },
              ),
            ),
            BottomControls(
              currentPage: _currentPage,
              pageCount: pages.length,
              onNext: () {
                if (_currentPage < pages.length - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOut,
                  );
                } else {
                  _handleGetStarted();
                }
              },
              onGetStarted: _handleGetStarted,
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }

  void _onPageChanged(int index) {
    setState(() => _currentPage = index);
    _fadeController.reset();
    _fadeController.forward();
  }

  void _handleGetStarted() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Welcome to VELOURA!'),
        backgroundColor: AppColors.primaryColor,
        duration: Duration(seconds: 2),
      ),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const MainNavigation();
        },
      ),
    );
  }
}
