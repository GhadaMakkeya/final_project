import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../constants/app_font_families.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  final Widget? bottomLink;

  const AuthLayout({
    super.key,
    required this.child,
    this.bottomLink,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFB), // Very light background
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 80, // Adjust for padding
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    const Text(
                      'Veloura',
                      style: TextStyle(
                        fontFamily: AppFontFamilies.georgia,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                        letterSpacing: -1,
                      ),
                    ),
                    const SizedBox(height: 40),
                    
                    // Main Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 48.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                        border: Border.all(
                          color: Colors.grey.shade100,
                          width: 1,
                        )
                      ),
                      child: child,
                    ),
                    
                    // Optional bottom link
                    if (bottomLink != null) ...[
                      const SizedBox(height: 40),
                      bottomLink!,
                    ]
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
