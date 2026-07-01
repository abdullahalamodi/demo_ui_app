import '../../../common_libs.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  static void go(BuildContext context) {
    context.go(AppRoutes.onboarding);
  }

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundScaffold(
      children: [
        SafeArea(
          child: Padding(
            padding: kFixedPagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthLogo(),
                const Spacer(),
                AuthHeader(
                  title: context.loc.onboardingTitle,
                  subtitle: context.loc.onboardingSubtitle,
                ),
                const Spacer(flex: 5),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.solidStar,
                              size: 23,
                              color: context.customColors.accent,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              context.loc.onboardingRating,
                              style: context.textTheme.titleLarge?.copyWith(
                                color: context.customColors.onMedia,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Text(
                          context.loc.onboardingPlayersCount,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.customColors.onMedia,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 33),
                AuthSecondaryButton(
                  label: context.loc.getStarted,
                  onPressed: () => LoginPage.go(context),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
