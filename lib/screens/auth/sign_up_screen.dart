import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/common_widgets.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const _illustrationAspectRatio = 620 / 720;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: AspectRatio(
              aspectRatio: _illustrationAspectRatio,
              child: Image.asset(
                AppAssets.signupIllustration,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _buildHeadline(),
                  const SizedBox(height: 10),
                  Text(
                    'Continue with Phone Number',
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 22),
                  const PhoneInputField(),
                  const SizedBox(height: 18),
                  PrimaryButton(
                    label: 'SIGN UP',
                    onPressed: () => Navigator.pushNamed(context, AppRoutes.otp),
                  ),
                  const SizedBox(height: 14),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, AppRoutes.login),
                    child: Text(
                      'VIEW OTHER OPTION',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.accentBlue,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const Spacer(),
                  _buildLoginLink(context),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeadline() {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        style: GoogleFonts.montserrat(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
          height: 1.3,
        ),
        children: const [
          TextSpan(text: 'Your '),
          TextSpan(text: 'Home services Expert'),
        ],
      ),
    );
  }

  Widget _buildLoginLink(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoutes.login),
      child: RichText(
        text: TextSpan(
          style: GoogleFonts.montserrat(fontSize: 12, color: AppColors.textSecondary),
          children: [
            const TextSpan(text: 'ALREADY HAVE AN ACCOUNT?  '),
            TextSpan(
              text: 'LOG IN',
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.accentBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
