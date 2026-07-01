# Demo Data

The new project should render UI from direct model demo data during the UI-first
phase.

## Rule

Use model-direct demo data:

- No JSON fixture files.
- No providers.
- No repositories.
- No services.
- No fake HTTP clients.
- No persistence.

## Model Pattern

Prefer immutable model classes with const constructors:

```dart
class ProductModel {
  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
  });

  final int id;
  final String name;
  final String description;
  final String image;
  final double price;
  final double rating;

  String get priceText => price.toStringAsFixed(1);

  static const demoItems = [
    ProductModel(
      id: 1,
      name: 'Monthly Pass',
      description: 'Access for one month',
      image: FixedAssets.demoProduct,
      price: 129,
      rating: 4.8,
    ),
  ];

  static ProductModel demoById(int id) {
    return demoItems.firstWhere(
      (item) => item.id == id,
      orElse: () => demoItems.first,
    );
  }
}
```

Use generated model libraries such as `freezed` only when the project already
needs them. For pure UI prototypes, plain immutable Dart classes are simpler and
avoid build steps.

## Demo State Pattern

For screens that need state previews:

```dart
enum DemoViewState {
  data,
  empty,
  loading,
  error;

  bool get isData => this == data;
  bool get isEmpty => this == empty;
  bool get isLoading => this == loading;
  bool get isError => this == error;
}
```

Keep state controls local to the page. If visible demo controls should not ship,
wrap them with `assert` or remove them before production handoff.

## Computed Display Values

Put simple computed display values on the model when they are reused:

```dart
bool get hasDiscount => discount > 0;
double get priceAfterDiscount => price - discount;
String get distanceInKiloText => distanceInKilo.toStringAsFixed(1);
```

Do not put UI widgets inside models.

## Demo Images

Prefer local assets for predictable UI:

- `assets/images/png/`
- `assets/images/svg/`
- `assets/images/gif/`

Add asset constants to `FixedAssets` and register asset folders in
`pubspec.yaml`.

