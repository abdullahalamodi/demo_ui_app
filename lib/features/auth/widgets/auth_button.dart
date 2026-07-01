import '../../../common_libs.dart';

class AuthPrimaryButton extends StatelessWidget {
  const AuthPrimaryButton({
    required this.label,
    required this.onPressed,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: FilledButton(onPressed: onPressed, child: Text(label)),
    );
  }
}

class AuthSecondaryButton extends StatelessWidget {
  const AuthSecondaryButton({
    required this.label,
    required this.onPressed,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.customColors;

    return SizedBox(
      height: 46,
      width: double.infinity,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: colors.surfaceRaised,
          foregroundColor: context.colorScheme.onSurface,
          textStyle: context.textTheme.labelMedium,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Text(label),
      ),
    );
  }
}

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  final String label;
  final FaIconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.customColors;

    return SizedBox(
      height: 52,
      width: double.infinity,
      child: FilledButton.icon(
        onPressed: onPressed,
        icon: FaIcon(icon, size: 18),
        label: Text(label),
        style: FilledButton.styleFrom(
          backgroundColor: colors.surfaceDisabled,
          foregroundColor: context.colorScheme.onSurface,
          textStyle: context.textTheme.titleMedium,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
