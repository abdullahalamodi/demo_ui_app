import '../../../common_libs.dart';

class ShowHomeCourtContent extends StatelessWidget {
  const ShowHomeCourtContent({
    required this.venue,
    required this.selectedTab,
    required this.isFavorite,
    required this.onBackPressed,
    required this.onFavoritePressed,
    required this.onSharePressed,
    required this.onTabSelected,
    required this.onCancelPressed,
    required this.onBookPressed,
    required this.onSubscriptionPressed,
    super.key,
  });

  final HomeCourtVenue venue;
  final HomeCourtDetailTab selectedTab;
  final bool isFavorite;
  final VoidCallback onBackPressed;
  final VoidCallback onFavoritePressed;
  final VoidCallback onSharePressed;
  final ValueChanged<HomeCourtDetailTab> onTabSelected;
  final VoidCallback onCancelPressed;
  final VoidCallback onBookPressed;
  final VoidCallback onSubscriptionPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Column(
            children: [
              Expanded(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(28),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                      13,
                      20,
                      13,
                      50,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShowHomeCourtHeaderSection(
                          venue: venue,
                          isFavorite: isFavorite,
                          onBackPressed: onBackPressed,
                          onFavoritePressed: onFavoritePressed,
                          onSharePressed: onSharePressed,
                        ),
                        const SizedBox(height: 30),
                        ShowHomeCourtTabsSection(
                          selectedTab: selectedTab,
                          onSelected: onTabSelected,
                        ),
                        const SizedBox(height: 22),
                        if (selectedTab == HomeCourtDetailTab.home)
                          HomeCourtHomeTab(venue: venue),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 122,
                child: _SubscriptionBar(onPressed: onSubscriptionPressed),
              ),
            ],
          ),
        ),
        PositionedDirectional(
          start: 0,
          end: 0,
          bottom: 72,
          child: _BottomActionPanel(
            venue: venue,
            onCancelPressed: onCancelPressed,
            onBookPressed: onBookPressed,
          ),
        ),
      ],
    );
  }
}

class _BottomActionPanel extends StatelessWidget {
  const _BottomActionPanel({
    required this.venue,
    required this.onCancelPressed,
    required this.onBookPressed,
  });

  final HomeCourtVenue venue;
  final VoidCallback onCancelPressed;
  final VoidCallback onBookPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(28),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(13, 24, 13, 30),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: _ActionButton(
                label: context.loc.homeCancel,
                foregroundColor: context.colorScheme.onSurface,
                backgroundColor: context.colorScheme.surface,
                borderColor: context.colorScheme.outlineVariant,
                onPressed: onCancelPressed,
              ),
            ),
            const SizedBox(width: 18),
            Expanded(
              flex: 2,
              child: _ActionButton(
                label: context.loc.homeCourtBook,
                price: venue.bookingPriceText,
                foregroundColor: context.customColors.onSurfaceInverse,
                backgroundColor: context.customColors.surfaceInverse,
                onPressed: onBookPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.onPressed,
    this.borderColor,
    this.price,
  });

  final String label;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color? borderColor;
  final String? price;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textTheme.titleMedium?.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: foregroundColor,
    );

    return SizedBox(
      height: 48,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          side: BorderSide(color: borderColor ?? backgroundColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kRadiusM),
          ),
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 22),
        ),
        child: price == null
            ? Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyle,
              )
            : Row(
                children: [
                  Expanded(
                    child: Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textStyle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'SAR $price',
                    maxLines: 1,
                    style: textStyle,
                  ),
                ],
              ),
      ),
    );
  }
}

class _SubscriptionBar extends StatelessWidget {
  const _SubscriptionBar({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.primary,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsetsDirectional.only(top: 72),
          child: Align(
            alignment: AlignmentDirectional.topCenter,
            child: Text(
              context.loc.homeCourtGetSubscriptionPack,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.titleLarge?.copyWith(
                fontSize: 16,
                color: context.colorScheme.onPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
