# Localization

The source app uses `intl_utils` with ARB files and generated `S` localization
classes. Keep this pattern for the new app.

## Files

```text
lib/l10n/
  intl_en.arb
  intl_ar.arb
lib/generated/
  l10n.dart
  intl/
```

Generated files are produced by the Flutter Intl tooling. Do not edit generated
files by hand.

## Pubspec Configuration

Use this shape:

```yaml
dependencies:
  flutter_localizations:
    sdk: flutter

dev_dependencies:
  intl_utils: ^2.8.8

flutter:
  generate: true

flutter_intl:
  enabled: true
  class_name: S
  main_locale: en
  arb_dir: lib/l10n
```

## MaterialApp Setup

`MaterialApp.router` should include:

```dart
localizationsDelegates: const [
  S.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
],
supportedLocales: S.delegate.supportedLocales,
locale: Locale(currentLang.name),
onGenerateTitle: (context) => context.loc.apptitle,
```

For UI-first work, `currentLang` can come from local state. Do not add
persistence or providers until requested.

## Access Pattern

Use either of these existing patterns:

```dart
context.loc.settings
S.of(context).settings
```

Prefer `context.loc` in new code because it is shorter and matches the context
extension style.

## ARB Rules

- Add every user-facing string to both `intl_en.arb` and `intl_ar.arb`.
- Keep keys lower camel case.
- Use clear semantic keys such as `productDetails`, `emptyProductsTitle`, and
  `applyFilters`.
- Keep punctuation and casing intentional per locale.
- Do not hardcode UI copy in widgets, except for temporary demo data values such
  as model names.
- When a string includes dynamic values, prefer interpolation support from the
  localization generator rather than string concatenation.

## RTL Guidance

Arabic support means UI must not assume left-to-right layout:

- Use `EdgeInsetsDirectional.only(start: ..., end: ...)`.
- Use `AlignmentDirectional.centerStart`.
- Let `Row` order follow Flutter directionality unless product design requires a
  fixed visual order.
- Avoid icons that imply direction unless mirrored or intentionally fixed.

## Language Selection UI

The source app has a simple language selection page. For UI-first projects,
build the UI with local state:

```dart
enum Lang {
  en,
  ar;

  bool get isEn => this == en;
  bool get isAr => this == ar;
}
```

Use a confirmation dialog when changing language if the product needs it. Do not
persist the choice during the UI phase unless explicitly requested.

