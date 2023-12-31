import 'package:flutter/material.dart';

class Palette extends ThemeExtension<Palette> {
  const Palette({
    // Text
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textContrast,
    // Icon
    required this.iconPrimary,
    required this.iconSecondary,
    required this.iconTertiary,
    required this.iconContrast,
    // Background
    required this.bgPrimary,
    required this.bgSecondary,
    required this.bgTertiary,
    required this.bgQuaternary,
    required this.bgContrast,
    // Button
    required this.buttonPrimary,
    required this.buttonSecondary,
    required this.buttonTertiary,
    required this.buttonContrast,
    required this.buttonDisabled,
  });

  const Palette.light()
      : this(
          // Text
          textPrimary: const Color(0xFF343A40),
          textSecondary: const Color(0xFF707C8C),
          textTertiary: const Color(0xFFA0A9B2),
          textContrast: const Color(0xFFFFFFFF),
          // Icon
          iconPrimary: const Color(0xFF343A40),
          iconSecondary: const Color(0xFF707C8C),
          iconTertiary: const Color(0xFFA0A9B2),
          iconContrast: const Color(0xFFFFFFFF),
          // Background
          bgPrimary: const Color(0xFFF4F4F4),
          bgSecondary: const Color(0xFFF2F3F7),
          bgTertiary: const Color(0xFF343A40),
          bgQuaternary: const Color(0xFFFFF2F3),
          bgContrast: const Color(0xFFFFFFFF),
          // Button
          buttonPrimary: const Color(0xFF0077b6),
          buttonSecondary: const Color(0xFF707C8C),
          buttonTertiary: const Color(0xFF343A40),
          buttonContrast: const Color(0xFFF2F3F7),
          buttonDisabled: const Color(0xFFF2F2F2),
        );

  // Text
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textContrast;

  // Icon
  final Color iconPrimary;
  final Color iconSecondary;
  final Color iconTertiary;
  final Color iconContrast;

  // Background
  final Color bgPrimary;
  final Color bgSecondary;
  final Color bgTertiary;
  final Color bgQuaternary;
  final Color bgContrast;

  // Button
  final Color buttonPrimary;
  final Color buttonSecondary;
  final Color buttonTertiary;
  final Color buttonContrast;
  final Color buttonDisabled;



  @override
  Palette copyWith({
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textContrast,
    Color? iconPrimary,
    Color? iconSecondary,
    Color? iconTertiary,
    Color? iconContrast,
    Color? bgPrimary,
    Color? bgSecondary,
    Color? bgTertiary,
    Color? bgQuaternary,
    Color? bgContrast,
    Color? buttonPrimary,
    Color? buttonSecondary,
    Color? buttonTertiary,
    Color? buttonContrast,
    Color? buttonDisabled,
  }) {
    return Palette(
      // Text
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      textContrast: textContrast ?? this.textContrast,
      // Icon
      iconPrimary: iconPrimary ?? this.iconPrimary,
      iconSecondary: iconSecondary ?? this.iconSecondary,
      iconTertiary: iconTertiary ?? this.iconTertiary,
      iconContrast: iconContrast ?? this.iconContrast,
      // Background
      bgPrimary: bgPrimary ?? this.bgPrimary,
      bgSecondary: bgSecondary ?? this.bgSecondary,
      bgTertiary: bgTertiary ?? this.bgTertiary,
      bgQuaternary: bgQuaternary ?? this.bgQuaternary,
      bgContrast: bgContrast ?? this.bgContrast,
      // Button
      buttonPrimary: buttonPrimary ?? this.buttonPrimary,
      buttonSecondary: buttonSecondary ?? this.buttonSecondary,
      buttonTertiary: buttonTertiary ?? this.buttonTertiary,
      buttonContrast: buttonContrast ?? this.buttonContrast,
      buttonDisabled: buttonDisabled ?? this.buttonDisabled,
    );
  }

  @override
  ThemeExtension<Palette> lerp(ThemeExtension<Palette>? other, double t) {
    if (other is! Palette) {
      return this;
    }

    return Palette(
      // Text
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      textContrast: Color.lerp(textContrast, other.textContrast, t)!,
      // Icon
      iconPrimary: Color.lerp(iconPrimary, other.iconPrimary, t)!,
      iconSecondary: Color.lerp(iconSecondary, other.iconSecondary, t)!,
      iconTertiary: Color.lerp(iconTertiary, other.iconTertiary, t)!,
      iconContrast: Color.lerp(iconContrast, other.iconContrast, t)!,
      // Background
      bgPrimary: Color.lerp(bgPrimary, other.bgPrimary, t)!,
      bgSecondary: Color.lerp(bgSecondary, other.bgSecondary, t)!,
      bgTertiary: Color.lerp(bgTertiary, other.bgTertiary, t)!,
      bgQuaternary: Color.lerp(bgQuaternary, other.bgQuaternary, t)!,
      bgContrast: Color.lerp(bgContrast, other.bgContrast, t)!,
      // Button
      buttonPrimary: Color.lerp(buttonPrimary, other.buttonPrimary, t)!,
      buttonSecondary: Color.lerp(buttonSecondary, other.buttonSecondary, t)!,
      buttonTertiary: Color.lerp(buttonTertiary, other.buttonTertiary, t)!,
      buttonContrast: Color.lerp(buttonContrast, other.buttonContrast, t)!,
      buttonDisabled: Color.lerp(buttonDisabled, other.buttonDisabled, t)!,
    );
  }
}
