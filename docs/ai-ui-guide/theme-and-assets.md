# Theme And Assets

The source app centralizes colors, sizing, typography, component theme defaults,
asset paths, and context helpers. The new UI should do the same.

## Theme Files

Use this structure:

```text
core/theme/
  app_colors.dart
  app_theme.dart
  k_constants.dart
  theme.dart
```

`theme.dart` should export the other files.

## Design Tokens

The source app uses constants such as:

- `primaryColor`
- `secondaryColor`
- `darkBackgroundColor`
- `lightBackgroundColor`
- `grey100` through `grey900`
- `kRadiusL`
- `kRadiusM`
- `kRadiusS`
- `kHorizontalPagePadding`
- `kPagePadding`
- `kPageWithScrollPadding`
- `kButtonHeight`
- `kDrawerWidth`

Use named constants for all repeated design values. Feature widgets should not
invent colors or spacing that should be part of the theme.

## Typography

The source app uses the `Alexandria` font family with weights from 100 to 900.
The text theme uses:

- `displayMedium` for large welcome or hero titles.
- `headlineLarge` and `headlineMedium` for page-level headings.
- `headlineSmall` for card titles and section titles.
- `titleLarge`, `titleMedium`, and `titleSmall` for compact titles.
- `bodyLarge`, `bodyMedium`, and `bodySmall` for normal content.
- `labelLarge`, `labelMedium`, and `labelSmall` for buttons, hints, and labels.

Do not hardcode `TextStyle` from scratch in feature widgets unless a theme token
does not exist. Prefer:

```dart
style: context.textTheme.bodyMedium!.copyWith(color: grey400)
```

## Component Theme Defaults

Configure shared appearance in `AppTheme`:

- `useMaterial3: true`
- `fontFamily: kFontFamily`
- `scaffoldBackgroundColor`
- `cardColor`
- `colorScheme.primary`
- `colorScheme.secondary`
- `appBarTheme`
- `tabBarTheme`
- `inputDecorationTheme`
- `dialogTheme`
- `elevatedButtonTheme`
- `outlinedButtonTheme`
- `textButtonTheme`
- `floatingActionButtonTheme`
- `switchTheme`
- custom `ThemeExtension`

Feature widgets may override button color or radius for a specific variant, but
the default should come from theme.

## Context Extensions

Use a `BuildContext` extension similar to the source app:

```dart
extension ContextExtensions on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
  ThemeData get theme => Theme.of(this);
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  S get loc => S.of(this);

  ColorFilter get svgColorFilter => ColorFilter.mode(
        theme.iconTheme.color!,
        BlendMode.srcIn,
      );
}
```

Keep UI helpers such as snackbar display here when they are generic.

## Assets

Use a single asset constants class:

```dart
class FixedAssets {
  static const String _images = 'assets/images/';
  static const String _svg = '${_images}svg/';
  static const String _png = '${_images}png/';
  static const String _gif = '${_images}gif/';

  static const String appLogo = '${_svg}app_logo.svg';
  static const String emptyState = '${_gif}empty_state.gif';
  static const String arrowBack = '${_svg}arrow_back.svg';
}
```

Rules:

- Register assets in `pubspec.yaml`.
- Use `SvgPicture.asset(FixedAssets.name)` for SVG icons.
- Use `Image.asset(FixedAssets.name)` for local bitmap assets.
- Use shared image widgets for repeated image behavior.
- Do not place raw asset paths inside feature widgets.

## Card And Surface Style

The common card pattern is:

```dart
Container(
  padding: const EdgeInsets.all(16),
  margin: const EdgeInsets.only(bottom: 12),
  decoration: BoxDecoration(
    color: context.theme.cardColor,
    borderRadius: BorderRadius.circular(kRadiusM),
  ),
  child: child,
)
```

Use `kRadiusM` for normal cards and fields. Use `kRadiusL` for larger images,
buttons, and prominent containers.
