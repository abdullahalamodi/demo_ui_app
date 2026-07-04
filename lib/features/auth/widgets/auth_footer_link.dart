import '../../../common_libs.dart';

class AuthFooterLink extends StatelessWidget {
  const AuthFooterLink({
    required this.text,
    required this.action,
    required this.onTap,
    super.key,
  });

  final String text;
  final String action;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        '$text$action',

        style: context.textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w300,
          fontSize: 13,
        ),
      ),
    );
  }
}
