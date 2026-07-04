import '../../../common_libs.dart';

class ShowHomeCourtContent extends StatelessWidget {
  const ShowHomeCourtContent({
    required this.venue,
    required this.selectedTab,
    required this.selectedReservationDateId,
    required this.selectedCoachDateId,
    required this.selectedTimeslotId,
    required this.selectedDurationId,
    required this.selectedCourtId,
    required this.isFavorite,
    required this.onBackPressed,
    required this.onFavoritePressed,
    required this.onSharePressed,
    required this.onTabSelected,
    required this.onReservationDateSelected,
    required this.onCoachDateSelected,
    required this.onTimeslotSelected,
    required this.onDurationSelected,
    required this.onCourtSelected,
    required this.onCancelPressed,
    required this.onBookPressed,
    required this.onCoachBookPressed,
    required this.onCoachShowProfilePressed,
    required this.onSubscriptionPressed,
    super.key,
  });

  final HomeCourtVenue venue;
  final HomeCourtDetailTab selectedTab;
  final String selectedReservationDateId;
  final String selectedCoachDateId;
  final String selectedTimeslotId;
  final String selectedDurationId;
  final String selectedCourtId;
  final bool isFavorite;
  final VoidCallback onBackPressed;
  final VoidCallback onFavoritePressed;
  final VoidCallback onSharePressed;
  final ValueChanged<HomeCourtDetailTab> onTabSelected;
  final ValueChanged<HomeReservationDate> onReservationDateSelected;
  final ValueChanged<HomeCoachDate> onCoachDateSelected;
  final ValueChanged<HomeTimeSlot> onTimeslotSelected;
  final ValueChanged<HomeBookingDuration> onDurationSelected;
  final ValueChanged<HomeBookingCourt> onCourtSelected;
  final VoidCallback onCancelPressed;
  final VoidCallback onBookPressed;
  final ValueChanged<HomeCoachProfile> onCoachBookPressed;
  final ValueChanged<HomeCoachProfile> onCoachShowProfilePressed;
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
                    padding: EdgeInsetsDirectional.fromSTEB(
                      13,
                      0,
                      13,
                      26,
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
                        const SizedBox(height: 12),
                        ShowHomeCourtTabsSection(
                          selectedTab: selectedTab,
                          onSelected: onTabSelected,
                        ),
                        const SizedBox(height: 12),
                        _SelectedHomeCourtTabContent(
                          selectedTab: selectedTab,
                          venue: venue,
                          selectedReservationDateId: selectedReservationDateId,
                          selectedCoachDateId: selectedCoachDateId,
                          selectedTimeslotId: selectedTimeslotId,
                          selectedDurationId: selectedDurationId,
                          selectedCourtId: selectedCourtId,
                          onReservationDateSelected: onReservationDateSelected,
                          onCoachDateSelected: onCoachDateSelected,
                          onTimeslotSelected: onTimeslotSelected,
                          onDurationSelected: onDurationSelected,
                          onCourtSelected: onCourtSelected,
                          onCoachBookPressed: onCoachBookPressed,
                          onCoachShowProfilePressed: onCoachShowProfilePressed,
                        ),
                        _HomeCourtActionButtons(
                          venue: venue,
                          onCancelPressed: onCancelPressed,
                          onBookPressed: onBookPressed,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
        PositionedDirectional(
          start: 0,
          end: 0,
          bottom: 0,
          child: SizedBox(
            height: 100,
            child: _SubscriptionBar(onPressed: onSubscriptionPressed),
          ),
        ),
        const _RoundedActionCap(),
      ],
    );
  }
}

class _SelectedHomeCourtTabContent extends StatelessWidget {
  const _SelectedHomeCourtTabContent({
    required this.selectedTab,
    required this.venue,
    required this.selectedReservationDateId,
    required this.selectedCoachDateId,
    required this.selectedTimeslotId,
    required this.selectedDurationId,
    required this.selectedCourtId,
    required this.onReservationDateSelected,
    required this.onCoachDateSelected,
    required this.onTimeslotSelected,
    required this.onDurationSelected,
    required this.onCourtSelected,
    required this.onCoachBookPressed,
    required this.onCoachShowProfilePressed,
  });

  final HomeCourtDetailTab selectedTab;
  final HomeCourtVenue venue;
  final String selectedReservationDateId;
  final String selectedCoachDateId;
  final String selectedTimeslotId;
  final String selectedDurationId;
  final String selectedCourtId;
  final ValueChanged<HomeReservationDate> onReservationDateSelected;
  final ValueChanged<HomeCoachDate> onCoachDateSelected;
  final ValueChanged<HomeTimeSlot> onTimeslotSelected;
  final ValueChanged<HomeBookingDuration> onDurationSelected;
  final ValueChanged<HomeBookingCourt> onCourtSelected;
  final ValueChanged<HomeCoachProfile> onCoachBookPressed;
  final ValueChanged<HomeCoachProfile> onCoachShowProfilePressed;

  @override
  Widget build(BuildContext context) {
    return switch (selectedTab) {
      HomeCourtDetailTab.home => HomeCourtHomeTab(venue: venue),
      HomeCourtDetailTab.booking => HomeCourtBookingTab(
        venue: venue,
        package: HomeBookingPackage.demo,
        dates: HomeReservationDate.demoItems,
        durations: HomeBookingDuration.demoItems,
        courts: HomeBookingCourt.demoItems,
        selectedDateId: selectedReservationDateId,
        selectedTimeslotId: selectedTimeslotId,
        selectedDurationId: selectedDurationId,
        selectedCourtId: selectedCourtId,
        onDateSelected: onReservationDateSelected,
        onTimeslotSelected: onTimeslotSelected,
        onDurationSelected: onDurationSelected,
        onCourtSelected: onCourtSelected,
        onUsePackagePressed: () {},
      ),
      HomeCourtDetailTab.coaches => HomeCourtCoachesTab(
        dates: HomeCoachDate.demoItems,
        coaches: HomeCoachProfile.demoItems,
        selectedDateId: selectedCoachDateId,
        onDateSelected: onCoachDateSelected,
        onBookPressed: onCoachBookPressed,
        onShowProfilePressed: onCoachShowProfilePressed,
      ),
      HomeCourtDetailTab.openMatch ||
      HomeCourtDetailTab.competitions ||
      HomeCourtDetailTab.community => const SizedBox.shrink(),
    };
  }
}

class _RoundedActionCap extends StatelessWidget {
  const _RoundedActionCap();

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      start: 0,
      end: 0,
      bottom: 74,
      child: SizedBox(
        height: 28,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(28),
            ),
          ),
        ),
      ),
    );
  }
}

class _HomeCourtActionButtons extends StatelessWidget {
  const _HomeCourtActionButtons({
    required this.venue,
    required this.onCancelPressed,
    required this.onBookPressed,
  });

  final HomeCourtVenue venue;
  final VoidCallback onCancelPressed;
  final VoidCallback onBookPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
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
      fontWeight: FontWeight.w600,
      color: foregroundColor,
    );

    return SizedBox(
      height: 47,
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppSvgIcon(
                        FixedAssets.riyalSymbol,
                        width: 10,
                        height: 11,
                        color: foregroundColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        price!,
                        maxLines: 1,
                        style: textStyle,
                      ),
                    ],
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
        child: Align(
          alignment: AlignmentDirectional.center,
          child: Text(
            context.loc.homeCourtGetSubscriptionPack,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.titleLarge?.copyWith(
              fontSize: 16,
              color: context.colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
