import '../../../common_libs.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    required this.title,
    this.subtitle,
    this.trailing,
    super.key,
  });

  final String title;
  final String? subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final colors = context.customColors;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: context.textTheme.displayLarge?.copyWith(
                  color: colors.white,
                  fontWeight: FontWeight.w400,
                  // height: 1,
                ),
              ),
              if (subtitle case final subtitle?) ...[
                const SizedBox(height: 10),
                Text(
                  subtitle,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: Color(0xFFDEF3FC),
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
              ],
            ],
          ),
        ),
        ?trailing,
      ],
    );
  }
}
