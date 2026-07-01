import '../../common_libs.dart';

@immutable
class AppTextStyles extends ThemeExtension<AppTextStyles> {
  const AppTextStyles({
    required this.authHeaderTitle,
    required this.authButtonLabel,
  });

  final TextStyle authHeaderTitle;
  final TextStyle authButtonLabel;

  @override
  AppTextStyles copyWith({
    TextStyle? authHeaderTitle,
    TextStyle? authButtonLabel,
  }) {
    return AppTextStyles(
      authHeaderTitle: authHeaderTitle ?? this.authHeaderTitle,
      authButtonLabel: authButtonLabel ?? this.authButtonLabel,
    );
  }

  @override
  AppTextStyles lerp(ThemeExtension<AppTextStyles>? other, double t) {
    if (other is! AppTextStyles) {
      return this;
    }

    return AppTextStyles(
      authHeaderTitle: TextStyle.lerp(
        authHeaderTitle,
        other.authHeaderTitle,
        t,
      )!,
      authButtonLabel: TextStyle.lerp(
        authButtonLabel,
        other.authButtonLabel,
        t,
      )!,
    );
  }
}
