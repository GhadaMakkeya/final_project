import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veloura/core/services/secure_storage_services.dart';
import 'package:veloura/core/widgets/bottom_nav_bar.dart';
import 'package:veloura/features/auth/login/presentation/screens/login_screen.dart';
import 'package:veloura/features/onboarding/presentation/screens/onboarding_screen.dart';

Future<Widget> getStartScreen() async {
  final prefs = await SharedPreferences.getInstance();
  final bool seenOnboarding = prefs.getBool('seen_onboarding') ?? false;

  if (!seenOnboarding) {
    return const OnboardingScreen();
  }

  final secureStorage = SecureStorageServices();
  final String? token = await secureStorage.getAccessToken();
  final DateTime? expiresAt = await secureStorage.getExpiresAt();

  final bool isTokenValid = token != null &&
      expiresAt != null &&
      DateTime.now().isBefore(expiresAt);

  if (isTokenValid) {
    return const MainNavigation(); 
  }

  await secureStorage.clearAuthData();
  return const LoginScreen();
}
