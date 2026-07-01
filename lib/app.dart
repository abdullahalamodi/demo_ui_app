import 'common_libs.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Demo UI App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      routerConfig: appRouter,
      locale: const Locale('en'),
      supportedLocales: S.supportedLocales,
      localizationsDelegates: S.localizationsDelegates,
    );
  }
}
