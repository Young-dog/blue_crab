import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../app.dart';

class LightThemeBuilder implements ThemeBuilder {
  const LightThemeBuilder();

  @override
  ThemeData build({
    Radiuses radiuses = const Radiuses.regular(),
    Spacings spacings = const Spacings.regular(),
  }) {
    const palette = Palette.light();
    const fontFamily = 'Rubik';

    final textTheme = _defaultTextTheme.apply(
      bodyColor: palette.textPrimary,
      displayColor: palette.textPrimary,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: fontFamily,
      hintColor: palette.textSecondary,
      scaffoldBackgroundColor: palette.bgPrimary,
      canvasColor: palette.bgContrast,
      unselectedWidgetColor: palette.textTertiary,
      textTheme: textTheme,
      progressIndicatorTheme: _buildProgressIndicatorTheme(
        palette: palette,
      ),
      appBarTheme: _buildAppBarTheme(
        palette: palette,
      ),
      extensions: [
        palette,
        radiuses,
        spacings,
      ],
    );
  }

  TextTheme _buildDefaultTextTheme({
    required String fontFamily,
    required Color defaultColor,
  }) {
    final platform = defaultTargetPlatform;
    final typography = Typography.material2021(platform: platform);
    final textTheme = typography.white.merge(typography.englishLike).apply(
          bodyColor: defaultColor,
          displayColor: defaultColor,
          fontFamily: fontFamily,
        );

    return textTheme;
  }

  AppBarTheme _buildAppBarTheme({
    required Palette palette,
  }) {
    return AppBarTheme(
      backgroundColor: palette.bgContrast,
      surfaceTintColor: palette.bgContrast,
      iconTheme: IconThemeData(color: palette.iconPrimary),
    );
  }

  ProgressIndicatorThemeData _buildProgressIndicatorTheme({
    required Palette palette,
  }) {
    return ProgressIndicatorThemeData(
      color: palette.iconPrimary,
    );
  }

  TextTheme get _defaultTextTheme => const TextTheme(
        displayLarge: TextStyle(),
        displayMedium: TextStyle(),
        displaySmall: TextStyle(),
        headlineLarge: TextStyle(),
        headlineMedium: TextStyle(),
        headlineSmall: TextStyle(),
        titleLarge: TextStyle(
          fontSize: 20,
          height: 28 / 20,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          height: 24 / 18,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          height: 20 / 14,
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          height: 20 / 14,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          height: 16 / 12,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: TextStyle(
          fontSize: 11,
          height: 16 / 11,
          letterSpacing: 0,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          height: 24 / 16,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 20 / 14,
          letterSpacing: 0.25,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          height: 16 / 12,
          letterSpacing: 0.4,
          fontWeight: FontWeight.w400,
        ),
      );
}
