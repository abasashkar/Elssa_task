import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/common_widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const BackButtonWidget(),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  'Welcome Back!',
                  style: GoogleFonts.montserrat(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 36),
              SocialButton(
                label: 'CONTINUE WITH FACEBOOK',
                backgroundColor: AppColors.facebook,
                textColor: AppColors.white,
                borderColor: AppColors.facebook,
                icon: Image.asset(
                  AppAssets.facebookLogo,
                  width: 22,
                  height: 22,
                  fit: BoxFit.contain,
                ),
                onPressed: () {},
              ),
              const SizedBox(height: 14),
              SocialButton(
                label: 'CONTINUE WITH GOOGLE',
                backgroundColor: AppColors.white,
                textColor: AppColors.textSecondary,
                borderColor: AppColors.border,
                icon: Image.asset(
                  AppAssets.googleLogo,
                  width: 22,
                  height: 22,
                  fit: BoxFit.contain,
                ),
                onPressed: () {},
              ),
              const SizedBox(height: 28),
              Center(
                child: Text(
                  'OR CONTINUE WITH PHONE NUMBER',
                  style: GoogleFonts.montserrat(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textLight,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const PhoneInputField(),
              const SizedBox(height: 20),
              PrimaryButton(
                label: 'LOG IN',
                onPressed: () => Navigator.pushNamed(context, AppRoutes.location),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Forgot Password?',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: GestureDetector(
                  onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.signUp),
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.montserrat(fontSize: 12, color: AppColors.textSecondary),
                      children: [
                        const TextSpan(text: "DON'T HAVE AN ACCOUNT?  "),
                        TextSpan(
                          text: 'SIGN UP',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColors.accentBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
