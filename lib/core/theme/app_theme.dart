import '../../common_libs.dart';

abstract final class AppTheme {
  static ThemeData light() {
    const colorScheme = ColorScheme.light(
      primary: Color(0xFF2563EB),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFF0F766E),
      onSecondary: Color(0xFFFFFFFF),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF111827),
      surfaceContainerHighest: Color(0xFFF3F4F6),
      outline: Color(0xFFD1D5DB),
      outlineVariant: Color(0xFFE5E7EB),
      error: Color(0xFFB91C1C),
    );

    return _build(
      colorScheme: colorScheme,
      brightness: Brightness.light,
      appColors: const AppColors(
        success: Color(0xFF15803D),
        warning: Color(0xFFB45309),
        info: Color(0xFF0369A1),
        destructive: Color(0xFFB91C1C),
        surfaceMuted: Color(0xFFF9FAFB),
      ),
    );
  }

  static ThemeData dark() {
    const colorScheme = ColorScheme.dark(
      primary: Color(0xFF93C5FD),
      onPrimary: Color(0xFF172554),
      secondary: Color(0xFF5EEAD4),
      onSecondary: Color(0xFF042F2E),
      surface: Color(0xFF111827),
      onSurface: Color(0xFFF9FAFB),
      surfaceContainerHighest: Color(0xFF1F2937),
      outline: Color(0xFF4B5563),
      outlineVariant: Color(0xFF374151),
      error: Color(0xFFFCA5A5),
    );

    return _build(
      colorScheme: colorScheme,
      brightness: Brightness.dark,
      appColors: const AppColors(
        success: Color(0xFF86EFAC),
        warning: Color(0xFFFCD34D),
        info: Color(0xFF7DD3FC),
        destructive: Color(0xFFFCA5A5),
        surfaceMuted: Color(0xFF1F2937),
      ),
    );
  }

  static ThemeData _build({
    required ColorScheme colorScheme,
    required Brightness brightness,
    required AppColors appColors,
  }) {
    final isDark = brightness == Brightness.dark;
    final textTheme = Typography.material2021(platform: TargetPlatform.iOS)
        .black
        .apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      textTheme: textTheme,
      extensions: [appColors],
      appBarTheme: AppBarTheme(
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        titleTextStyle: textTheme.titleLarge?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w700,
        ),
      ),
      cardTheme: CardThemeData(
        color: isDark
            ? colorScheme.surfaceContainerHighest
            : colorScheme.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kRadiusM),
          side: BorderSide(color: colorScheme.outlineVariant),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: .45),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadiusS),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadiusS),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadiusS),
          borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(kButtonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kRadiusS),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(kButtonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kRadiusS),
          ),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        space: 1,
        thickness: 1,
      ),
    );
  }
}
