import '../../common_libs.dart';

// Light theme colors.
const primaryColor = Color(0xFF0F49C6);
const secondaryColor = Color(0xFF44D2C9);
const borderColor = Color(0xFFD9D6D0);

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.success,
    required this.warning,
    required this.info,
    required this.destructive,
    required this.surfaceMuted,
    required this.surfaceRaised,
    required this.surfaceDisabled,
    required this.onSurfaceMuted,
    required this.onSurfaceSubtle,
    required this.onSurfaceStrong,
    required this.white,
    required this.mediaScrimLow,
    required this.mediaScrimMedium,
    required this.mediaScrimHigh,
    required this.focusRing,
    required this.border,
    required this.accent,
    required this.selection,
    required this.onSelection,
    required this.surfaceTinted,
    required this.surfaceSelected,
    required this.surfaceInverse,
    required this.onSurfaceInverse,
    required this.iconMuted,
    required this.shadowSoft,
    required this.packageProgress,
  });

  final Color success;
  final Color warning;
  final Color info;
  final Color destructive;
  final Color surfaceMuted;
  final Color surfaceRaised;
  final Color surfaceDisabled;
  final Color onSurfaceMuted;
  final Color onSurfaceSubtle;
  final Color onSurfaceStrong;
  final Color white;
  final Color mediaScrimLow;
  final Color mediaScrimMedium;
  final Color mediaScrimHigh;
  final Color focusRing;
  final Color border;
  final Color accent;
  final Color selection;
  final Color onSelection;
  final Color surfaceTinted;
  final Color surfaceSelected;
  final Color surfaceInverse;
  final Color onSurfaceInverse;
  final Color iconMuted;
  final Color shadowSoft;
  final Color packageProgress;

  @override
  AppColors copyWith({
    Color? success,
    Color? warning,
    Color? info,
    Color? destructive,
    Color? surfaceMuted,
    Color? surfaceRaised,
    Color? surfaceDisabled,
    Color? onSurfaceMuted,
    Color? onSurfaceSubtle,
    Color? onSurfaceStrong,
    Color? onMedia,
    Color? mediaScrimLow,
    Color? mediaScrimMedium,
    Color? mediaScrimHigh,
    Color? focusRing,
    Color? borderMuted,
    Color? accent,
    Color? selection,
    Color? onSelection,
    Color? surfaceTinted,
    Color? surfaceSelected,
    Color? surfaceInverse,
    Color? onSurfaceInverse,
    Color? iconMuted,
    Color? shadowSoft,
    Color? packageProgress,
  }) {
    return AppColors(
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      destructive: destructive ?? this.destructive,
      surfaceMuted: surfaceMuted ?? this.surfaceMuted,
      surfaceRaised: surfaceRaised ?? this.surfaceRaised,
      surfaceDisabled: surfaceDisabled ?? this.surfaceDisabled,
      onSurfaceMuted: onSurfaceMuted ?? this.onSurfaceMuted,
      onSurfaceSubtle: onSurfaceSubtle ?? this.onSurfaceSubtle,
      onSurfaceStrong: onSurfaceStrong ?? this.onSurfaceStrong,
      white: onMedia ?? white,
      mediaScrimLow: mediaScrimLow ?? this.mediaScrimLow,
      mediaScrimMedium: mediaScrimMedium ?? this.mediaScrimMedium,
      mediaScrimHigh: mediaScrimHigh ?? this.mediaScrimHigh,
      focusRing: focusRing ?? this.focusRing,
      border: borderMuted ?? border,
      accent: accent ?? this.accent,
      selection: selection ?? this.selection,
      onSelection: onSelection ?? this.onSelection,
      surfaceTinted: surfaceTinted ?? this.surfaceTinted,
      surfaceSelected: surfaceSelected ?? this.surfaceSelected,
      surfaceInverse: surfaceInverse ?? this.surfaceInverse,
      onSurfaceInverse: onSurfaceInverse ?? this.onSurfaceInverse,
      iconMuted: iconMuted ?? this.iconMuted,
      shadowSoft: shadowSoft ?? this.shadowSoft,
      packageProgress: packageProgress ?? this.packageProgress,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }

    return AppColors(
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
      destructive: Color.lerp(destructive, other.destructive, t)!,
      surfaceMuted: Color.lerp(surfaceMuted, other.surfaceMuted, t)!,
      surfaceRaised: Color.lerp(surfaceRaised, other.surfaceRaised, t)!,
      surfaceDisabled: Color.lerp(surfaceDisabled, other.surfaceDisabled, t)!,
      onSurfaceMuted: Color.lerp(onSurfaceMuted, other.onSurfaceMuted, t)!,
      onSurfaceSubtle: Color.lerp(onSurfaceSubtle, other.onSurfaceSubtle, t)!,
      onSurfaceStrong: Color.lerp(onSurfaceStrong, other.onSurfaceStrong, t)!,
      white: Color.lerp(white, other.white, t)!,
      mediaScrimLow: Color.lerp(mediaScrimLow, other.mediaScrimLow, t)!,
      mediaScrimMedium: Color.lerp(
        mediaScrimMedium,
        other.mediaScrimMedium,
        t,
      )!,
      mediaScrimHigh: Color.lerp(mediaScrimHigh, other.mediaScrimHigh, t)!,
      focusRing: Color.lerp(focusRing, other.focusRing, t)!,
      border: Color.lerp(border, other.border, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      selection: Color.lerp(selection, other.selection, t)!,
      onSelection: Color.lerp(onSelection, other.onSelection, t)!,
      surfaceTinted: Color.lerp(surfaceTinted, other.surfaceTinted, t)!,
      surfaceSelected: Color.lerp(surfaceSelected, other.surfaceSelected, t)!,
      surfaceInverse: Color.lerp(surfaceInverse, other.surfaceInverse, t)!,
      onSurfaceInverse: Color.lerp(
        onSurfaceInverse,
        other.onSurfaceInverse,
        t,
      )!,
      iconMuted: Color.lerp(iconMuted, other.iconMuted, t)!,
      shadowSoft: Color.lerp(shadowSoft, other.shadowSoft, t)!,
      packageProgress: Color.lerp(packageProgress, other.packageProgress, t)!,
    );
  }
}
