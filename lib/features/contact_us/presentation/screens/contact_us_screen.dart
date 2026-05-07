import 'package:flutter/material.dart';
import 'package:veloura/core/constants/app_font_families.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/widgets/custom_app_bar.dart';
import 'package:veloura/core/widgets/custom_primary_button.dart';
import 'package:veloura/features/contact_us/presentation/widgets/contact_form.dart';
import 'package:veloura/features/contact_us/presentation/widgets/contact_info.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: CustomAppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios, color: colors.primary),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_bag_outlined, color: colors.primary),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Contact Us',
                  style: textTheme.headlineMedium?.copyWith(
                    fontFamily: AppFontFamilies.georgia,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Experience unparalleled service. Our concierge team is dedicated to assisting you with any inquiries regarding our collections or your recent orders.',
                  style: textTheme.bodyMedium?.copyWith(
                    color: colors.textSecondary,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                    color: colors.authCardColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        ContactForm(
                          label: 'FULL NAME',
                          hint: 'Jane Doe',
                          maxLines: 1,
                        ),
                        const SizedBox(height: 32),
                        ContactForm(
                          label: 'EMAIL ADDRESS',
                          hint: 'jane@example.com',
                          maxLines: 1,
                        ),
                        const SizedBox(height: 32),
                        ContactForm(
                          label: 'MESSAGE',
                          hint: 'How may we assist you today?',
                          maxLines: 4,
                        ),
                        const SizedBox(height: 32),
                        CustomPrimaryButton(
                          onPressed: () {},
                          label: 'SEND MESSAGE',
                          letterSpacing: 1.5,
                          borderRadius: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Concierge Inquiry',
                      style: textTheme.headlineSmall?.copyWith(
                        color: colors.primary,
                      ),
                    ),
                    Divider(color: colors.border),
                    ContactInfo(
                      title: 'Email',
                      subtitle: 'hello@veloura.com',
                      icon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 20),
                    ContactInfo(
                      title: 'Phone',
                      subtitle: '+1 (555) 123-4567',
                      icon: Icons.phone_outlined,
                    ),
                    const SizedBox(height: 20),
                    ContactInfo(
                      title: 'ATELIER',
                      subtitle: '123 Rue de la Mode, Paris, France 75001',
                      icon: Icons.location_on,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
