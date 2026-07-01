# Component Patterns

This file captures how to structure pages and widgets in the same style as the
source app while keeping the new project UI-first.

## Page Responsibilities

Pages should:

- Own route-level UI such as `Scaffold`, `AppBar`, `SafeArea`, and main scroll
  behavior.
- Provide static navigation helpers.
- Select local demo data.
- Compose feature widgets.
- Keep action methods private.

Pages should not:

- Contain backend calls.
- Contain repository/provider reads.
- Build every section inline when the page becomes long.

## Widget Responsibilities

Feature widgets should:

- Accept model objects or primitive display values.
- Render one card, section, control, empty state, or list item.
- Use theme/context extensions.
- Be `StatelessWidget` unless local UI state is required.
- Expose callbacks for actions instead of navigating internally when reuse is
  likely.

## Long Details Pages

Split long show pages into a page and content widget:

- `ShowProductPage` owns app bar, route parameter, demo data selection, and
  scroll.
- `ShowProductContent` owns the detailed visual sections.

Use this shape:

```text
pages/show_product_page.dart
widgets/show_product_content.dart
```

## List Pages

Use `ListView.builder` for repeated items:

```dart
ListView.builder(
  itemCount: items.length,
  padding: kPagePadding.add(const EdgeInsets.only(top: 12)),
  itemBuilder: (context, index) {
    final item = items[index];
    return GestureDetector(
      onTap: () => ShowProductPage.go(context, item.id),
      child: ProductCard(item: item),
    );
  },
)
```

Use a separate item widget for the visual card. Keep list logic in the page.

## Forms

The source app uses labels above custom fields:

```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  spacing: 12,
  children: [
    Text(context.loc.email, style: context.textTheme.bodyMedium),
    CustomTextField(
      controller: _emailController,
      hint: context.loc.email,
    ),
  ],
)
```

For form pages:

- Use `ConsumerStatefulWidget` in the source app, but use plain
  `StatefulWidget` for UI-first projects.
- Own `TextEditingController`s in state.
- Dispose controllers.
- Use `SingleChildScrollView`.
- Use `Form` and `GlobalKey<FormState>` when validation is part of the UI demo.

## Local UI State

Use local state for:

- Selected tab or segmented option.
- Expanded/collapsed sections.
- Password visibility.
- Carousel page index.
- Rating selection.
- Demo view state: data, empty, loading, error.

Do not add a provider for local UI state during the UI-first phase.

## Empty, Loading, And Error States

The source app has simple widgets for loading, empty, and error states. Keep the
concept but make states demo-friendly:

```dart
enum DemoViewState { data, empty, loading, error }
```

Build small widgets such as:

- `SimpleLoadingWidget`
- `SimpleEmptyWidget`
- `SimpleErrorWidget`
- feature-specific empty widgets with image, title, subtitle, and CTA.

## Interaction Style

Use:

- `ElevatedButton` for primary actions.
- `TextButton` for lightweight retry or text actions.
- `GestureDetector` or `InkWell` for cards and icon rows.
- `ConfirmationDialog` for destructive or high-friction confirmation.

Use `FaIcon` and `FontAwesomeIcons` from `font_awesome_flutter` for standard UI
icons. Prefer Font Awesome icons for buttons, empty states, metadata rows,
tabs, navigation, and repeated controls so the app has one consistent icon
style. Use Material `Icons` only when a platform-specific Material control
requires it or Font Awesome does not provide a suitable match.

Use `SvgPicture.asset` with `context.svgColorFilter` for theme-aware icons.
