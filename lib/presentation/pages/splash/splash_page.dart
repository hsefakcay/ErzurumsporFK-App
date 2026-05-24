import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';

/// Splash (açılış) sayfası.
/// Logo ve kulüp adı animasyonlarını yönetir.
class SplashPage extends StatefulWidget {
  final Widget child;

  const SplashPage({super.key, required this.child});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with TickerProviderStateMixin {
  late final AnimationController _bgController;
  late final AnimationController _logoController;
  late final AnimationController _textController;
  late final AnimationController _fadeOutController;

  late final Animation<double> _bgScaleAnimation;
  late final Animation<double> _bgOpacityAnimation;
  late final Animation<double> _logoScaleAnimation;
  late final Animation<double> _logoOpacityAnimation;
  late final Animation<double> _textSlideAnimation;
  late final Animation<double> _textOpacityAnimation;
  late final Animation<double> _fadeOutAnimation;
  late final Animation<double> _shimmerAnimation;

  bool _showContent = false;

  @override
  void initState() {
    super.initState();

    // Background animation - slow zoom and fade in
    _bgController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _bgScaleAnimation = Tween<double>(begin: 1.2, end: 1.0).animate(
      CurvedAnimation(parent: _bgController, curve: Curves.easeOutCubic),
    );
    _bgOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _bgController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    // Logo animation - scale up with bounce
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _logoScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.elasticOut),
    );
    _logoOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      ),
    );

    // Text animation - slide up and fade in
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _textSlideAnimation = Tween<double>(begin: 30.0, end: 0.0).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeOutCubic),
    );
    _textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeOut),
    );

    // Shimmer animation for the line
    _shimmerAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeInOut),
    );

    // Fade out animation
    _fadeOutController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeOutAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _fadeOutController, curve: Curves.easeInCubic),
    );

    _startAnimationSequence();
  }

  Future<void> _startAnimationSequence() async {
    // Start background animation immediately
    _bgController.forward();

    // Start logo after a small delay
    await Future.delayed(const Duration(milliseconds: 600));
    _logoController.forward();

    // Start text after logo begins
    await Future.delayed(const Duration(milliseconds: 500));
    _textController.forward();

    // Wait for all animations to settle
    await Future.delayed(const Duration(milliseconds: 2000));

    // Fade out splash
    await _fadeOutController.forward();

    // Show main content
    if (mounted) {
      setState(() {
        _showContent = true;
      });
    }
  }

  @override
  void dispose() {
    _bgController.dispose();
    _logoController.dispose();
    _textController.dispose();
    _fadeOutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_showContent) {
      return widget.child;
    }

    return AnimatedBuilder(
      animation: Listenable.merge([
        _bgController,
        _logoController,
        _textController,
        _fadeOutController,
      ]),
      builder: (context, child) {
        return Opacity(
          opacity: _fadeOutAnimation.value,
          child: Scaffold(
            backgroundColor: const Color(0xFF020617),
            body: Stack(
              fit: StackFit.expand,
              children: [
                // Background image with zoom effect
                Opacity(
                  opacity: _bgOpacityAnimation.value,
                  child: Transform.scale(
                    scale: _bgScaleAnimation.value,
                    child: Image.asset(
                      AppAssets.splashBgPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Dark overlay gradient
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFF020617).withValues(alpha: 0.3),
                        const Color(0xFF020617).withValues(alpha: 0.5),
                        const Color(0xFF020617).withValues(alpha: 0.85),
                        const Color(0xFF020617).withValues(alpha: 0.95),
                      ],
                      stops: const [0.0, 0.4, 0.7, 1.0],
                    ),
                  ),
                ),

                // Blur overlay
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                  child: Container(color: Colors.transparent),
                ),

                // Content
                SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(flex: 3),

                      // Logo
                      Opacity(
                        opacity: _logoOpacityAnimation.value,
                        child: Transform.scale(
                          scale: _logoScaleAnimation.value,
                          child: Container(
                            width: 140,
                            height: 140,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF1E3A5F)
                                      .withValues(alpha: 0.4),
                                  blurRadius: 40,
                                  spreadRadius: 10,
                                ),
                                BoxShadow(
                                  color: Colors.white
                                      .withValues(alpha: 0.1),
                                  blurRadius: 20,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Image.asset(
                              AppAssets.logoPath,
                              width: 140,
                              height: 140,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Club name
                      Transform.translate(
                        offset: Offset(0, _textSlideAnimation.value),
                        child: Opacity(
                          opacity: _textOpacityAnimation.value,
                          child: Column(
                            children: [
                              const Text(
                                'ERZURUMSPOR',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  letterSpacing: 6,
                                  height: 1.2,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'FUTBOL KULÜBÜ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white
                                      .withValues(alpha: 0.7),
                                  letterSpacing: 8,
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Animated line
                              AnimatedBuilder(
                                animation: _textController,
                                builder: (context, child) {
                                  return Container(
                                    width:
                                        60 * _shimmerAnimation.value,
                                    height: 2,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(1),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF1E3A5F),
                                          Color(0xFF3B82F6),
                                          Color(0xFF1E3A5F),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),

                      const Spacer(flex: 2),

                      // Bottom text
                      Transform.translate(
                        offset: Offset(0, _textSlideAnimation.value),
                        child: Opacity(
                          opacity: _textOpacityAnimation.value * 0.5,
                          child: Text(
                            'EST. 1968',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color:
                                  Colors.white.withValues(alpha: 0.4),
                              letterSpacing: 4,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
