import '../../common_libs.dart';

export 'app_routes.dart';
export 'not_found_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.onboarding,
  routes: [
    GoRoute(
      path: AppRoutes.onboarding,
      name: AppRoutes.onboardingName,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: OnboardingPage()),
    ),
    GoRoute(
      path: AppRoutes.login,
      name: AppRoutes.loginName,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: LoginPage()),
    ),
    GoRoute(
      path: AppRoutes.createAccount,
      name: AppRoutes.createAccountName,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: CreateAccountPage()),
    ),
    GoRoute(
      path: AppRoutes.mobileVerification,
      name: AppRoutes.mobileVerificationName,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: MobileVerificationPage()),
    ),
    GoRoute(
      path: AppRoutes.profileDetails,
      name: AppRoutes.profileDetailsName,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: ProfileDetailsPage()),
    ),
    GoRoute(
      path: AppRoutes.home,
      name: AppRoutes.homeName,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: HomePage()),
    ),
    GoRoute(
      path: AppRoutes.showHomeCourt(),
      name: AppRoutes.showHomeCourtName,
      pageBuilder: (context, state) {
        final id = state.pathParameters['id'] ?? '';
        return NoTransitionPage(child: ShowHomeCourtPage(id: id));
      },
    ),
    GoRoute(
      path: AppRoutes.searchResult,
      name: AppRoutes.searchResultName,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: SearchResultPage()),
    ),
  ],
  errorBuilder: (context, state) => const NotFoundPage(),
);
