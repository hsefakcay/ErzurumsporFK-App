import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../domain/models/product.dart';
import '../../../widgets/common_widgets.dart';

/// Auto-rotating product banner carousel for the shop page.
/// Cycles through all products automatically every 4 seconds.
/// Users can also swipe manually to browse products.
class ShopBanner extends StatefulWidget {
  final List<Product> products;

  const ShopBanner({super.key, required this.products});

  @override
  State<ShopBanner> createState() => _ShopBannerState();
}

class _ShopBannerState extends State<ShopBanner> {
  late final PageController _pageController;
  Timer? _autoScrollTimer;
  int _currentPage = 0;

  /// Duration between auto-scroll transitions
  static const _autoScrollInterval = Duration(seconds: 4);

  /// Duration of the page transition animation
  static const _transitionDuration = Duration(milliseconds: 600);

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  /// Starts the auto-scroll timer that cycles through products.
  void _startAutoScroll() {
    if (widget.products.length <= 1) return;
    _autoScrollTimer = Timer.periodic(_autoScrollInterval, (_) {
      final nextPage = (_currentPage + 1) % widget.products.length;
      _pageController.animateToPage(
        nextPage,
        duration: _transitionDuration,
        curve: Curves.easeInOut,
      );
    });
  }

  /// Resets the auto-scroll timer (e.g., after user interaction).
  void _resetAutoScroll() {
    _autoScrollTimer?.cancel();
    _startAutoScroll();
  }

  /// Opens the external store URL in the default browser.
  Future<void> _launchStore() async {
    final uri = Uri.parse(AppUrls.store);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.products.isEmpty) return const SizedBox.shrink();

    final screenHeight = MediaQuery.of(context).size.height;
    final bannerHeight = (screenHeight * 0.45).clamp(280.0, 420.0);

    return Column(
      children: [
        // Main banner carousel
        Container(
          height: bannerHeight,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.8),
                blurRadius: 40,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Swipeable page view
              PageView.builder(
                controller: _pageController,
                itemCount: widget.products.length,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                  _resetAutoScroll();
                },
                itemBuilder: (context, index) {
                  return _buildBannerSlide(widget.products[index]);
                },
              ),
              // Gold accent line at top
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 4,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.primary, AppColors.tertiaryFixed, Colors.transparent],
                    ),
                  ),
                ),
              ),
              // "Buy Now" button overlay
              Positioned(
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: GoldButton(
                    label: 'Hemen Al',
                    icon: Icons.shopping_bag,
                    onPressed: _launchStore,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Page indicator dots
        _buildPageIndicator(),
      ],
    );
  }

  /// Builds a single banner slide for the given product.
  Widget _buildBannerSlide(Product product) {
    if (product.isLocalAsset) {
      return Image.asset(
        product.localAssetPath!,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
        errorBuilder: (_, __, ___) => Container(color: AppColors.surfaceContainer),
      );
    }
    return Container(color: AppColors.surfaceContainer);
  }

  /// Builds the dot-style page indicator below the banner.
  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.products.length,
        (index) => GestureDetector(
          onTap: () {
            _pageController.animateToPage(
              index,
              duration: _transitionDuration,
              curve: Curves.easeInOut,
            );
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: _currentPage == index ? 24 : 8,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: _currentPage == index
                  ? AppColors.primary
                  : AppColors.onSurfaceVariant.withValues(alpha: 0.3),
            ),
          ),
        ),
      ),
    );
  }
}
