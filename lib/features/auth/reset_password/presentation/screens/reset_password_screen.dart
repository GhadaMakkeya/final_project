import 'package:flutter/material.dart';
import 'package:veloura/core/constants/app_font_families.dart';
import 'package:veloura/features/auth/reset_password/presentation/widgets/custom_text_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBF9F8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Veloura",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -.8,
                  color: Color(0xff061F3D),
                  fontFamily: AppFontFamilies.georgia,
                ),
              ),
              SizedBox(height: 18),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(33),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "Reset Password",
                          style: TextStyle(
                            color: Color(0xff061F3D),
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Please enter your new password \n below.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF5A5A5A),
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 32),
                      CustomTextField(
                        fieldName: "NEW PASSWORD",
                        hintName: "••••••••",
                        isPassword: true,
                      ),
                      CustomTextField(
                        fieldName: "CONFIRM NEW PASSWORD",
                        hintName: "••••••••",
                        isPassword: true,
                      ),
                      SizedBox(height: 26),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff061F3D),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Reset Password",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back),
                    color: Color(0xff775A1E),
                    iconSize: 18,
                  ),
                  Text(
                    "Back to Login",
                    style: TextStyle(color: Color(0xff775A1E), fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
