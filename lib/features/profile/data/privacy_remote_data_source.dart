import 'dart:developer';

class PrivacyRemoteDataSource {
  // هنا بنحط الـ Logic بتاع جلب البيانات لو احتجنا مستقبلاً
  Future<void> fetchPrivacyPolicy() async {
    try {
      // محاكاة لطلب API
      await Future.delayed(const Duration(seconds: 1));
      log("Privacy data fetched successfully");
    } catch (e) {
      throw Exception("Failed to load privacy data: $e");
    }
  }
}
