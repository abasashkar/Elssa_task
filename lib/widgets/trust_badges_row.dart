import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constants/app_assets.dart';
import '../core/theme/app_colors.dart';

class TrustBadgesRow extends StatelessWidget {
  const TrustBadgesRow({super.key});

  static const _badgeCircleColor = Color(0xFFEDFFEE);
  static const _iconSize = 45.0;

  static const _badges = [
    _BadgeData(AppAssets.iconOnDemandScheduled, 'On Demand\n/ Scheduled'),
    _BadgeData(AppAssets.iconVerifiedPartners, 'Verified\nPartners', isSvg: false),
    _BadgeData(AppAssets.iconSatisfactionGuarantee, 'Satisfaction\nGuarantee', isSvg: false),
    _BadgeData(AppAssets.iconUpfrontPricing, 'Upfront\nPricing'),
    _BadgeData(AppAssets.iconTrainedProfessionals, 'Highly Trained\nProfessionals', isSvg: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.greyBg,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _badges.map((badge) => Expanded(child: _buildBadge(badge))).toList(),
      ),
    );
  }

  Widget _buildBadge(_BadgeData badge) {
    return Column(
      children: [
        _buildBadgeIcon(badge),
        const SizedBox(height: 6),
        Text(
          badge.label,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontSize: 8,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
            height: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _buildBadgeIcon(_BadgeData badge) {
    if (badge.isSvg) {
      return SvgPicture.asset(
        badge.asset,
        width: _iconSize,
        height: _iconSize,
      );
    }

    return Container(
      width: _iconSize,
      height: _iconSize,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: _badgeCircleColor,
      ),
      padding: const EdgeInsets.all(6),
      child: Image.asset(
        badge.asset,
        fit: BoxFit.contain,
      ),
    );
  }
}

class _BadgeData {
  const _BadgeData(this.asset, this.label, {this.isSvg = true});

  final String asset;
  final String label;
  final bool isSvg;
}
