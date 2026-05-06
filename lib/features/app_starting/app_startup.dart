import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veloura/core/services/secure_storage_services.dart';
import 'package:veloura/features/auth/login/presentation/screens/login_screen.dart';
import 'package:veloura/features/home/presentation/screens/home_screen.dart';
import 'package:veloura/features/onboarding/presentation/screens/onboarding_screen.dart';

Future<Widget> getStartScreen() async {
  final prefs = await SharedPreferences.getInstance();
  final bool seenOnboarding = prefs.getBool('seen_onboarding') ?? false;

  final secureStorage = SecureStorageServices();
  final String? token = await secureStorage.getAccessToken();

  if (!seenOnboarding) {
    return const OnboardingScreen();
  }

  if (token != null) {
    return HomeScreen();
  }
  return const LoginScreen();
}
