import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF1A1A1A); // ខ្មៅងងឹត
  static const Color surface = Color(0xFF2D2D2D);    // ប្រផេះចាស់ (Card)
  static const Color primaryGreen = Color(0xFF388E3C); // បៃតង Minecraft
  static const Color accentGreen = Color(0xFF4CAF50);  // បៃតងភ្លឺ
  static const Color textMain = Colors.white;
  static const Color textSecondary = Colors.grey;
}

class AppStyles {
  static TextStyle titleStyle = const TextStyle(
    color: AppColors.textMain,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
  );

  static TextStyle subtitleStyle = const TextStyle(
    color: AppColors.textSecondary,
    fontSize: 14,
  );

  static BoxDecoration cardDecoration = BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        blurRadius: 8,
        offset: const Offset(0, 4),
      ),
    ],
  );
}
