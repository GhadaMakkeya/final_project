import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veloura/core/widgets/custom_social_button.dart';
import 'package:veloura/features/auth/login/presentation/widgets/auth_text_field.dart';
import 'package:veloura/features/auth/login/presentation/widgets/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRememberMeChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEBE6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                'Veloura',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 45,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF061F3D),
                  letterSpacing: -1,
                ),
              ),
              Text(
                'Curated elegance.',
                style: GoogleFonts.lato(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 40),

              // Card Container
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Sign In',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF061F3D),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const AuthField(
                      label: 'EMAIL ADDRESS',
                      hintText: 'your@email.com',
                      icon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 20),
                    const AuthField(
                      label: 'PASSWORD',
                      hintText: '••••••••',
                      icon: Icons.lock_outline,
                      isPassword: true,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isRememberMeChecked = !isRememberMeChecked;
                            });
                          },
                          borderRadius: BorderRadius.circular(4),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 24,
                                width: 24,
                                child: Checkbox(
                                  value: isRememberMeChecked,
                                  activeColor: const Color(0xFF061F3D),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  side: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.5,
                                  ),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isRememberMeChecked = value!;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Remember me',
                                style: GoogleFonts.lato(
                                  color: Color(0xff57534E),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () => print("Forgot Password Clicked"),
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          child: Text(
                            'Forgot password?',
                            style: GoogleFonts.lato(
                              color: const Color(0xFF061F3D),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // Sign In Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () => print("Sign In Pressed!"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF061F3D),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 2,
                        ),
                        child: Text(
                          'SIGN IN',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 25),

                    // Or Divider
                    Row(
                      children: [
                        const Expanded(child: Divider(thickness: 1)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Or',
                            style: GoogleFonts.lato(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(child: Divider(thickness: 1)),
                      ],
                    ),

                    SizedBox(height: 25),
                    Row(
                      children: [
                        Expanded(
                          child: CustomSocialButton(
                            iconPath: 'assets/images/google.png',
                            onPressed: () {},
                            text: 'Google',
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: CustomSocialButton(
                            iconPath: 'assets/images/facebook.png',
                            onPressed: () {},
                            text: 'Facebook',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  GestureDetector(
                    onTap: () => print("Go to Register Screen"),
                    child: Text(
                      'Register',
                      style: GoogleFonts.playfairDisplay(
                        color: Color(0xFFD9B36E),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
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
