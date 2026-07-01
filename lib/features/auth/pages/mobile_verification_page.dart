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
              children: [
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
          topPadding: 52,
          child: Column(
            children: [
              Text(
                '+966 52 8121948',
                style: context.textTheme.titleLarge?.copyWith(
                  color: context.customColors.onSurfaceStrong,
                ),
              ),
              const SizedBox(height: 6),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: context.customColors.onSurfaceMuted,
                  minimumSize: Size.zero,
                  textStyle: context.textTheme.bodySmall,
                ),
                child: const Text('Wrong Number?Change'),
              ),
              const SizedBox(height: 29),
              const OtpCodeInput(),
              const SizedBox(height: 22),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: context.customColors.onSurfaceMuted,
                  textStyle: context.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w400,
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
