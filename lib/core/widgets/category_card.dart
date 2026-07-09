import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Carte de catégorie avec icône et animation au tap
class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final VoidCallback? onTap;
  final bool isCompact;

  const CategoryCard({
    super.key,
    required this.title,
    required this.icon,
    this.backgroundColor,
    this.iconColor,
    this.onTap,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = backgroundColor ??
        (isDark ? AppColors.darkCard : AppColors.white);
    final icColor = iconColor ??
        (isDark ? AppColors.lightGreen : AppColors.forestGreen);

    if (isCompact) {
      return _buildCompact(context, bgColor, icColor, isDark);
    }
    return _buildFull(context, bgColor, icColor, isDark);
  }

  Widget _buildCompact(
    BuildContext context,
    Color bgColor,
    Color icColor,
    bool isDark,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: icColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: icColor, size: 24),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: 72,
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: isDark ? AppColors.grey300 : AppColors.grey700,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFull(
    BuildContext context,
    Color bgColor,
    Color icColor,
    bool isDark,
  ) {
    return Material(
      color: bgColor,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDark ? AppColors.darkElevated : AppColors.grey200,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: icColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: icColor, size: 24),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppColors.grey200 : AppColors.grey800,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
