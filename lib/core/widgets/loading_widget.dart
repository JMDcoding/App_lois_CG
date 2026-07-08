import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Widget de chargement animÃ© avec le thÃ¨me Mobeko
class MobekoLoadingWidget extends StatelessWidget {
  final String? message;
  final double size;
  final Color? color;

  const MobekoLoadingWidget({
    super.key,
    this.message,
    this.size = 40,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(
                color ?? (isDark ? AppColors.lightGreen : AppColors.forestGreen),
              ),
            ),
          ),
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(
              message!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isDark ? AppColors.grey400 : AppColors.grey600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}

/// Widget de chargement plein Ã©cran avec fond semi-transparent
class MobekoFullScreenLoading extends StatelessWidget {
  final String? message;

  const MobekoFullScreenLoading({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      child: MobekoLoadingWidget(
        message: message,
        size: 48,
        color: AppColors.white,
      ),
    );
  }
}
