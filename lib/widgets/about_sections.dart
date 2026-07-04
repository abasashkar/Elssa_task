import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constants/app_assets.dart';
import '../core/theme/app_colors.dart';

class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({super.key});

  static const _cards = [
    _WhyCard(AppAssets.qualityAssurance, 'Quality Assurance', 'Your satisfaction is guaranteed'),
    _WhyCard(
      AppAssets.fixedPrice,
      'Fixed Prices',
      'No hidden costs, all the prices are known and fixed before booking',
    ),
    _WhyCard(AppAssets.hassleFree, 'Hassel free', 'convenient, time saving and secure'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Row(
            children: [
              const Icon(Icons.shield_outlined, size: 20, color: AppColors.textPrimary),
              const SizedBox(width: 8),
              Text(
                'Why Choose Us',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ..._cards.map((card) => _buildCard(card)),
        ],
      ),
    );
  }

  Widget _buildCard(_WhyCard card) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 48,
            height: 48,
            child: Image.asset(
              card.imageAsset,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  card.title,
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  card.subtitle,
                  style: GoogleFonts.montserrat(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WhyCard {
  const _WhyCard(this.imageAsset, this.title, this.subtitle);

  final String imageAsset;
  final String title;
  final String subtitle;
}

class SafetyMeasuresSection extends StatelessWidget {
  const SafetyMeasuresSection({super.key});

  static const _items = [
    _SafetyItem(Icons.masks, 'Usage of masks, gloves & Sanitisers'),
    _SafetyItem(Icons.people_outline, 'Low-contact Service Experience'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 14),
          color: AppColors.safetyHeader,
          child: Text(
            'Best-in Class Safety Measures',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ),
        Container(
          color: AppColors.safetyBg,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: _items.map((item) => _buildItem(item)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildItem(_SafetyItem item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(item.icon, size: 36, color: AppColors.textPrimary),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: GoogleFonts.montserrat(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: GoogleFonts.montserrat(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: GoogleFonts.montserrat(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SafetyItem {
  const _SafetyItem(this.icon, this.title);
  final IconData icon;
  final String title;
}
