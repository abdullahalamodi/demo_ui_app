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
          topPadding: 57,
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
                      side: const BorderSide(color: Color(0xFF9A9A9A)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Remember me',
                    style: TextStyle(
                      color: Color(0xFF444444),
                      fontSize: 14,
                      letterSpacing: 0,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF171717),
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      textStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0,
                      ),
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
              _AuthFooterLink(
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

class _AuthFooterLink extends StatelessWidget {
  const _AuthFooterLink({
    required this.text,
    required this.action,
    required this.onTap,
  });

  final String text;
  final String action;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF555555),
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
        ),
      ),
      child: Text('$text$action'),
    );
  }
}
