import '../../common_libs.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.success,
    required this.warning,
    required this.info,
    required this.destructive,
    required this.surfaceMuted,
  });

  final Color success;
  final Color warning;
  final Color info;
  final Color destructive;
  final Color surfaceMuted;

  @override
  AppColors copyWith({
    Color? success,
    Color? warning,
    Color? info,
    Color? destructive,
    Color? surfaceMuted,
  }) {
    return AppColors(
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      destructive: destructive ?? this.destructive,
      surfaceMuted: surfaceMuted ?? this.surfaceMuted,
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
    );
  }
}
