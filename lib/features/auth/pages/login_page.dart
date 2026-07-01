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
            padding: const EdgeInsets.fromLTRB(34, 26, 34, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                AuthLogo(),
                SizedBox(height: 50),
                AuthHeader(title: 'Account\nLogin'),
              ],
            ),
          ),
        ),
        AuthBottomSheet(
          top: 287,
          child: Column(
            children: [
              const AuthTextField(
                label: 'E-mail',
                initialValue: 'hello@gmail.com',
              ),
              const SizedBox(height: 19),
              const AuthTextField(
                label: 'Password',
                initialValue: 'password',
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
                    'Remember me',
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
                    child: const Text('Forgot Password?'),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              SocialAuthButton(
                label: 'Continue with Google',
                icon: FontAwesomeIcons.google,
                onPressed: () {},
              ),
              const SizedBox(height: 13),
              SocialAuthButton(
                label: 'Continue with Apple',
                icon: FontAwesomeIcons.apple,
                onPressed: () {},
              ),
              const SizedBox(height: 18),
              AuthPrimaryButton(
                label: 'Login Now',
                onPressed: () => MobileVerificationPage.go(context),
              ),
              const SizedBox(height: 8),
              AuthFooterLink(
                text: 'New Member?',
                action: 'Join Us',
                onTap: () => CreateAccountPage.go(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
