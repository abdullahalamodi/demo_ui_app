---
name: flutter-ui-from-gym-style
description: Build UI-first Flutter app screens, routes, themes, shared widgets, localization, feature structure, and demo model data using the architecture and code style extracted from the Gym app. Use when creating or editing Flutter UI where the user wants the same project organization, widget composition, theme/assets conventions, ARB localization, and clean component separation, while excluding providers, repositories, services, APIs, and real data layers.
---

# Flutter UI From Gym Style

## Workflow

1. Inspect the target Flutter project before editing.
2. Keep the implementation UI-first. Do not create providers, repositories,
   services, API clients, persistence, or dependency injection unless the user
   explicitly asks for them.
3. Use feature-first folders with `models/`, `pages/`, `widgets/`, and barrel
   files.
4. Use `snake_case.dart` filenames, PascalCase classes, and action-based page
   names such as `ShowGymPage`, `ListGymsPage`, and `CreateGymPage`.
5. Use model-direct demo data for lists, show pages, empty states, and UI
   previews.
6. Use generated localization for all app-facing text.
7. Use central theme tokens, `BuildContext` extensions, and asset constants.
8. Split pages into readable widgets; keep page files responsible for routing
   and high-level layout.
9. Run formatting and analysis when code changes are complete.

## References

Read only the references needed for the task:

- `references/ui-architecture.md`: project structure, app shell, routing, layout,
  imports, and barrels.
- `references/naming-conventions.md`: file/class naming, action-based pages,
  sections, content widgets, forms, shared widgets, and feature widgets.
- `references/component-patterns.md`: page/widget responsibilities, cards,
  lists, forms, local state, empty/loading/error states.
- `references/theme-and-assets.md`: colors, typography, theme defaults,
  constants, context extensions, and asset constants.
- `references/localization.md`: ARB files, generated `S` class, `context.loc`,
  locale setup, RTL rules.
- `references/demo-data.md`: direct model demo data and demo UI state patterns.

## Hard Exclusions

During UI-first work, do not add:

- `providers/`
- `repositories/`
- `services/`
- `api/`
- `data/`
- fake HTTP clients
- JSON fixture files for screen content
- storage or persistence

Use local `StatefulWidget`, `ValueNotifier`, or simple fields for temporary UI
state.

## Completion Checklist

Before finishing:

- Feature files are in the expected folders.
- Files use `snake_case.dart`; classes use PascalCase.
- Route-level screens use action-based page names such as `ShowXPage`,
  `ListXsPage`, and `CreateXPage`.
- Demo content comes directly from models.
- All visible UI strings are localized.
- Theme and asset constants are used.
- Widgets are split into clear components.
- Light, dark, and RTL-sensitive layout choices are considered.
- No excluded data-layer artifacts were introduced.
