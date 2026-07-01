# Localization

Use the Gym app's `intl_utils` pattern.

## Files

```text
lib/l10n/intl_en.arb
lib/l10n/intl_ar.arb
lib/generated/l10n.dart
lib/generated/intl/
```

Do not edit generated files by hand.

## Pubspec

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

## App Setup

Use generated delegates in `MaterialApp.router`:

```dart
localizationsDelegates: const [
  S.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
],
supportedLocales: S.delegate.supportedLocales,
onGenerateTitle: (context) => context.loc.apptitle,
```

## String Access

Prefer:

```dart
context.loc.someKey
```

`S.of(context).someKey` is acceptable when matching nearby code.

## Rules

- Add every app-facing string to English and Arabic ARB files.
- Use lower camel case keys.
- Avoid hardcoded UI copy.
- Use `EdgeInsetsDirectional` and `AlignmentDirectional` for RTL-sensitive
  layout.
- Do not add persisted language providers during UI-first work.

