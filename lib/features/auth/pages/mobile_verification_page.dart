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
            padding: kScrollablePagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthLogo(),

                const SizedBox(height: 200),
                AuthHeader(title: context.loc.mobileVerificationTitle),
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
                context.loc.verificationPhoneNumber,
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
                child: Text(context.loc.wrongNumberChange),
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
                child: Text(context.loc.didntReceiveCodeResend),
              ),
              const SizedBox(height: 10),
              AuthPrimaryButton(
                label: context.loc.verifyOtp,
                onPressed: () => ProfileDetailsPage.go(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
