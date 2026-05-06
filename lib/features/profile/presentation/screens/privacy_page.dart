import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/privacy_card.dart';
import '../widgets/cookies_section.dart';
import '../widgets/security_section.dart';
import '../widgets/privacy_image.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFDF8F5),
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              _buildHeader(),

              const PrivacyImage(
                imagePath:
                    'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?q=80&w=1000',
                imageUrl: '',
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const Column(
                  children: [
                    PrivacyCard(
                      icon: Icons.assignment_outlined,
                      title: 'Data Collection',
                      body:
                          'We collect information you provide directly to us...',
                    ),
                    SizedBox(height: 16),
                    PrivacyCard(
                      icon: Icons.person_outline,
                      title: 'Your Rights',
                      body:
                          'You have the right to access, correct, or delete your data...',
                    ),
                  ],
                ),
              ),

              const PrivacyImage(
                imagePath:
                    'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?q=80&w=1000',
                imageUrl: '',
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CookiesSection(),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: SecuritySection(),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 30.h),
                child: _buildContactButton(),
              ),

              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.all(30.w),
      child: Column(
        children: [
          Text(
            'Privacy Policy',
            style: TextStyle(
              fontSize: 32.sp,
              fontFamily: 'Georgia',
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Last updated: October 24, 2023',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildContactButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0D1B2A),
          minimumSize: Size(double.infinity, 50.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        child: const Text(
          'CONTACT CONCIERGE',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
