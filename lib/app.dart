import 'common_libs.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: (context) => context.loc.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      routerConfig: appRouter,
      locale: const Locale('en'),
      supportedLocales: S.supportedLocales,
      localizationsDelegates: S.localizationsDelegates,
    );
  }
}
