import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Barre de recherche stylisée Mobeko
/// Avec support pour la recherche vocale
class MobekoSearchBar extends StatelessWidget {
  final String hintText;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onVoiceTap;
  final TextEditingController? controller;
  final bool readOnly;
  final bool showVoiceButton;
  final FocusNode? focusNode;

  const MobekoSearchBar({
    super.key,
    this.hintText = 'Rechercher...',
    this.onTap,
    this.onChanged,
    this.onVoiceTap,
    this.controller,
    this.readOnly = false,
    this.showVoiceButton = true,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.darkElevated : AppColors.grey200,
        ),
        boxShadow: isDark
            ? null
            : [
                BoxShadow(
                  color: AppColors.forestGreen.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        readOnly: readOnly,
        onTap: onTap,
        onChanged: onChanged,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 15,
          color: isDark ? AppColors.grey200 : AppColors.grey900,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'Inter',
            fontSize: 15,
            color: isDark ? AppColors.grey600 : AppColors.grey400,
          ),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: isDark ? AppColors.grey500 : AppColors.grey400,
          ),
          suffixIcon: showVoiceButton
              ? IconButton(
                  onPressed: onVoiceTap,
                  icon: Icon(
                    Icons.mic_rounded,
                    color: isDark ? AppColors.lightGreen : AppColors.forestGreen,
                  ),
                )
              : null,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
      ),
    );
  }
}
