# Templates

Use these as starting templates for new UI-first features.

## Feature Barrel

```dart
// lib/features/products/products.dart
export 'models/models.dart';
export 'pages/pages.dart';
export 'widgets/widgets.dart';
```

```dart
// lib/features/products/pages/pages.dart
export 'create_product_page.dart';
export 'list_products_page.dart';
export 'show_product_page.dart';
```

```dart
// lib/features/products/widgets/widgets.dart
export 'product_card.dart';
export 'product_empty_widget.dart';
export 'show_product_content.dart';
export 'show_product_header_section.dart';
```

## Model With Direct Demo Data

```dart
import '../../../common_libs.dart';

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
      name: 'Studio Pass',
      description: 'A flexible pass for weekly sessions.',
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

## List Page

```dart
import '../../../common_libs.dart';

class ListProductsPage extends StatelessWidget {
  const ListProductsPage({super.key});

  static void go(BuildContext context) {
    context.goNamed(AppRoutes.productsName);
  }

  @override
  Widget build(BuildContext context) {
    final items = ProductModel.demoItems;

    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        padding: kPagePadding.add(const EdgeInsets.only(top: 12)),
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () => ShowProductPage.go(context, item.id),
            child: ProductCard(item: item),
          );
        },
      ),
    );
  }
}
```

## Card Widget

```dart
import '../../../common_libs.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.item,
  });

  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    final contentStyle = context.textTheme.bodyMedium!.copyWith(fontSize: 16);

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(kRadiusM),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(kRadiusL),
            child: Image.asset(
              item.image,
              height: 208,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Text(item.name, style: context.textTheme.headlineSmall),
          const SizedBox(height: 12),
          Text(item.description, style: contentStyle),
        ],
      ),
    );
  }
}
```

## Show Page And Content

```dart
import '../../../common_libs.dart';

class ShowProductPage extends StatelessWidget {
  const ShowProductPage({
    super.key,
    required this.id,
  });

  final int id;

  static void go(BuildContext context, int id) {
    context.goNamed(
      AppRoutes.productDetailsName,
      pathParameters: {'id': id.toString()},
    );
  }

  @override
  Widget build(BuildContext context) {
    final item = ProductModel.demoById(id);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.loc.productDetails,
          style: context.textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: ShowProductContent(item: item),
      ),
    );
  }
}
```

```dart
import '../../../common_libs.dart';

class ShowProductContent extends StatelessWidget {
  const ShowProductContent({
    super.key,
    required this.item,
  });

  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(item.name, style: context.textTheme.headlineMedium),
          const SizedBox(height: 12),
          Text(item.description, style: context.textTheme.bodyLarge),
        ],
      ),
    );
  }
}
```

## Route Entry

```dart
GoRoute(
  path: AppRoutes.products,
  name: AppRoutes.productsName,
  pageBuilder: (context, state) => const NoTransitionPage(
    child: ListProductsPage(),
  ),
  routes: [
    GoRoute(
      path: AppRoutes.productDetails(),
      name: AppRoutes.productDetailsName,
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return NoTransitionPage(
          child: ShowProductPage(id: id),
        );
      },
    ),
  ],
)
```
