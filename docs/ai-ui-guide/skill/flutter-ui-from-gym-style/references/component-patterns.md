# Component Patterns

## Pages

Pages own route-level structure:

- `Scaffold`
- `AppBar`
- `SafeArea`
- `SingleChildScrollView` or `ListView.builder`
- route params
- local demo data selection
- static navigation helpers

Pages should compose widgets instead of containing an entire feature inline.

## Widgets

Widgets should:

- Use `const` constructors.
- Accept required named parameters.
- Store inputs as `final` fields.
- Prefer `StatelessWidget`.
- Use `StatefulWidget` only for local UI state.
- Use `context.textTheme`, `context.theme`, `context.colorScheme`, and
  `context.loc`.

Feature widgets render one section, card, tile, empty state, or control.

## Cards

Use the common card style:

```dart
Container(
  padding: const EdgeInsets.all(16),
  margin: const EdgeInsets.only(bottom: 12),
  decoration: BoxDecoration(
    color: context.theme.cardColor,
    borderRadius: BorderRadius.circular(kRadiusM),
  ),
  child: child,
)
```

Use `kRadiusM` for normal cards and fields. Use `kRadiusL` for large images,
buttons, and prominent containers.

## Lists

Use `ListView.builder` and card or tile widgets. Keep list data and navigation in the
page:

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

## Forms

Use labels above fields. Own controllers in state and dispose them.

```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  spacing: 12,
  children: [
    Text(context.loc.email, style: context.textTheme.bodyMedium),
    CustomTextField(controller: _emailController, hint: context.loc.email),
  ],
)
```

## Local UI State

Use local state for tabs, toggles, selected filters, expansion, password
visibility, rating selection, carousel index, and demo state previews.

Do not add a provider for local UI state during UI-first work.

## Long Show Screens

Split into:

- `pages/show_<name>_page.dart`
- `widgets/show_<name>_content.dart`

The page handles route and scroll; the content widget renders sections.
