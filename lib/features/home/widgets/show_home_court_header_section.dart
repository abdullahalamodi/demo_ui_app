import '../../../common_libs.dart';

class ShowHomeCourtHeaderSection extends StatelessWidget {
  const ShowHomeCourtHeaderSection({
    required this.venue,
    required this.isFavorite,
    required this.onBackPressed,
    required this.onFavoritePressed,
    required this.onSharePressed,
    super.key,
  });

  final HomeCourtVenue venue;
  final bool isFavorite;
  final VoidCallback onBackPressed;
  final VoidCallback onFavoritePressed;
  final VoidCallback onSharePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _HeaderCircleButton(
          iconAsset: FixedAssets.chevronLeft,
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
          onPressed: onBackPressed,
        ),
        const SizedBox(width: 18),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                venue.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.titleLarge?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                venue.clubSubtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        _HeaderCircleButton(
          iconAsset: FixedAssets.heart,
          tooltip: context.loc.homeSavedAction,
          color: isFavorite
              ? context.colorScheme.primary
              : context.colorScheme.onSurface,
          onPressed: onFavoritePressed,
        ),
        const SizedBox(width: 10),
        _HeaderCircleButton(
          iconAsset: FixedAssets.share,
          tooltip: context.loc.homeShareAction,
          onPressed: onSharePressed,
        ),
      ],
    );
  }
}

class _HeaderCircleButton extends StatelessWidget {
  const _HeaderCircleButton({
    required this.iconAsset,
    required this.tooltip,
    required this.onPressed,
    this.color,
  });

  final String iconAsset;
  final String tooltip;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: context.colorScheme.surface,
        shape: CircleBorder(
          side: BorderSide(color: Color(0xFFD9D6D0)),
        ),
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: SizedBox.square(
            dimension: 53,
            child: Center(
              child: AppSvgIcon(
                iconAsset,
                size: 17,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
