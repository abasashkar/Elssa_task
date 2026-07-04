import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/about_sections.dart';
import '../../widgets/trust_badges_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _carouselIndex = 0;

  static const _bannerHeight = 200.0;
  static const _slideCount = 4;

  static const _services = [
    _ServiceItem(AppAssets.iconRenovation, 'Renovation'),
    _ServiceItem(AppAssets.iconHandyman, 'Handyman'),
    _ServiceItem(AppAssets.iconHomeShifting, 'Home shifting'),
    _ServiceItem(AppAssets.iconGardening, 'Gardening'),
    _ServiceItem(AppAssets.iconDeclutter, 'Declutter'),
    _ServiceItem(AppAssets.iconPainting, 'Painting'),
  ];

  static const _cleaningServices = [
    _CleaningServiceCard(
      label: 'Kitchen Cleaning',
      image: AppAssets.kitchenCleaning,
      alignment: Alignment(-0.4, 0),
    ),
    _CleaningServiceCard(
      label: 'Sofa Cleaning',
      image: AppAssets.sofaCleaning,
      alignment: Alignment(0.15, -0.1),
    ),
    _CleaningServiceCard(
      label: 'Full Home Cleaning',
      image: AppAssets.fullHomeCleaning,
      alignment: Alignment(-0.15, 0),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildCarousel(),
              _buildServiceGrid(),
              _buildSectionTitle('Popular Services'),
              _buildServiceCardsList(),
              _buildSectionTitle('Cleaning Services'),
              _buildServiceCardsList(),
              const TrustBadgesRow(),
              const WhyChooseUsSection(),
              const SafetyMeasuresSection(),
              _buildFooter(),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.location_on_outlined,
            color: AppColors.textPrimary,
            size: 22,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Home',
                      style: GoogleFonts.montserrat(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                        height: 1.2,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      size: 18,
                      color: AppColors.textPrimary,
                    ),
                  ],
                ),
                Text(
                  'Inner Circle, Connaught Place, New Delhi, Del...',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textPrimary,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.search,
            color: AppColors.textPrimary,
            size: 22,
          ),
        ],
      ),
    );
  }

  Widget _buildCarousel() {
    return SizedBox(
      height: _bannerHeight,
      child: ClipRect(
        child: Stack(
          fit: StackFit.expand,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: _bannerHeight,
                viewportFraction: 1.0,
                enableInfiniteScroll: true,
                onPageChanged: (index, _) => setState(() => _carouselIndex = index),
              ),
              items: List.generate(_slideCount, (_) => _buildCarouselItem()),
            ),
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: 140,
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.black.withValues(alpha: 0.75),
                        Colors.black.withValues(alpha: 0.55),
                        Colors.black.withValues(alpha: 0.2),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.45, 0.78, 1.0],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 14,
              top: 0,
              bottom: 0,
              child: IgnorePointer(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _services.map(_buildBannerServiceRow).toList(),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: IgnorePointer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_slideCount, (i) {
                    return Container(
                      width: 6,
                      height: 6,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: i == _carouselIndex
                            ? Colors.white
                            : Colors.white.withValues(alpha: 0.4),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBannerServiceRow(_ServiceItem service) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 22,
            height: 22,
            child: SvgPicture.asset(
              service.iconAsset,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            service.label,
            style: GoogleFonts.montserrat(
              fontSize: 11,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselItem() {
    return SizedBox(
      width: double.infinity,
      height: _bannerHeight,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAssets.homeBannerBg,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
          Image.asset(
            AppAssets.homeBannerMan,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            alignment: const Alignment(0.0, -0.15),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.12,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
      itemCount: _services.length,
      itemBuilder: (context, index) {
        final service = _services[index];
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border, width: 0.5),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 38,
                height: 38,
                child: SvgPicture.asset(service.iconAsset),
              ),
              const SizedBox(height: 8),
              Text(
                service.label,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                  height: 1.1,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 10),
      child: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildServiceCardsList() {
    return SizedBox(
      height: 148,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _cleaningServices.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, index) => _buildServiceCard(_cleaningServices[index]),
      ),
    );
  }

  Widget _buildServiceCard(_CleaningServiceCard service) {
    return SizedBox(
      width: 136,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 136,
              height: 108,
              child: Image.asset(
                service.image,
                fit: BoxFit.cover,
                alignment: service.alignment,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            service.label,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.montserrat(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'HASSLE FREE QUALITY SERVICE',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.textLight,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'V 1.0',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 11,
                color: AppColors.textLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceItem {
  const _ServiceItem(this.iconAsset, this.label);
  final String iconAsset;
  final String label;
}

class _CleaningServiceCard {
  const _CleaningServiceCard({
    required this.label,
    required this.image,
    this.alignment = Alignment.center,
  });

  final String label;
  final String image;
  final Alignment alignment;
}
