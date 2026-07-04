import '../../../common_libs.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static void go(BuildContext context) {
    context.goNamed(AppRoutes.loginName);
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
                const SizedBox(height: 46),
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
                    width: 15,
                    height: 15,
                    child: Checkbox(
                      value: false,
                      side: BorderSide(
                        color: context.customColors.onSurfaceMuted,
                      ),
                      onChanged: (_) {},
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    context.loc.rememberMe,
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: context.colorScheme.onSurface,
                      textStyle: context.textTheme.labelMedium,
                    ),
                    child: Text(context.loc.forgotPassword),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              SocialAuthButton(
                label: context.loc.continueWithGoogle,
                iconAsset: FixedAssets.google,
                onPressed: () {},
              ),
              const SizedBox(height: 13),
              SocialAuthButton(
                label: context.loc.continueWithApple,
                iconAsset: FixedAssets.apple,
                iconSize: 20,
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
