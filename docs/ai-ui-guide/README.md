# AI UI Guide

This guide extracts the reusable UI architecture, code style, and Flutter UI
patterns from this project for use in a new UI-first Flutter app.

The scope is intentionally limited to UI work:

- Include app shell, routing shape, theme, assets, localization, feature
  structure, shared widgets, forms, cards, lists, and demo UI states.
- Exclude providers, repositories, services, API clients, persistence,
  authentication logic, payment logic, Mapbox logic, and any real backend
  integration.
- Use demo data directly from UI models while the new app is in the UI phase.

## Source Patterns

The extracted patterns are based mainly on:

- `lib/common_libs.dart`
- `lib/app.dart`
- `lib/core/router/`
- `lib/core/theme/`
- `lib/core/constants/`
- `lib/core/extensions/context_extensions.dart`
- `lib/core/widgets/`
- `lib/core/layout/`
- `lib/l10n/intl_en.arb`
- `lib/l10n/intl_ar.arb`
- `lib/features/*/pages/`
- `lib/features/*/widgets/`
- `lib/features/*/models/`

## How To Use This Guide

Read these files in order when starting a new UI-first app:

1. `ai-coding-rules.md`
2. `ui-architecture.md`
3. `naming-conventions.md`
4. `theme-and-assets.md`
5. `localization.md`
6. `component-patterns.md`
7. `demo-data.md`
8. `templates.md`

The repo-local Codex skill is available at:

`docs/ai-ui-guide/skill/flutter-ui-from-gym-style`

Use that skill when you want an AI agent to build Flutter UI that follows these
rules.

## Recommended UI-First Structure

```text
lib/
  main.dart
  app.dart
  common_libs.dart
  generated/
  l10n/
    intl_en.arb
    intl_ar.arb
  core/
    constants/
    extensions/
    layout/
    router/
    theme/
    widgets/
  features/
    feature_name/
      feature_name.dart
      models/
        feature_model.dart
        models.dart
    pages/
        show_feature_page.dart
        list_features_page.dart
        create_feature_page.dart
        pages.dart
      widgets/
        feature_card.dart
        show_feature_header_section.dart
        list_features_filter_section.dart
        widgets.dart
```

Do not add `providers/`, `repositories/`, `services/`, `api/`, or `data/`
folders during the UI-first phase unless the user explicitly asks for real data
architecture.
