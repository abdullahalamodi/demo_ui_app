# Agent Instructions

## Scope

These instructions apply to the whole repository.

## Project Overview

This is a Flutter app named `demo_ui_app`.

- Main entrypoint: `lib/main.dart`
- App setup: `lib/app.dart`
- Routing: `lib/core/router/router.dart`
- Feature code: `lib/features`
- Shared theme, constants, extensions, and widgets: `lib/core`
- Localization source: `lib/l10n/intl_en.arb`
- Generated localization output: `lib/generated`
- Image assets: `assets/images/png` and `assets/images/svg`

## Commands

Run these from the repository root:

- Fetch dependencies: `flutter pub get`
- Format Dart code: `dart format .`
- Analyze: `flutter analyze`
- Regenerate Flutter localization after ARB changes: `flutter gen-l10n`
- Regenerate model code only when generated models are added or changed:
  `dart run build_runner build --delete-conflicting-outputs`

## Coding Conventions

- Follow `analysis_options.yaml`: 80-column formatting, trailing commas, and Flutter lints.
- Prefer relative imports for local files. The lint `prefer_relative_imports` is enabled.
- Use the existing barrel files where appropriate, especially `lib/common_libs.dart`, `lib/core/core.dart`, and feature-level exports.
- Keep generated files under `lib/generated` out of manual edits.
- Do not edit `*.g.dart` or `*.freezed.dart` files directly.
- Keep shared UI primitives in `lib/core/widgets`; keep feature-specific widgets inside the owning feature.
- Route additions should go through `AppRoutes` and `appRouter`.

## UI And Localization

- Use `context.loc` for user-facing strings.
- Add or change localized strings in `lib/l10n/intl_en.arb`, then run `flutter gen-l10n`.
- Reuse the existing theme tokens, constants, and `context` extensions before adding new styling helpers.
- Keep layouts compact and responsive. Verify that text does not overflow on narrow screens.
- Use existing auth/home widgets as patterns for page structure, spacing, and typography.

## Testing And Verification

- Before finishing code changes, run `dart format .` and `flutter analyze`.
- Run `flutter test` when tests exist or when adding tests.
- If changing visuals, manually inspect the affected screen in at least one small mobile viewport.

## Git Hygiene

- Do not revert or overwrite unrelated user changes.
- Keep generated, formatting, and lockfile changes only when they are a direct result of the task.
