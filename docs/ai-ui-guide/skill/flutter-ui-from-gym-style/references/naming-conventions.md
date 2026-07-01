# Naming Conventions

Use Dart-standard `snake_case.dart` filenames and PascalCase class names.

## Pages

Every route-level screen ends with `Page` and uses an action prefix:

```text
show_gym_page.dart        -> ShowGymPage
list_gyms_page.dart       -> ListGymsPage
create_gym_page.dart      -> CreateGymPage
edit_gym_page.dart        -> EditGymPage
select_gym_page.dart      -> SelectGymPage
search_gyms_page.dart     -> SearchGymsPage
confirm_payment_page.dart -> ConfirmPaymentPage
```

Use `ShowXPage` for single-resource display pages. Do not create new
`XDetailsPage` names.

Use singular domain names for one-resource pages and plural domain names for
collection pages.

## Sections And Content

Use `Section` for named parts inside a page:

```text
show_gym_header_section.dart  -> ShowGymHeaderSection
show_gym_passes_section.dart  -> ShowGymPassesSection
list_gyms_filter_section.dart -> ListGymsFilterSection
```

Use `Content` for a page's main composed body:

```text
show_gym_content.dart -> ShowGymContent
```

Use `Form` for field and validation compositions:

```text
create_gym_form.dart -> CreateGymForm
```

## Widgets

Shared app widgets under `core/widgets/` start with `App`:

```text
app_button.dart -> AppButton
app_text_field.dart -> AppTextField
app_empty_state.dart -> AppEmptyState
```

Feature-specific widgets start with the domain name:

```text
gym_card.dart -> GymCard
gym_pass_card.dart -> GymPassCard
payment_card_tile.dart -> PaymentCardTile
```

Prefer precise suffixes: `Card`, `Tile`, `Section`, `Content`, `Form`,
`Dialog`, `Sheet`, and `Button`.

Avoid vague suffixes in new code: `Widget`, `Component`, `View`, and `Item`.
Use `Item` only when no more precise visual role applies.

