import '../../common_libs.dart';

abstract final class AppTheme {
  static ThemeData light() {
    const colorScheme = ColorScheme.light(
      primary: primaryColor,
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFDDE8FF),
      onPrimaryContainer: Color(0xFF08245F),
      secondary: secondaryColor,
      onSecondary: Color(0xFF10201E),
      secondaryContainer: Color(0xFFDDF1EC),
      onSecondaryContainer: Color(0xFF163A37),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF1F1B1D),
      surfaceContainerHighest: Color(0xFFEAF4F0),
      onSurfaceVariant: Color(0xFF6F7474),
      outline: Color(0xFFD8DEDC),
      outlineVariant: borderColor,
      error: Color(0xFFB42318),
    );

    return _build(
      colorScheme: colorScheme,
      brightness: Brightness.light,
      appColors: const AppColors(
        success: Color(0xFF15803D),
        warning: Color(0xFFB7791F),
        info: primaryColor,
        destructive: Color(0xFFB42318),
        surfaceMuted: Color(0xFFF8FAF9),
        surfaceRaised: Color(0xFFFFFFFF),
        surfaceDisabled: Color(0xFFEEF1F0),
        onSurfaceMuted: Color(0xFF6F7474),
        onSurfaceSubtle: Color(0xFFA6ADAA),
        onSurfaceStrong: Color(0xFF1F1B1D),
        onMedia: Color(0xFFFFFFFF),
        mediaScrimLow: Color(0x29000000),
        mediaScrimMedium: Color(0x33000000),
        mediaScrimHigh: Color(0x57000000),
        focusRing: Color(0xFFBDEBE6),
        borderMuted: borderColor,
        accent: Color(0xFFFFC83D),
        selection: secondaryColor,
        onSelection: Color(0xFF10201E),
        surfaceTinted: Color(0xFFEAF4F0),
        surfaceSelected: Color(0xFFDDF1EC),
        surfaceInverse: Color(0xFF241F21),
        onSurfaceInverse: Color(0xFFFFFFFF),
        iconMuted: Color(0xFFA6ADAA),
        shadowSoft: Color(0x1A000000),
        packageProgress: primaryColor,
      ),
    );
  }

  static ThemeData _build({
    required ColorScheme colorScheme,
    required Brightness brightness,
    required AppColors appColors,
  }) {
    final isDark = brightness == Brightness.dark;
    final selectionOverlay = WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.disabled)) {
        return Colors.transparent;
      }
      if (states.contains(WidgetState.pressed)) {
        return appColors.selection.withValues(alpha: .18);
      }
      if (states.contains(WidgetState.hovered) ||
          states.contains(WidgetState.focused)) {
        return appColors.selection.withValues(alpha: .12);
      }
      return null;
    });
    final baseTextTheme = Typography.material2021(platform: TargetPlatform.iOS)
        .black
        .apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        );
    final textTheme = baseTextTheme.copyWith(
      displayLarge: baseTextTheme.displayLarge?.copyWith(
        fontSize: 28,
        height: 1.08,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      ),
      displayMedium: baseTextTheme.displayMedium?.copyWith(
        fontSize: 24,
        height: 1.1,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      ),
      displaySmall: baseTextTheme.displaySmall?.copyWith(
        fontSize: 20,
        height: 1.15,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      ),
      headlineLarge: baseTextTheme.headlineLarge?.copyWith(
        fontSize: 18,
        height: 1.2,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      ),
      headlineMedium: baseTextTheme.headlineMedium?.copyWith(
        fontSize: 17,
        height: 1.2,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      ),
      headlineSmall: baseTextTheme.headlineSmall?.copyWith(
        fontSize: 16,
        height: 1.22,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      ),
      titleLarge: baseTextTheme.titleLarge?.copyWith(
        fontSize: 16,
        height: 1.25,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      ),
      titleMedium: baseTextTheme.titleMedium?.copyWith(
        fontSize: 14,
        height: 1.25,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      ),
      titleSmall: baseTextTheme.titleSmall?.copyWith(
        fontSize: 13,
        height: 1.25,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      ),
      bodyLarge: baseTextTheme.bodyLarge?.copyWith(
        fontSize: 14,
        height: 1.38,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
      bodyMedium: baseTextTheme.bodyMedium?.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        height: 1.32,
        letterSpacing: 0,
      ),
      bodySmall: baseTextTheme.bodySmall?.copyWith(
        fontSize: 12,
        height: 1.25,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
      labelLarge: baseTextTheme.labelLarge?.copyWith(
        fontSize: 14,
        height: 1.2,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      ),
      labelMedium: baseTextTheme.labelMedium?.copyWith(
        fontSize: 12,
        height: 1.2,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      ),
      labelSmall: baseTextTheme.labelSmall?.copyWith(
        fontSize: 11,
        height: 1.18,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      ),
    );
    final compactLabelStyle = textTheme.labelMedium?.copyWith(
      fontWeight: FontWeight.w700,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: appColors.surfaceMuted,
      textTheme: textTheme,
      extensions: [appColors],
      visualDensity: VisualDensity.compact,
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
        iconTheme: IconThemeData(color: appColors.iconMuted, size: 20),
        actionsIconTheme: IconThemeData(color: appColors.iconMuted, size: 20),
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
          horizontal: 14,
          vertical: 12,
        ),
        constraints: const BoxConstraints(minHeight: kButtonHeight),
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        labelStyle: textTheme.labelMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        prefixIconColor: appColors.iconMuted,
        suffixIconColor: appColors.iconMuted,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadiusM),
          borderSide: BorderSide(color: appColors.borderMuted),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadiusM),
          borderSide: BorderSide(color: appColors.borderMuted),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadiusM),
          borderSide: BorderSide(color: appColors.focusRing, width: 1.2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadiusM),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadiusM),
          borderSide: BorderSide(color: colorScheme.error, width: 1.2),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colorScheme.primary,
        selectionColor: appColors.selection.withValues(alpha: .28),
        selectionHandleColor: colorScheme.primary,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(kButtonHeight),
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          textStyle: textTheme.labelLarge,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kRadiusM),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(kButtonHeight),
          foregroundColor: colorScheme.onSurface,
          backgroundColor: appColors.surfaceRaised,
          side: BorderSide(color: appColors.borderMuted),
          textStyle: textTheme.labelLarge,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kRadiusM),
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
      switchTheme: SwitchThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        splashRadius: 18,
        thumbColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return appColors.surfaceDisabled;
          }
          return appColors.surfaceRaised;
        }),
        trackColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return appColors.surfaceDisabled;
        }),
        trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return appColors.borderMuted;
        }),
        overlayColor: selectionOverlay,
      ),
      radioTheme: RadioThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return appColors.onSurfaceSubtle;
          }
          if (states.contains(WidgetState.selected)) {
            return colorScheme.onSurface;
          }
          return appColors.borderMuted;
        }),
        overlayColor: selectionOverlay,
        splashRadius: 18,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return appColors.surfaceDisabled;
          }
          if (states.contains(WidgetState.selected)) {
            return colorScheme.onSurface;
          }
          return appColors.surfaceRaised;
        }),
        checkColor: WidgetStateProperty.all(appColors.onSurfaceInverse),
        overlayColor: selectionOverlay,
        side: BorderSide(color: appColors.borderMuted),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kRadiusXs),
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
      ),
      chipTheme: ChipThemeData(
        color: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return appColors.surfaceDisabled;
          }
          if (states.contains(WidgetState.selected)) {
            return appColors.selection;
          }
          return appColors.surfaceTinted;
        }),
        backgroundColor: appColors.surfaceTinted,
        selectedColor: appColors.selection,
        disabledColor: appColors.surfaceDisabled,
        surfaceTintColor: Colors.transparent,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kRadiusPill),
        ),
        labelStyle: compactLabelStyle?.copyWith(color: colorScheme.onSurface),
        secondaryLabelStyle: compactLabelStyle?.copyWith(
          color: appColors.onSelection,
        ),
        labelPadding: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        iconTheme: IconThemeData(color: colorScheme.onSurface, size: 14),
        showCheckmark: false,
        brightness: brightness,
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: appColors.onSelection,
        unselectedLabelColor: colorScheme.onSurface,
        labelStyle: compactLabelStyle,
        unselectedLabelStyle: textTheme.labelMedium,
        labelPadding: const EdgeInsets.symmetric(horizontal: 14),
        dividerColor: appColors.borderMuted,
        dividerHeight: 1,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: appColors.selection,
          borderRadius: BorderRadius.circular(kRadiusXs),
        ),
        overlayColor: selectionOverlay,
        splashBorderRadius: BorderRadius.circular(kRadiusXs),
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: 68,
        backgroundColor: colorScheme.surface,
        indicatorColor: colorScheme.primary,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        elevation: 0,
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData?>((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: colorScheme.onPrimary, size: 20);
          }
          return IconThemeData(color: appColors.iconMuted, size: 20);
        }),
        labelTextStyle: WidgetStateProperty.all(textTheme.labelSmall),
      ),
      iconTheme: IconThemeData(color: appColors.iconMuted, size: 20),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surface,
        modalBackgroundColor: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        modalElevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(kRadiusXl)),
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
