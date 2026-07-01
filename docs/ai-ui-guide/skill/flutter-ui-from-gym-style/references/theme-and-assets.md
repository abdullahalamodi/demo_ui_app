# Theme And Assets

## Theme Structure

Use:

```text
core/theme/
  app_colors.dart
  app_theme.dart
  k_constants.dart
  theme.dart
```

`theme.dart` exports the other theme files.

## Tokens

Create named constants for:

- brand colors
- light/dark backgrounds
- card/fill colors
- grey scale
- warning/info colors
- radii
- page padding
- button heights
- drawer width

Feature widgets should use constants instead of raw design values.

## Typography

Use a configured `TextTheme`. The Gym app uses the `Alexandria` font family and
semantic roles such as:

- `displayMedium`
- `headlineMedium`
- `headlineSmall`
- `titleLarge`
- `titleMedium`
- `bodyLarge`
- `bodyMedium`
- `bodySmall`
- `labelMedium`

Use `.copyWith(...)` from theme styles for variants.

## Context Extensions

Provide helpers similar to:

```dart
extension ContextExtensions on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
  ThemeData get theme => Theme.of(this);
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  S get loc => S.of(this);
}
```

Use these helpers consistently in UI files.

## Assets

Centralize asset paths in `FixedAssets`.

```dart
class FixedAssets {
  static const String _images = 'assets/images/';
  static const String _svg = '${_images}svg/';
  static const String _png = '${_images}png/';
  static const String appLogo = '${_svg}app_logo.svg';
}
```

Rules:

- Register asset folders in `pubspec.yaml`.
- Use `FaIcon(FontAwesomeIcons.name)` from `font_awesome_flutter` for standard
  UI icons.
- Use `SvgPicture.asset(FixedAssets.name)` for SVGs.
- Use `Image.asset(FixedAssets.name)` for local bitmaps.
- Do not use raw asset paths in feature widgets.
