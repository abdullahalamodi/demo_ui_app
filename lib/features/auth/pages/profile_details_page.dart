import '../../../common_libs.dart';

class ProfileDetailsPage extends StatelessWidget {
  const ProfileDetailsPage({super.key});

  static void go(BuildContext context) {
    context.go(AppRoutes.profileDetails);
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
              children: [
                const AuthLogo(),
                const SizedBox(height: 100),
                AuthHeader(
                  title: 'Profile\nDetails',
                  trailing: Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: TextButton(
                      onPressed: () => HomePage.go(context),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0,
                        ),
                      ),
                      child: Row(
                        children: [
                          Text('Skip'),
                          const SizedBox(width: 5),
                          FaIcon(FontAwesomeIcons.angleRight, size: 14),
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
          topPadding: 58,
          child: Column(
            children: [
              const AuthTextField(
                label: 'Name',
                initialValue: 'hello@gmail.com',
              ),
              const SizedBox(height: 19),
              const AuthTextField(
                label: 'Gender',
                initialValue: 'hello@gmail.com',
              ),
              const SizedBox(height: 19),
              const AuthTextField(
                label: 'Age',
                initialValue: 'hello@gmail.com',
              ),
              const SizedBox(height: 32),
              AuthPrimaryButton(
                label: 'Login Now',
                onPressed: () => HomePage.go(context),
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
