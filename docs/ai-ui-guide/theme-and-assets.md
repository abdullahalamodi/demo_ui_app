# Theme And Assets

The UI should have one clear theme and asset system. Derive colors, spacing,
typography, radii, component defaults, and image references from the project
being built instead of copying exact values from a source app.

Use the source project as visual direction, then translate it into semantic
tokens that fit this app's structure, content density, platform targets, and
brand needs.

## Theme Files

Use a small central theme module. A typical structure is:

```text
core/theme/
  app_colors.dart
  app_theme.dart
  k_constants.dart
  theme.dart
```

`theme.dart` should export the other theme files. If the project already has a
different theme structure, extend that structure instead of creating a parallel
one.

## Color Tokens

Define colors by role, not by where they happened to appear in a screenshot.
The exact palette should be based on the project, but it should usually include
tokens for:

- primary and secondary brand actions
- light and dark backgrounds
- surfaces, cards, dividers, and input fills
- readable foreground text at high, medium, and disabled emphasis
- neutral grey steps for borders, labels, and inactive UI
- success, warning, info, and destructive states
- overlay, shadow, and scrim colors when used repeatedly

Keep raw hex values inside the theme layer. Feature widgets should use
`context.colorScheme`, `context.theme`, `context.customColors`, or named color
tokens instead of direct color literals.

## Size And Spacing Tokens

Create named constants for repeated layout values. Choose the exact numbers from
the project design and adjust them for mobile, tablet, and desktop density.
Common token groups include:

- page and section padding
- small, medium, and large gaps
- card, sheet, dialog, field, button, and image radii
- standard control heights
- toolbar, bottom bar, drawer, and navigation widths
- icon sizes and avatar sizes
- grid/list spacing and maximum content widths

Use semantic names that describe intent, such as compact gap, page padding, card
radius, or primary button height. Avoid naming constants after one current
screen unless the value is truly screen-specific.

Feature widgets may use one-off layout values only when the value is local to a
single composition and would not be reused elsewhere.

## Typography

Configure the project font family and `TextTheme` in `AppTheme`. Pick type
scale values that match the product's density and reading needs instead of
copying exact sizes from another app.

Use Material text roles consistently:

- display styles for rare hero or welcome text
- headline styles for page and major section titles
- title styles for cards, dialogs, tabs, and compact headings
- body styles for normal content
- label styles for buttons, chips, hints, metadata, and form labels

Do not build complete `TextStyle` objects inside feature widgets unless a
theme token does not exist. Prefer deriving from the theme:

```dart
style: context.textTheme.bodyMedium!.copyWith(
  color: context.colorScheme.onSurfaceVariant,
)
```

Add new theme text styles or extensions when the same typography variant appears
in several places.

## Theme Evolution During Early Deployment

The theme, font sizes, typography, and component defaults are still expected to
evolve while features are being deployed. Treat the theme as a shared contract,
not as a finished design system.

Before changing an existing theme token, text role, component default, radius,
spacing value, or color role:

- Search for existing usages and inspect the affected screens or widgets.
- Decide whether the requested feature needs a new variant instead of changing
  the shared token.
- Avoid changing a shared typography role, such as `headlineMedium`, when it is
  already used by other screens and the change is only needed for one new page
  or widget.
- Update shared theme values only when the new behavior is intended for every
  existing usage of that token.
- Check for responsive and localization impact, especially text overflow on
  narrow screens.

When adding a new widget or page, first reuse existing theme roles and tokens.
If no suitable token exists, add the smallest reusable theme addition that
matches the new pattern. Keep one-off styling local until the same visual choice
appears in several places.

Document meaningful new theme tokens or typography variants in this guide as
the design system matures.

## Component Theme Defaults

Configure shared appearance in `AppTheme` so feature widgets inherit consistent
behavior by default. Include the component themes that the project actually
uses, such as:

- `ColorScheme` for light and dark themes
- `TextTheme` and `fontFamily`
- `Scaffold`, `AppBar`, `NavigationBar`, `NavigationRail`, and `Drawer`
- `Card`, `Dialog`, `BottomSheet`, and `SnackBar`
- `InputDecoration`, `DropdownMenu`, `Checkbox`, `Radio`, and `Switch`
- `ElevatedButton`, `FilledButton`, `OutlinedButton`, `TextButton`, and FABs
- `TabBar`, `Chip`, `Divider`, `Icon`, and tooltip defaults
- custom `ThemeExtension` values for project-specific tokens

Feature widgets may override a component for a clear variant, such as a
destructive button or highlighted status chip. The default shape, density,
padding, text style, and color behavior should come from the theme.

## Context Extensions

Provide a `BuildContext` extension for common UI accessors. Keep it aligned with
the project's localization, custom theme extensions, and image/icon helpers:

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

Add helpers here only when they are generic and widely useful, such as snackbar
display, responsive breakpoint checks, or shared SVG color filters.

## Assets

Use one asset constants class or a small asset constants module. Match folder
names to the project rather than copying a source app's asset tree.

Example:

```dart
class FixedAssets {
  static const String _png = 'assets/images/png/';
  static const String _svg = 'assets/images/svg/';

  // pngs
  static const String background = '${_png}background.png';

  // svgs
  static const String logoWhite = '${_svg}logo-white.svg';

}
```

Rules:

- Register asset folders or files in `pubspec.yaml`.
- Use `FaIcon(FontAwesomeIcons.name)` for reusable UI icons from
  `font_awesome_flutter`.
- Use `SvgPicture.asset(FixedAssets.name)` for SVG assets.
- Use `Image.asset(FixedAssets.name)` for local bitmap assets.
- Use shared image widgets for repeated sizing, clipping, placeholders, and
  error behavior.
- Do not place raw asset paths inside feature widgets.
- Prefer descriptive asset names based on their role in the UI, not temporary
  file names from design exports.

## Responsive Sizing

Design tokens should support the breakpoints the app needs. Use responsive
helpers or layout constraints for changes in:

- page horizontal padding
- grid column counts
- max content width
- navigation pattern, such as bottom bar versus rail or drawer
- dialog and sheet width
- image aspect ratios and card density

Do not scatter breakpoint checks across unrelated widgets. Keep shared
breakpoints and responsive calculations in theme constants, layout helpers, or
context extensions.

## Card And Surface Style

Build repeated surfaces from theme tokens:

```dart
Container(
  padding: EdgeInsets.all(kCardPadding),
  decoration: BoxDecoration(
    color: context.theme.cardColor,
    borderRadius: BorderRadius.circular(kCardRadius),
    border: Border.all(color: context.colorScheme.outlineVariant),
  ),
  child: child,
)
```

Use project-defined radius, padding, border, elevation, and surface colors. Cards
should feel consistent across the app, but specific surfaces can have named
variants when the product needs them.
