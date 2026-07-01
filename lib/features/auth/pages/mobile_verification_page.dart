import '../../../common_libs.dart';

class MobileVerificationPage extends StatelessWidget {
  const MobileVerificationPage({super.key});

  static void go(BuildContext context) {
    context.go(AppRoutes.mobileVerification);
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
                SizedBox(height: 200),
                AuthHeader(title: 'Mobile\nVerification'),
              ],
            ),
          ),
        ),
        AuthBottomSheet(
          top: 432,
          horizontalPadding: 34,
          topPadding: 62,
          child: Column(
            children: [
              const Text(
                '+966 52 8121948',
                style: TextStyle(
                  color: Color(0xFF050505),
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0,
                ),
              ),
              const SizedBox(height: 6),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF555555),
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  textStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0,
                  ),
                ),
                child: const Text('Wrong Number?Change'),
              ),
              const SizedBox(height: 29),
              const OtpCodeInput(),
              const SizedBox(height: 22),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF444444),
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0,
                  ),
                ),
                child: const Text("Didn't receive a code? Resend"),
              ),
              const SizedBox(height: 10),
              AuthPrimaryButton(
                label: 'Verify OTP',
                onPressed: () => ProfileDetailsPage.go(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
