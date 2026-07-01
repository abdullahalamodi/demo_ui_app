# UI Architecture

The source app uses a feature-first Flutter structure with shared UI
infrastructure under `core/`. The new project should keep the same shape while
removing provider and data layers during the UI-first phase.

## App Shell

Use a small startup path:

- `main.dart` initializes Flutter bindings, locks portrait orientation if the
  product requires it, and runs `App`.
- `app.dart` owns `MaterialApp.router`.
- `MaterialApp.router` wires routing, localization delegates, supported
  locales, locale selection, light theme, dark theme, and
  `debugShowCheckedModeBanner: false`.

The source app uses Riverpod to select theme and language. For the new UI-first
project, prefer local `StatefulWidget` or `ValueNotifier` state until real
application state is explicitly requested.

## Common Barrel

The source project uses `lib/common_libs.dart` as a convenience barrel for
framework, generated localization, core, features, and packages.

For the new UI-first app, keep `common_libs.dart` but only export UI-safe items:

- Flutter framework packages.
- `flutter_localizations`.
- `flutter_svg`.
- `font_awesome_flutter`.
- `go_router`.
- `app.dart`.
- `core/core.dart`.
- `features/features.dart`.
- `generated/l10n.dart`.

Do not export data layers that do not exist yet.

## Core Structure

```text
core/
  constants/
    constants.dart
    fixed_assets.dart
    k_constants.dart
    keys_enums.dart
  extensions/
    context_extensions.dart
    extensions.dart
  layout/
    pages/
    widgets/
    layout.dart
  router/
    app_routes.dart
    app_route.dart
    not_found_page.dart
    router.dart
  theme/
    app_colors.dart
    app_theme.dart
    k_constants.dart
    theme.dart
  widgets/
    widgets.dart
```

Keep shared UI components in `core/widgets`. Keep feature-specific components in
`features/<feature>/widgets`.

## Feature Structure

Each feature should follow this structure:

```text
features/
  products/
    products.dart
    models/
      product_model.dart
      models.dart
    pages/
      list_products_page.dart
      show_product_page.dart
      create_product_page.dart
      pages.dart
    widgets/
      product_card.dart
      show_product_content.dart
      show_product_header_section.dart
      product_empty_widget.dart
      widgets.dart
```

Rules:

- `pages/` contains route-level widgets and screen scaffolds.
- `widgets/` contains reusable sections, cards, list items, controls, and empty
  states.
- `models/` contains immutable UI models and direct demo values.
- `<feature>.dart` exports `models/models.dart`, `pages/pages.dart`, and
  `widgets/widgets.dart`.
- `features.dart` exports feature barrels.
- Do not add `providers/`, `repositories/`, or `services/` in UI-first work.

## Routing

Follow the source app's `go_router` pattern:

- Put path constants in `AppRoutes`.
- Put router construction in `router.dart`.
- Use `GoRoute` for feature pages.
- Use `ShellRoute` for pages that share a layout such as an app bar and drawer.
- Use `NoTransitionPage` when matching the source project's simple transition
  behavior.
- Add static helpers on page classes so callers do not rebuild route strings.

Example:

```dart
abstract class AppRoutes {
  static const products = '/products';
  static productDetails([int? id]) => 'details/${id ?? ':id'}';
}
```

```dart
class ShowProductPage extends StatelessWidget {
  const ShowProductPage({super.key, required this.id});

  final int id;

  static void go(BuildContext context, int id) {
    context.go('${AppRoutes.products}/${AppRoutes.productDetails(id)}');
  }

  @override
  Widget build(BuildContext context) {
    final item = ProductModel.demoById(id);
    return Scaffold(
      appBar: AppBar(title: Text(context.loc.productDetails)),
      body: SingleChildScrollView(
        child: ShowProductContent(item: item),
      ),
    );
  }
}
```

## Layout Shell

The source app has a shared `MainLayout` with an app bar, drawer, title mapping,
and route child. Keep this pattern when the new app has multiple sections.

For UI-first work:

- Build `MainLayout` as a plain `StatelessWidget`.
- Pass the route and child into the layout.
- Keep drawer item definitions UI-only.
- Use localized titles.
- Let each feature page own its own body layout.

## Import And Export Policy

- Use relative imports, matching the `prefer_relative_imports` lint.
- Use barrel files to reduce noisy imports.
- Avoid exporting generated implementation files.
- Avoid exporting non-UI layers in UI-first projects.
