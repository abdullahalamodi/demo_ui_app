import '../../common_libs.dart';

export 'app_routes.dart';
export 'not_found_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.onboarding,
  routes: [
    GoRoute(
      path: AppRoutes.onboarding,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: OnboardingPage()),
    ),
    GoRoute(
      path: AppRoutes.login,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: LoginPage()),
    ),
    GoRoute(
      path: AppRoutes.createAccount,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: CreateAccountPage()),
    ),
    GoRoute(
      path: AppRoutes.mobileVerification,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: MobileVerificationPage()),
    ),
    GoRoute(
      path: AppRoutes.profileDetails,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: ProfileDetailsPage()),
    ),
    GoRoute(
      path: AppRoutes.home,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: HomePage()),
    ),
  ],
  errorBuilder: (context, state) => const NotFoundPage(),
);
