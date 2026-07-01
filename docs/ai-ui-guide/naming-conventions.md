# Naming Conventions

Use these naming rules for UI-first Flutter work. The goal is to make generated
UI predictable, readable, and easy to navigate without relying on vague names.

## File And Class Case

Use Dart-standard `snake_case.dart` filenames.

Use PascalCase for Dart classes.

```text
show_gym_page.dart        -> ShowGymPage
list_gyms_page.dart       -> ListGymsPage
create_gym_page.dart      -> CreateGymPage
show_gym_header_section.dart -> ShowGymHeaderSection
gym_card.dart             -> GymCard
app_text_field.dart       -> AppTextField
```

Do not use PascalCase filenames such as `ShowGymPage.dart`.

## Pages

Every route-level screen must end with `Page`.

Name pages with an action prefix plus the domain object:

```text
show_gym_page.dart        -> ShowGymPage
list_gyms_page.dart       -> ListGymsPage
create_gym_page.dart      -> CreateGymPage
edit_gym_page.dart        -> EditGymPage
select_gym_page.dart      -> SelectGymPage
search_gyms_page.dart     -> SearchGymsPage
filter_gyms_page.dart     -> FilterGymsPage
confirm_payment_page.dart -> ConfirmPaymentPage
```

Use singular names for one-resource pages:

```text
show_gym_page.dart
create_gym_page.dart
edit_gym_page.dart
```

Use plural names for collection pages:

```text
list_gyms_page.dart
search_gyms_page.dart
```

Use `ShowXPage` for single-resource display pages. Do not use `XDetailsPage`
in new UI-first code.

```text
Good: show_gym_page.dart -> ShowGymPage
Avoid: gym_details_page.dart -> GymDetailsPage
```

## Page-Specific Sections

Use `Section` for a named part inside a page.

Prefix page-specific sections with the page action and domain so the component
is easy to find:

```text
show_gym_header_section.dart   -> ShowGymHeaderSection
show_gym_info_section.dart     -> ShowGymInfoSection
show_gym_passes_section.dart   -> ShowGymPassesSection
create_gym_form_section.dart   -> CreateGymFormSection
list_gyms_filter_section.dart  -> ListGymsFilterSection
```

Sections should live in the feature `widgets/` folder unless the feature grows
large enough to justify a deeper folder.

```text
features/gyms/
  pages/
    show_gym_page.dart
    list_gyms_page.dart
  widgets/
    show_gym_header_section.dart
    show_gym_passes_section.dart
    list_gyms_filter_section.dart
```

## Page Content Widgets

Use `Content` when a widget owns the main composed body of a page.

```text
show_gym_content.dart      -> ShowGymContent
list_gyms_content.dart     -> ListGymsContent
```

Use `Form` when the component primarily owns fields, validation, and submit
layout.

```text
create_gym_form.dart       -> CreateGymForm
edit_gym_form.dart         -> EditGymForm
```

Use `Section` for smaller parts inside a content or form widget.

## Shared General Widgets

Shared widgets under `core/widgets/` should start with `App` unless the project
already has a clearer established prefix.

```text
app_button.dart            -> AppButton
app_text_field.dart        -> AppTextField
app_image.dart             -> AppImage
app_empty_state.dart       -> AppEmptyState
app_loading_state.dart     -> AppLoadingState
app_error_state.dart       -> AppErrorState
app_section_title.dart     -> AppSectionTitle
app_price_text.dart        -> AppPriceText
app_rating_stars.dart      -> AppRatingStars
```

Do not put feature-specific words in shared widget names.

## Feature-Specific Widgets

Feature widgets should start with the domain name when they are reusable within
that feature:

```text
gym_card.dart              -> GymCard
gym_pass_card.dart         -> GymPassCard
gym_image_carousel.dart    -> GymImageCarousel
gym_location_summary.dart  -> GymLocationSummary
payment_card_tile.dart     -> PaymentCardTile
trainer_avatar.dart        -> TrainerAvatar
```

Prefer a precise suffix:

- `Card`: a visual surface with padding, border, background, or shadow.
- `Tile`: a compact row-like list item.
- `Section`: a named part of a page.
- `Content`: the main body composition for a page.
- `Form`: fields, validation, and submit layout.
- `Dialog`: modal confirmation or focused decision.
- `Sheet`: bottom sheet content.
- `Button`: reusable interactive command.

Avoid vague suffixes in new code:

```text
Avoid: GymItemWidget
Avoid: GymComponent
Avoid: GymView
Avoid: GymWidget
```

Use `Item` only when the design is truly generic and no better suffix applies.

## Barrels

Barrel files stay plural and lowercase:

```text
pages/pages.dart
widgets/widgets.dart
models/models.dart
features/gyms/gyms.dart
```

Exports should follow the same naming rules:

```dart
export 'create_gym_page.dart';
export 'edit_gym_page.dart';
export 'list_gyms_page.dart';
export 'show_gym_page.dart';
```

## AI Naming Checklist

Before creating a UI file, decide:

1. Is it a route-level screen? Use `ActionDomainPage`.
2. Is it the body composition of a page? Use `ActionDomainContent`.
3. Is it one part of a page? Use `ActionDomainNameSection`.
4. Is it shared across the app? Use `AppName`.
5. Is it reusable inside one feature? Use `DomainPurposeSuffix`.
6. Is the filename `snake_case.dart` and the class PascalCase?

