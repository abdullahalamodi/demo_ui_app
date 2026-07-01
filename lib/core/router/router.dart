import '../../common_libs.dart';

export 'app_routes.dart';
export 'not_found_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: HomePage()),
    ),
  ],
  errorBuilder: (context, state) => const NotFoundPage(),
);
