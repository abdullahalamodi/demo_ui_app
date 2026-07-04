import '../../../common_libs.dart';

class HomeCitySelector extends StatelessWidget {
  const HomeCitySelector({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kRadiusL),
        side: BorderSide(color: context.colorScheme.outlineVariant),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(kRadiusL),
        child: SizedBox(
          height: 48,
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 17),
            child: Row(
              children: [
                AppSvgIcon(
                  FixedAssets.location,
                  size: 20,
                  color: context.colorScheme.onSurface,
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Text(
                    context.loc.homeSelectCity,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                RotatedBox(
                  quarterTurns: 3,
                  child: AppSvgIcon(
                    FixedAssets.chevronLeft,
                    size: 11,
                    color: context.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
