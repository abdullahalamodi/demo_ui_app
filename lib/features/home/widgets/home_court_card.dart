import '../../../common_libs.dart';

class HomeCourtCard extends StatelessWidget {
  const HomeCourtCard({
    required this.venue,
    required this.isFavorite,
    required this.selectedTimeslotId,
    required this.onFavoritePressed,
    required this.onSharePressed,
    required this.onTimeslotSelected,
    super.key,
  });

  final HomeCourtVenue venue;
  final bool isFavorite;
  final String? selectedTimeslotId;
  final VoidCallback onFavoritePressed;
  final VoidCallback onSharePressed;
  final ValueChanged<HomeTimeSlot> onTimeslotSelected;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kRadiusL),
        side: BorderSide(color: context.colorScheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(13, 14, 13, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(kRadiusS),
                  child: Image.asset(
                    venue.imageAsset,
                    width: 77,
                    height: 83,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              venue.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.textTheme.titleLarge?.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          _CardIconButton(
                            icon: isFavorite
                                ? FontAwesomeIcons.solidHeart
                                : FontAwesomeIcons.heart,
                            tooltip: context.loc.homeSavedAction,
                            onPressed: onFavoritePressed,
                          ),
                          const SizedBox(width: 8),
                          _CardIconButton(
                            icon: FontAwesomeIcons.shareNodes,
                            tooltip: context.loc.homeShareAction,
                            onPressed: onSharePressed,
                          ),
                        ],
                      ),
                      const SizedBox(height: 7),
                      _LocationRow(venue: venue),
                      const SizedBox(height: 13),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _MetricChip(
                              icon: FontAwesomeIcons.circleDollarToSlot,
                              label: venue.priceText,
                            ),
                            const SizedBox(width: 8),
                            _MetricChip(
                              icon: FontAwesomeIcons.star,
                              label: venue.ratingText,
                            ),
                            const SizedBox(width: 8),
                            _MetricChip(
                              icon: FontAwesomeIcons.volleyball,
                              label: context.loc.homeIndoor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              context.loc.homeAvailableTimeslots,
              style: context.textTheme.titleMedium?.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 13),
            SizedBox(
              height: 46,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: venue.timeslots.length,
                separatorBuilder: (context, index) => const SizedBox(width: 17),
                itemBuilder: (context, index) {
                  final timeslot = venue.timeslots[index];
                  return HomeTimeslotChip(
                    timeslot: timeslot,
                    isSelected: selectedTimeslotId == timeslot.id,
                    onSelected: () => onTimeslotSelected(timeslot),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LocationRow extends StatelessWidget {
  const _LocationRow({required this.venue});

  final HomeCourtVenue venue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(
          FontAwesomeIcons.locationDot,
          size: 14,
          color: context.colorScheme.onSurface,
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            venue.location,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        const SizedBox(width: 11),
        SizedBox(
          width: 1,
          height: 10,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: context.colorScheme.outlineVariant,
            ),
          ),
        ),
        const SizedBox(width: 11),
        Text(
          context.loc.homeNearest,
          maxLines: 1,
          style: context.textTheme.bodyMedium?.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '${venue.distanceText} KM',
          maxLines: 1,
          style: context.textTheme.bodyMedium?.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _MetricChip extends StatelessWidget {
  const _MetricChip({
    required this.icon,
    required this.label,
  });

  final FaIconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33,
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: context.customColors.surfaceTinted,
        borderRadius: BorderRadius.circular(kRadiusM),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            icon,
            size: 15,
            color: context.colorScheme.onSurface,
          ),
          const SizedBox(width: 10),
          Text(
            label,
            maxLines: 1,
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 12,
              color: context.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

class _CardIconButton extends StatelessWidget {
  const _CardIconButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final FaIconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkResponse(
        onTap: onPressed,
        radius: 18,
        child: SizedBox(
          width: 20,
          height: 20,
          child: Center(
            child: FaIcon(
              icon,
              size: 17,
              color: context.colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
