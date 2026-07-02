import '../../../common_libs.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  static void go(BuildContext context) {
    context.goNamed(AppRoutes.createAccountName);
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
                const SizedBox(height: 26),
                AuthHeader(title: context.loc.accountCreateTitle),
              ],
            ),
          ),
        ),
        AuthBottomSheet(
          top: 247,
          child: Column(
            children: [
              AuthTextField(
                label: context.loc.emailLabel,
                initialValue: context.loc.demoEmailValue,
              ),
              const SizedBox(height: 19),
              AuthTextField(
                label: context.loc.mobileNoLabel,
                initialValue: context.loc.demoEmailValue,
              ),
              const SizedBox(height: 19),
              AuthTextField(
                label: context.loc.passwordLabel,
                initialValue: context.loc.maskedPasswordValue,
                obscure: true,
              ),
              const SizedBox(height: 19),
              AuthTextField(
                label: context.loc.confirmPasswordLabel,
                initialValue: context.loc.maskedPasswordValue,
                obscure: true,
              ),
              const SizedBox(height: 33),
              AuthPrimaryButton(
                label: context.loc.loginNow,
                onPressed: () => MobileVerificationPage.go(context),
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
