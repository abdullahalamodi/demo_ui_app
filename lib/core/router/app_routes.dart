abstract final class AppRoutes {
  static const onboarding = '/';
  static const onboardingName = 'onboarding';

  static const login = '/login';
  static const loginName = 'login';

  static const createAccount = '/create-account';
  static const createAccountName = 'create-account';

  static const mobileVerification = '/mobile-verification';
  static const mobileVerificationName = 'mobile-verification';

  static const profileDetails = '/profile-details';
  static const profileDetailsName = 'profile-details';

  static const home = '/home';
  static const homeName = 'home';

  static const searchResult = '/search-result';
  static const searchResultName = 'search-result';

  static const showHomeCourtName = 'show-home-court';

  static String showHomeCourt([String? id]) {
    return '/home/courts/${id ?? ':id'}';
  }
}
