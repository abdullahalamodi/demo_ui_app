import '../../common_libs.dart';

extension ContextExtensions on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);
  ThemeData get theme => Theme.of(this);
  bool get isDark => theme.brightness == Brightness.dark;
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  AppColors get customColors => theme.extension<AppColors>()!;
  S get loc => S.of(this);

  bool get isCompact => screenSize.width < 600;
  bool get isExpanded => screenSize.width >= 1024;
}
