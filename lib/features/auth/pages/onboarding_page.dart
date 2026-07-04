import '../../../common_libs.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  static void go(BuildContext context) {
    context.goNamed(AppRoutes.onboardingName);
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
                SizedBox(height: 46),
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
                            AppSvgIcon(
                              FixedAssets.star,
                              size: 23,
                              color: context.customColors.accent,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '4.7',
                              style: context.textTheme.headlineMedium?.copyWith(
                                color: context.customColors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Text(
                          context.loc.onboardingPlayersCount,
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: context.customColors.white,
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
