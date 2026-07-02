import '../../../common_libs.dart';

class HomeCourtCoachesTab extends StatelessWidget {
  const HomeCourtCoachesTab({
    required this.dates,
    required this.coaches,
    required this.selectedDateId,
    required this.onDateSelected,
    required this.onBookPressed,
    required this.onShowProfilePressed,
    super.key,
  });

  final List<HomeCoachDate> dates;
  final List<HomeCoachProfile> coaches;
  final String selectedDateId;
  final ValueChanged<HomeCoachDate> onDateSelected;
  final ValueChanged<HomeCoachProfile> onBookPressed;
  final ValueChanged<HomeCoachProfile> onShowProfilePressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _CoachSubtabHeader(),
        const SizedBox(height: 44),
        _CoachDateRail(
          dates: dates,
          selectedDateId: selectedDateId,
          onSelected: onDateSelected,
        ),
        const SizedBox(height: 44),
        ListView.separated(
          itemCount: coaches.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(height: 14),
          itemBuilder: (context, index) {
            final coach = coaches[index];
            return _CoachProfileCard(
              coach: coach,
              onBookPressed: () => onBookPressed(coach),
              onShowProfilePressed: () => onShowProfilePressed(coach),
            );
          },
        ),
      ],
    );
  }
}

class _CoachSubtabHeader extends StatelessWidget {
  const _CoachSubtabHeader();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37,
      child: Stack(
        children: [
          PositionedDirectional(
            start: 0,
            end: 0,
            bottom: 0,
            child: Divider(color: context.colorScheme.outlineVariant),
          ),
          Row(
            children: [
              Expanded(
                child: _CoachSubtabLabel(
                  label: context.loc.homeCoachesPackages,
                  isSelected: false,
                ),
              ),
              Expanded(
                child: _CoachSubtabLabel(
                  label: context.loc.homeCoachesProfiles,
                  isSelected: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CoachSubtabLabel extends StatelessWidget {
  const _CoachSubtabLabel({
    required this.label,
    required this.isSelected,
  });

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.bodyMedium?.copyWith(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                color: context.colorScheme.onSurface,
              ),
            ),
          ),
        ),
        Container(
          height: 1,
          color: isSelected
              ? context.colorScheme.onSurface
              : Colors.transparent,
        ),
      ],
    );
  }
}

class _CoachDateRail extends StatelessWidget {
  const _CoachDateRail({
    required this.dates,
    required this.selectedDateId,
    required this.onSelected,
  });

  final List<HomeCoachDate> dates;
  final String selectedDateId;
  final ValueChanged<HomeCoachDate> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 61,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemBuilder: (context, index) {
          final date = dates[index];
          return _CoachDateCard(
            date: date,
            isSelected: selectedDateId == date.id,
            onPressed: () => onSelected(date),
          );
        },
      ),
    );
  }
}

class _CoachDateCard extends StatelessWidget {
  const _CoachDateCard({
    required this.date,
    required this.isSelected,
    required this.onPressed,
  });

  final HomeCoachDate date;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected
          ? context.customColors.selection.withValues(alpha: .28)
          : Colors.transparent,
      borderRadius: BorderRadius.circular(kRadiusS),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(kRadiusS),
        child: SizedBox(
          width: 43,
          height: 61,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                date.day,
                maxLines: 1,
                style: context.textTheme.titleLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: context.colorScheme.onSurface,
                ),
              ),
              Text(
                date.weekday,
                maxLines: 1,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 11,
                  fontWeight: isSelected ? FontWeight.w400 : FontWeight.w300,
                  color: context.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CoachProfileCard extends StatelessWidget {
  const _CoachProfileCard({
    required this.coach,
    required this.onBookPressed,
    required this.onShowProfilePressed,
  });

  final HomeCoachProfile coach;
  final VoidCallback onBookPressed;
  final VoidCallback onShowProfilePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.fromSTEB(18, 14, 18, 14),
      decoration: BoxDecoration(
        color: context.customColors.surfaceTinted,
        borderRadius: BorderRadius.circular(kRadiusM),
        border: Border.all(color: context.colorScheme.outline),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(kRadiusS),
                child: Image.asset(
                  coach.avatarAsset,
                  width: 42,
                  height: 42,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 17),
              Expanded(child: _CoachInfo(coach: coach)),
            ],
          ),
          const SizedBox(height: 16),
          _CoachTimeslotRail(timeslots: coach.timeslots),
          const SizedBox(height: 14),
          Row(
            children: [
              SizedBox(
                width: 94,
                child: _CoachActionButton(
                  label: context.loc.homeCourtBook,
                  foregroundColor: context.colorScheme.onSurface,
                  backgroundColor: context.colorScheme.surface,
                  borderColor: context.colorScheme.outlineVariant,
                  onPressed: onBookPressed,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _CoachActionButton(
                  label: context.loc.homeCoachesShowProfile,
                  foregroundColor: context.colorScheme.onPrimary,
                  backgroundColor: context.colorScheme.primary,
                  onPressed: onShowProfilePressed,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CoachInfo extends StatelessWidget {
  const _CoachInfo({required this.coach});

  final HomeCoachProfile coach;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          coach.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.titleLarge?.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 11),
        Row(
          children: [
            FaIcon(
              FontAwesomeIcons.baseball,
              size: 15,
              color: context.colorScheme.onSurface,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                coach.sport,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: _CoachInfoStyles.label(context),
              ),
            ),
            const SizedBox(width: 20),
            FaIcon(
              FontAwesomeIcons.chartSimple,
              size: 15,
              color: context.colorScheme.onSurface,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                coach.level,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: _CoachInfoStyles.label(context),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

abstract final class _CoachInfoStyles {
  static TextStyle? label(BuildContext context) {
    return context.textTheme.bodyMedium?.copyWith(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: context.colorScheme.onSurface,
    );
  }
}

class _CoachTimeslotRail extends StatelessWidget {
  const _CoachTimeslotRail({required this.timeslots});

  final List<HomeTimeSlot> timeslots;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: timeslots.length,
        separatorBuilder: (context, index) => const SizedBox(width: 7),
        itemBuilder: (context, index) {
          return _CoachTimeslotChip(timeslot: timeslots[index]);
        },
      ),
    );
  }
}

class _CoachTimeslotChip extends StatelessWidget {
  const _CoachTimeslotChip({required this.timeslot});

  final HomeTimeSlot timeslot;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(kRadiusS),
      ),
      child: SizedBox(
        width: 44,
        height: 37,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              timeslot.time,
              maxLines: 1,
              style: context.textTheme.labelLarge?.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: context.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 1),
            Text(
              timeslot.period,
              maxLines: 1,
              style: context.textTheme.bodySmall?.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CoachActionButton extends StatelessWidget {
  const _CoachActionButton({
    required this.label,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.onPressed,
    this.borderColor,
  });

  final String label;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color? borderColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 39,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          side: BorderSide(color: borderColor ?? backgroundColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kRadiusM),
          ),
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
        ),
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.titleMedium?.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: foregroundColor,
          ),
        ),
      ),
    );
  }
}
