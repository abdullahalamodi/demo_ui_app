import '../../../common_libs.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static void go(BuildContext context) {
    context.go(AppRoutes.login);
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
                const SizedBox(height: 50),
                AuthHeader(title: context.loc.accountLoginTitle),
              ],
            ),
          ),
        ),
        AuthBottomSheet(
          top: 287,
          child: Column(
            children: [
              AuthTextField(
                label: context.loc.emailLabel,
                initialValue: context.loc.demoEmailValue,
              ),
              const SizedBox(height: 19),
              AuthTextField(
                label: context.loc.passwordLabel,
                initialValue: context.loc.demoPasswordValue,
                obscure: true,
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  SizedBox(
                    width: 18,
                    height: 18,
                    child: Checkbox(
                      value: false,
                      onChanged: (_) {},
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    context.loc.rememberMe,
                    style: context.textTheme.labelMedium?.copyWith(
                      color: context.customColors.onSurfaceMuted,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: context.colorScheme.onSurface,
                      textStyle: context.textTheme.labelSmall,
                    ),
                    child: Text(context.loc.forgotPassword),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              SocialAuthButton(
                label: context.loc.continueWithGoogle,
                icon: FontAwesomeIcons.google,
                onPressed: () {},
              ),
              const SizedBox(height: 13),
              SocialAuthButton(
                label: context.loc.continueWithApple,
                icon: FontAwesomeIcons.apple,
                onPressed: () {},
              ),
              const SizedBox(height: 18),
              AuthPrimaryButton(
                label: context.loc.loginNow,
                onPressed: () => MobileVerificationPage.go(context),
              ),
              const SizedBox(height: 8),
              AuthFooterLink(
                text: context.loc.newMember,
                action: context.loc.joinUs,
                onTap: () => CreateAccountPage.go(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
