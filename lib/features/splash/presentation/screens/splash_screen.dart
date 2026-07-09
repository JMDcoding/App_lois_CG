import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _activeDotIndex = -1;

  @override
  void initState() {
    super.initState();
    
    // Animation controller pour les points (chaque cycle dure environ 1.5s)
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..addListener(() {
        final value = _controller.value;
        if (value < 0.25) {
          if (_activeDotIndex != -1) setState(() => _activeDotIndex = -1);
        } else if (value < 0.5) {
          if (_activeDotIndex != 0) setState(() => _activeDotIndex = 0);
        } else if (value < 0.75) {
          if (_activeDotIndex != 1) setState(() => _activeDotIndex = 1);
        } else {
          if (_activeDotIndex != 2) setState(() => _activeDotIndex = 2);
        }
      })
      ..repeat();

    // Simuler le chargement des données (ex: requêtes réseau, Hive)
    _loadData();
  }

  Future<void> _loadData() async {
    // Remplacer par vos réels chargements initiaux si nécessaire
    await Future.delayed(const Duration(seconds: 4));
    
    if (mounted) {
      context.go(AppRoutes.home);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkSurface : AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            // Logo de l'application
            SizedBox(
              width: 150,
              height: 150,
              child: Image.asset(
                'assets/images/logo/logo.jpeg',
                errorBuilder: (context, error, stackTrace) {
                  // Fallback temporaire si le logo.png n'est pas encore ajouté
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.forestGreen.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.account_balance_rounded,
                      size: 80,
                      color: AppColors.forestGreen,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            // Message de bienvenue
            Text(
              'Bienvenue dans Mobeko',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: isDark ? AppColors.white : AppColors.darkGreen,
                letterSpacing: -0.5,
              ),
            ),
            const Spacer(),
            // Les 3 points de chargement
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDot(0, AppColors.forestGreen), // Vert
                const SizedBox(width: 12),
                _buildDot(1, AppColors.warning), // Jaune
                const SizedBox(width: 12),
                _buildDot(2, AppColors.emergency), // Rouge
              ],
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(int index, Color activeColor) {
    final isActive = _activeDotIndex >= index;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final inactiveColor = isDark ? AppColors.darkElevated : AppColors.grey200;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: isActive ? activeColor : inactiveColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
