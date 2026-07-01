# Demo Data

Render UI from direct model demo data during the UI-first phase.

## Exclusions

Do not use:

- JSON fixtures
- providers
- repositories
- services
- fake API clients
- persistence

## Model Pattern

```dart
class ProductModel {
  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
  });

  final int id;
  final String name;
  final String description;
  final String image;
  final double price;

  String get priceText => price.toStringAsFixed(1);

  static const demoItems = [
    ProductModel(
      id: 1,
      name: 'Studio Pass',
      description: 'A flexible pass for weekly sessions.',
      image: FixedAssets.demoProduct,
      price: 129,
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

Use plain immutable Dart classes unless the project already needs generated
models.

## Demo View States

Use a local enum when a page needs visual state previews:

```dart
enum DemoViewState {
  data,
  empty,
  loading,
  error;
}
```

Switch between states in the page with local state only.

