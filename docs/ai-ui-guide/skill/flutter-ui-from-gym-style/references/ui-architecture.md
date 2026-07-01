# UI Architecture

Use the Gym app's feature-first UI structure, but keep the new project
UI-only.

## App Shell

- `main.dart`: initialize Flutter bindings, apply product-level device settings,
  run `App`.
- `app.dart`: own `MaterialApp.router`.
- `MaterialApp.router`: configure `routerConfig`, generated localization
  delegates, supported locales, selected locale, light/dark themes, and
  `debugShowCheckedModeBanner: false`.

The source app uses Riverpod for theme and language. In UI-first work, prefer
plain local state until real app state is requested.

## Core Folders

```text
core/
  constants/
  extensions/
  layout/
  router/
  theme/
  widgets/
```

Shared UI belongs in `core/widgets`. Feature-specific UI belongs in
`features/<feature>/widgets`.

## Feature Folders

```text
features/
  feature_name/
    feature_name.dart
    models/
      feature_model.dart
      models.dart
    pages/
      feature_page.dart
      pages.dart
    widgets/
      feature_item_widget.dart
      widgets.dart
```

Use these responsibilities:

- `pages/`: route-level screens, `Scaffold`, app bars, scroll wrappers,
  navigation helpers.
- `widgets/`: cards, sections, item widgets, empty states, controls.
- `models/`: immutable UI models and direct demo values.
- `<feature>.dart`: export `models`, `pages`, and `widgets`.

Do not add `providers`, `repositories`, or `services` for UI-first work.

## Routing

Follow the existing `go_router` pattern:

- Define path constants in `AppRoutes`.
- Build routes in `router.dart`.
- Use `ShellRoute` for shared layout.
- Use `NoTransitionPage` for simple transitions.
- Put static navigation helpers on pages:
  `static go(BuildContext context)` and `static push(...)`.

Use route helpers instead of rebuilding route strings across widgets.

## Imports

- Prefer relative imports.
- Use `common_libs.dart` for stable UI dependencies, including
  `font_awesome_flutter`.
- Keep barrel exports focused on UI during the UI-first phase.
