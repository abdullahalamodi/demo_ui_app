import '../../../common_libs.dart';

class ProfileDetailsPage extends StatelessWidget {
  const ProfileDetailsPage({super.key});

  static void go(BuildContext context) {
    context.goNamed(AppRoutes.profileDetailsName);
  }

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundScaffold(
      children: [
        SafeArea(
          child: Padding(
            padding: kScrollablePagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthLogo(),
                const SizedBox(height: 100),
                AuthHeader(
                  title: context.loc.profileDetailsTitle,
                  trailing: Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: TextButton(
                      onPressed: () => HomePage.go(context),
                      style: TextButton.styleFrom(
                        foregroundColor: context.customColors.white,
                        textStyle: context.textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(context.loc.skip),
                          const SizedBox(width: 5),
                          RotatedBox(
                            quarterTurns: 2,
                            child: AppSvgIcon(
                              FixedAssets.chevronLeft,
                              size: 14,
                              color: context.customColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        AuthBottomSheet(
          top: 346,
          child: Column(
            children: [
              AuthTextField(
                label: context.loc.nameLabel,
                initialValue: context.loc.demoEmailValue,
              ),
              const SizedBox(height: 19),
              AuthTextField(
                label: context.loc.genderLabel,
                initialValue: context.loc.demoEmailValue,
              ),
              const SizedBox(height: 19),
              AuthTextField(
                label: context.loc.ageLabel,
                initialValue: context.loc.demoEmailValue,
              ),
              const SizedBox(height: 32),
              AuthPrimaryButton(
                label: context.loc.loginNow,
                onPressed: () => HomePage.go(context),
              ),
              const SizedBox(height: 8),
              AuthFooterLink(
                text: context.loc.newMember,
                action: context.loc.joinUs,
                onTap: () => LoginPage.go(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
