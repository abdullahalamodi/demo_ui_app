# AI Coding Rules

Use these rules as the controlling instructions for AI agents working on the
new Flutter UI project.

## Non-Negotiables

- Build UI-first. Do not introduce providers, repositories, services, API
  clients, storage, dependency injection, or real network/data flows.
- Use demo data directly from immutable UI models.
- Keep widgets readable and split by responsibility. Do not put a whole feature
  into one long build method.
- Use generated localization for all app-facing text.
- Use theme constants, context extensions, asset constants, and shared widgets
  instead of ad hoc styling.
- Use Dart-standard `snake_case.dart` filenames and PascalCase class names.
- Use action-based page names such as `ShowXPage`, `ListXsPage`,
  `CreateXPage`, and `EditXPage`. Do not create new `XDetailsPage` names.
- Prefer `StatelessWidget`. Use `StatefulWidget` only for local UI state such as
  tab selection, password visibility, expansion, form controllers, carousel
  index, or demo state switching.
- Keep files in the same feature-first structure used by this project:
  `models/`, `pages/`, `widgets/`, plus barrel files.
- Preserve production naming and spelling. Do not copy accidental typos from the
  source project.

## Work Order For New UI

1. Define or update localized strings in both ARB files.
2. Define immutable UI model classes with direct demo values.
3. Build small reusable widgets in the feature `widgets/` folder.
4. Build the feature page in `pages/`.
5. Add route constants and `go_router` route entries.
6. Add barrel exports.
7. Run `dart format` and `dart analyze`.

## What To Avoid

- No placeholder business layers such as empty repositories or fake providers.
- No JSON fixture files for screen demo data.
- No hardcoded user-facing strings in widgets.
- No direct hex colors inside feature widgets unless introducing a named theme
  token first.
- No one-off image paths in widgets. Add asset constants.
- No broad refactors unrelated to the current UI.
- No generated files committed by hand unless the generator produced them.

## Style Rules

- Import `common_libs.dart` from feature UI files unless a local direct import is
  clearer for a special package.
- Use `context.textTheme`, `context.theme`, `context.colorScheme`,
  `context.customColors`, and `context.loc`.
- Use `kPagePadding`, `kRadiusM`, `kRadiusL`, `kButtonHeight`, and related
  design constants instead of local magic values.
- Use `const` constructors and `final` fields.
- Keep public widget APIs explicit with named required parameters.
- Use private helper methods for actions and section builders:
  `_openDetails`, `_buildHeader`, `_buildEmptyWidget`.
- Put navigation helper methods on pages:
  `static go(BuildContext context)`, `static push(...)`.
- Use `EdgeInsetsDirectional` and `AlignmentDirectional` when layout depends on
  leading/trailing direction.
- Use `SingleChildScrollView` for form pages and show pages; use
  `ListView.builder` for lists.

## Verification Checklist

Before finishing UI work:

- The screen builds from local model demo data.
- Empty, loading, and error states are represented when relevant.
- English and Arabic strings exist for every user-facing label.
- The page works in light and dark themes.
- Assets are referenced through `FixedAssets`.
- Files are placed under the correct feature folders.
- No providers, repositories, services, or API dependencies were added.
- `dart format` passes.
- `dart analyze` has no new issues.
