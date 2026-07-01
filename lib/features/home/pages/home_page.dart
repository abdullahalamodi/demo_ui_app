import '../../../common_libs.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static void go(BuildContext context) {
    context.go(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.loc.appTitle)),
      body: const HomeWelcomeContent(),
    );
  }
}
