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
            padding: const EdgeInsets.fromLTRB(34, 26, 34, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthLogo(),
                const Spacer(),
                const AuthHeader(
                  title: "Athelete's\nPerfect\nHideaways",
                  subtitle:
                      'Lorem ipsum dolor sit amet, conse\nctetur adipiscing elit, sed do eiu\nsmod tempor incididunt ut labor\ne et dolore m',
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
                              '4.7',
                              style: context.textTheme.titleLarge?.copyWith(
                                color: context.customColors.onMedia,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Text(
                          'from 1,800+ Players',
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
                  label: 'Get Started',
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
