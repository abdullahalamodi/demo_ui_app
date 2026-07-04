import '../../../common_libs.dart';

class HomeCourtBookingTab extends StatelessWidget {
  const HomeCourtBookingTab({
    required this.venue,
    required this.package,
    required this.dates,
    required this.durations,
    required this.courts,
    required this.selectedDateId,
    required this.selectedTimeslotId,
    required this.selectedDurationId,
    required this.selectedCourtId,
    required this.onDateSelected,
    required this.onTimeslotSelected,
    required this.onDurationSelected,
    required this.onCourtSelected,
    required this.onUsePackagePressed,
    super.key,
  });

  final HomeCourtVenue venue;
  final HomeBookingPackage package;
  final List<HomeReservationDate> dates;
  final List<HomeBookingDuration> durations;
  final List<HomeBookingCourt> courts;
  final String selectedDateId;
  final String selectedTimeslotId;
  final String selectedDurationId;
  final String selectedCourtId;
  final ValueChanged<HomeReservationDate> onDateSelected;
  final ValueChanged<HomeTimeSlot> onTimeslotSelected;
  final ValueChanged<HomeBookingDuration> onDurationSelected;
  final ValueChanged<HomeBookingCourt> onCourtSelected;
  final VoidCallback onUsePackagePressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.loc.homeBookingActivePackage,
          style: _sectionTitleStyle(context),
        ),
        const SizedBox(height: 20),
        _ActivePackageCard(
          package: package,
          onUsePressed: onUsePackagePressed,
        ),
        const SizedBox(height: 28),
        _SectionHeading(
          title: context.loc.homeBookingReservationDate,
          trailing: _AvailabilityLegend(),
        ),
        const SizedBox(height: 14),
        _DateSelector(
          dates: dates,
          selectedDateId: selectedDateId,
          onSelected: onDateSelected,
        ),
        const SizedBox(height: 26),
        Text(
          context.loc.homeBookingTimeslot,
          style: _sectionTitleStyle(context),
        ),
        const SizedBox(height: 14),
        _TimeslotSelector(
          timeslots: venue.timeslots,
          selectedTimeslotId: selectedTimeslotId,
          onSelected: onTimeslotSelected,
        ),
        const SizedBox(height: 26),
        Text(
          context.loc.homeDuration,
          style: _sectionTitleStyle(context),
        ),
        const SizedBox(height: 14),
        _DurationSelector(
          durations: durations,
          selectedDurationId: selectedDurationId,
          onSelected: onDurationSelected,
        ),
        const SizedBox(height: 26),
        _SectionHeading(
          title: context.loc.homeBookingChooseCourt,
          trailing: _CourtTypeLegend(),
        ),
        const SizedBox(height: 14),
        _CourtGrid(
          courts: courts,
          selectedCourtId: selectedCourtId,
          onSelected: onCourtSelected,
        ),
      ],
    );
  }
}

class _ActivePackageCard extends StatelessWidget {
  const _ActivePackageCard({
    required this.package,
    required this.onUsePressed,
  });

  final HomeBookingPackage package;
  final VoidCallback onUsePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.fromSTEB(18, 19, 11, 19),
      decoration: BoxDecoration(
        color: context.customColors.surfaceTinted,
        borderRadius: BorderRadius.circular(kRadiusL),
        border: Border.all(color: context.colorScheme.outline),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      package.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.titleLarge?.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.chartSimple,
                          size: 15,
                          color: context.colorScheme.onSurface,
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            context.loc.homeBookingSessions(
                              package.totalSessions,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              _RemainingSessionsBadge(count: package.remainingSessions),
              const SizedBox(width: 8),
              SizedBox(
                height: 39,
                child: FilledButton(
                  onPressed: onUsePressed,
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(43, 39),
                    padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kRadiusM),
                    ),
                  ),
                  child: Text(
                    context.loc.homeBookingUse,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(kRadiusPill),
            child: LinearProgressIndicator(
              minHeight: 4,
              value: package.progress,
              backgroundColor: context.colorScheme.outline,
              color: context.customColors.packageProgress,
            ),
          ),
        ],
      ),
    );
  }
}

class _RemainingSessionsBadge extends StatelessWidget {
  const _RemainingSessionsBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 39,
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(kRadiusM),
      ),
      alignment: AlignmentDirectional.center,
      child: Text(
        context.loc.homeBookingSessionsLeft(count),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.textTheme.bodyMedium?.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class _SectionHeading extends StatelessWidget {
  const _SectionHeading({
    required this.title,
    required this.trailing,
  });

  final String title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: _sectionTitleStyle(context),
          ),
        ),
        const SizedBox(width: 12),
        Flexible(child: trailing),
      ],
    );
  }
}

class _AvailabilityLegend extends StatelessWidget {
  const _AvailabilityLegend();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _LegendItem(
          color: context.colorScheme.onSurface,
          label: context.loc.homeBookingAvailable,
        ),
        const SizedBox(width: 12),
        _LegendItem(
          color: context.customColors.onSurfaceSubtle,
          label: context.loc.homeBookingBooked,
        ),
      ],
    );
  }
}

class _CourtTypeLegend extends StatelessWidget {
  const _CourtTypeLegend();

  @override
  Widget build(BuildContext context) {
    return Text(
      context.loc.homeBookingCourtTypeLegend,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.end,
      style: context.textTheme.bodyMedium?.copyWith(
        fontSize: 11,
        color: context.colorScheme.onSurface,
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  const _LegendItem({
    required this.color,
    required this.label,
  });

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.circle, size: 5, color: color),
        const SizedBox(width: 6),
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.bodyMedium?.copyWith(
            fontSize: 11,
            color: color,
          ),
        ),
      ],
    );
  }
}

class _DateSelector extends StatelessWidget {
  const _DateSelector({
    required this.dates,
    required this.selectedDateId,
    required this.onSelected,
  });

  final List<HomeReservationDate> dates;
  final String selectedDateId;
  final ValueChanged<HomeReservationDate> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 67,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final date = dates[index];
          return _DateCard(
            date: date,
            isSelected: selectedDateId == date.id,
            onPressed: () => onSelected(date),
          );
        },
      ),
    );
  }
}

class _DateCard extends StatelessWidget {
  const _DateCard({
    required this.date,
    required this.isSelected,
    required this.onPressed,
  });

  final HomeReservationDate date;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final foregroundColor = date.isBooked
        ? context.customColors.onSurfaceSubtle
        : context.colorScheme.onSurface;

    return Material(
      color: isSelected
          ? context.customColors.selection.withValues(alpha: .28)
          : context.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kRadiusS),
        side: BorderSide(
          color: isSelected
              ? Colors.transparent
              : context.colorScheme.outlineVariant,
        ),
      ),
      child: InkWell(
        onTap: date.isBooked ? null : onPressed,
        borderRadius: BorderRadius.circular(kRadiusS),
        child: SizedBox(
          width: 55,
          height: 67,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                date.day,
                maxLines: 1,
                style: context.textTheme.titleLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: foregroundColor,
                ),
              ),
              Text(
                date.weekday,
                maxLines: 1,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: foregroundColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimeslotSelector extends StatelessWidget {
  const _TimeslotSelector({
    required this.timeslots,
    required this.selectedTimeslotId,
    required this.onSelected,
  });

  final List<HomeTimeSlot> timeslots;
  final String selectedTimeslotId;
  final ValueChanged<HomeTimeSlot> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 67,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: timeslots.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final timeslot = timeslots[index];
          return _BookingTimeslotCard(
            timeslot: timeslot,
            isSelected: selectedTimeslotId == timeslot.id,
            onPressed: () => onSelected(timeslot),
          );
        },
      ),
    );
  }
}

class _BookingTimeslotCard extends StatelessWidget {
  const _BookingTimeslotCard({
    required this.timeslot,
    required this.isSelected,
    required this.onPressed,
  });

  final HomeTimeSlot timeslot;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final foregroundColor = timeslot.isEnabled
        ? context.colorScheme.onSurface
        : context.customColors.onSurfaceSubtle;
    final iconColor = timeslot.isMorning
        ? context.customColors.accent
        : const Color(0xFF2C3C68);

    return Material(
      color: isSelected
          ? context.customColors.selection.withValues(alpha: .28)
          : context.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kRadiusS),
        side: BorderSide(
          color: isSelected
              ? Colors.transparent
              : context.colorScheme.outlineVariant,
        ),
      ),
      child: InkWell(
        onTap: timeslot.isEnabled ? onPressed : null,
        borderRadius: BorderRadius.circular(kRadiusS),
        child: SizedBox(
          width: 55,
          height: 67,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                timeslot.isMorning
                    ? FontAwesomeIcons.sun
                    : FontAwesomeIcons.solidMoon,
                size: 14,
                color: timeslot.isEnabled
                    ? iconColor
                    : context.customColors.onSurfaceSubtle,
              ),
              const SizedBox(height: 8),
              Text(
                timeslot.time,
                maxLines: 1,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: foregroundColor,
                ),
              ),
              Text(
                timeslot.period,
                maxLines: 1,
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: foregroundColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DurationSelector extends StatelessWidget {
  const _DurationSelector({
    required this.durations,
    required this.selectedDurationId,
    required this.onSelected,
  });

  final List<HomeBookingDuration> durations;
  final String selectedDurationId;
  final ValueChanged<HomeBookingDuration> onSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var index = 0; index < durations.length; index++) ...[
          Expanded(
            child: _DurationButton(
              duration: durations[index],
              isSelected: selectedDurationId == durations[index].id,
              onPressed: () => onSelected(durations[index]),
            ),
          ),
          if (index != durations.length - 1) const SizedBox(width: 10),
        ],
      ],
    );
  }
}

class _DurationButton extends StatelessWidget {
  const _DurationButton({
    required this.duration,
    required this.isSelected,
    required this.onPressed,
  });

  final HomeBookingDuration duration;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected
          ? context.customColors.selection.withValues(alpha: .28)
          : context.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kRadiusS),
        side: BorderSide(
          color: isSelected
              ? Colors.transparent
              : context.colorScheme.outlineVariant,
        ),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(kRadiusS),
        child: SizedBox(
          height: 44,
          child: Center(
            child: Text(
              context.loc.homeBookingDurationMinutes(duration.minutes),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.bodyMedium?.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CourtGrid extends StatelessWidget {
  const _CourtGrid({
    required this.courts,
    required this.selectedCourtId,
    required this.onSelected,
  });

  final List<HomeBookingCourt> courts;
  final String selectedCourtId;
  final ValueChanged<HomeBookingCourt> onSelected;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 9,
        childAspectRatio: 1.48,
      ),
      itemCount: courts.length,
      itemBuilder: (context, index) {
        final court = courts[index];
        return _CourtCard(
          court: court,
          isSelected: selectedCourtId == court.id,
          onPressed: () => onSelected(court),
        );
      },
    );
  }
}

class _CourtCard extends StatelessWidget {
  const _CourtCard({
    required this.court,
    required this.isSelected,
    required this.onPressed,
  });

  final HomeBookingCourt court;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected
          ? context.customColors.selection.withValues(alpha: .28)
          : context.customColors.surfaceTinted,
      borderRadius: BorderRadius.circular(kRadiusS),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(kRadiusS),
        child: Stack(
          children: [
            PositionedDirectional(
              top: 11,
              start: 15,
              child: AppSvgIcon(
                FixedAssets.padel,
                size: 15,
                color: context.colorScheme.onSurface,
              ),
            ),
            PositionedDirectional(
              top: 11,
              end: 12,
              bottom: 11,
              child: AppSvgIcon(
                FixedAssets.court,
                width: 34,
                color: isSelected
                    ? const Color(0xFFAFB199)
                    : const Color(0xFFC7DAD5),
              ),
            ),
            PositionedDirectional(
              start: 15,
              bottom: 12,
              end: 48,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    court.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleLarge?.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    _courtTypeLabel(context, court.type),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodySmall?.copyWith(
                      fontSize: 7,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              PositionedDirectional(
                top: 11,
                end: 11,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: const Color(0xFF299181),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: context.customColors.surfaceSelected,
                      width: 1,
                    ),
                  ),
                  child: Icon(
                    Icons.check,
                    size: 9,
                    color: context.customColors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _courtTypeLabel(BuildContext context, HomeBookingCourtType type) {
    return switch (type) {
      HomeBookingCourtType.mixed => context.loc.homeBookingCourtMixed,
      HomeBookingCourtType.ladiesOnly => context.loc.homeBookingCourtLadiesOnly,
      HomeBookingCourtType.private => context.loc.homeBookingCourtPrivate,
    };
  }
}

TextStyle? _sectionTitleStyle(BuildContext context) {
  return context.textTheme.titleMedium?.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );
}
