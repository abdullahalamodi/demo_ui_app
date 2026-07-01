import '../../common_libs.dart';

abstract final class AppTheme {
  static ThemeData light() {
    const colorScheme = ColorScheme.light(
      primary: primaryColor,
      onPrimary: Color(0xFFFFFFFF),
      secondary: secondaryColor,
      onSecondary: Color(0xFFFFFFFF),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF111827),
      surfaceContainerHighest: Color(0xFFF3F4F6),
      outline: Color(0xFFD1D5DB),
      outlineVariant: borderColor,
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
        surfaceRaised: Color(0xFFFFFFFF),
        surfaceDisabled: Color(0xFFD5D5D5),
        onSurfaceMuted: Color(0xFF555555),
        onSurfaceSubtle: Color(0xFF9A9A9A),
        onSurfaceStrong: Color(0xFF050505),
        onMedia: Color(0xFFFFFFFF),
        mediaScrimLow: Color(0x29000000),
        mediaScrimMedium: Color(0x0A000000),
        mediaScrimHigh: Color(0x57000000),
        focusRing: Color(0xFFCCD8EE),
        borderMuted: borderColor,
        accent: Color(0xFFFFB532),
      ),
    );
  }

  static ThemeData _build({
    required ColorScheme colorScheme,
    required Brightness brightness,
    required AppColors appColors,
  }) {
    final isDark = brightness == Brightness.dark;
    final baseTextTheme = Typography.material2021(platform: TargetPlatform.iOS)
        .black
        .apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        );
    final textTheme = baseTextTheme.copyWith(
      displayLarge: baseTextTheme.displayLarge?.copyWith(
        fontSize: 46,
        height: .98,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
      headlineMedium: baseTextTheme.headlineMedium?.copyWith(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      ),
      titleLarge: baseTextTheme.titleLarge?.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w800,
        letterSpacing: 0,
      ),
      titleMedium: baseTextTheme.titleMedium?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      ),
      bodyLarge: baseTextTheme.bodyLarge?.copyWith(
        fontSize: 17,
        height: 1.35,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
      bodyMedium: baseTextTheme.bodyMedium?.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        height: 1,
        letterSpacing: 0,
      ),
      bodySmall: baseTextTheme.bodySmall?.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
      labelLarge: baseTextTheme.labelLarge?.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      ),
      labelMedium: baseTextTheme.labelMedium?.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      ),
      labelSmall: baseTextTheme.labelSmall?.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      ),
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
        isDense: true,
        filled: true,
        fillColor: appColors.surfaceRaised,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 17,
        ),
        suffixIconColor: colorScheme.onSurface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadiusS),
          borderSide: BorderSide(color: appColors.borderMuted),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadiusS),
          borderSide: BorderSide(color: appColors.borderMuted),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadiusS),
          borderSide: BorderSide(color: appColors.focusRing, width: 1.2),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colorScheme.onSurface,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(kButtonHeight),
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          textStyle: textTheme.labelLarge,
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
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: appColors.onSurfaceMuted,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          textStyle: textTheme.bodySmall,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        side: BorderSide(color: appColors.onSurfaceSubtle),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        space: 1,
        thickness: 1,
      ),
    );
  }
}
