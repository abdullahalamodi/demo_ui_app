import '../../common_libs.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.loc.notFoundTitle)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(kPagePadding),
          child: Text(
            context.loc.notFoundMessage,
            style: context.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
