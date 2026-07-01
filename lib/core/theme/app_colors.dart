import '../../common_libs.dart';

// light theme colors
const primaryColor = Color(0xFF0F49C6);
const secondaryColor = Color(0xFF0F766E);
const borderColor = Color(0xFFE2DDD8);

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
    required this.onMedia,
    required this.mediaScrimLow,
    required this.mediaScrimMedium,
    required this.mediaScrimHigh,
    required this.focusRing,
    required this.borderMuted,
    required this.accent,
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
  final Color onMedia;
  final Color mediaScrimLow;
  final Color mediaScrimMedium;
  final Color mediaScrimHigh;
  final Color focusRing;
  final Color borderMuted;
  final Color accent;

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
      onMedia: onMedia ?? this.onMedia,
      mediaScrimLow: mediaScrimLow ?? this.mediaScrimLow,
      mediaScrimMedium: mediaScrimMedium ?? this.mediaScrimMedium,
      mediaScrimHigh: mediaScrimHigh ?? this.mediaScrimHigh,
      focusRing: focusRing ?? this.focusRing,
      borderMuted: borderMuted ?? this.borderMuted,
      accent: accent ?? this.accent,
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
      onMedia: Color.lerp(onMedia, other.onMedia, t)!,
      mediaScrimLow: Color.lerp(mediaScrimLow, other.mediaScrimLow, t)!,
      mediaScrimMedium: Color.lerp(
        mediaScrimMedium,
        other.mediaScrimMedium,
        t,
      )!,
      mediaScrimHigh: Color.lerp(mediaScrimHigh, other.mediaScrimHigh, t)!,
      focusRing: Color.lerp(focusRing, other.focusRing, t)!,
      borderMuted: Color.lerp(borderMuted, other.borderMuted, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
    );
  }
}
