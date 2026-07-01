import '../../../common_libs.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  static void go(BuildContext context) {
    context.go(AppRoutes.createAccount);
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
                SizedBox(height: 30),
                AuthHeader(title: 'Account\nCreate'),
              ],
            ),
          ),
        ),
        AuthBottomSheet(
          top: 247,
          topPadding: 58,
          child: Column(
            children: [
              const AuthTextField(
                label: 'E-mail',
                initialValue: 'hello@gmail.com',
              ),
              const SizedBox(height: 19),
              const AuthTextField(
                label: 'Mobile No.',
                initialValue: 'hello@gmail.com',
              ),
              const SizedBox(height: 19),
              const AuthTextField(
                label: 'Password',
                initialValue: '**********',
                obscure: true,
              ),
              const SizedBox(height: 19),
              const AuthTextField(
                label: 'Confirm Password',
                initialValue: '**********',
                obscure: true,
              ),
              const SizedBox(height: 33),
              AuthPrimaryButton(
                label: 'Login Now',
                onPressed: () => MobileVerificationPage.go(context),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => LoginPage.go(context),
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
                child: const Text('New Member?Join Us'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
