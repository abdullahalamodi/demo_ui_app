import '../../../common_libs.dart';

class HomeTimeslotChip extends StatelessWidget {
  const HomeTimeslotChip({
    required this.timeslot,
    required this.isSelected,
    required this.onSelected,
    super.key,
  });

  final HomeTimeSlot timeslot;
  final bool isSelected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    final isEnabled = timeslot.isEnabled;
    final foregroundColor = isSelected
        ? context.colorScheme.onPrimary
        : isEnabled
        ? context.colorScheme.onSurface
        : context.customColors.onSurfaceMuted;
    final backgroundColor = isSelected
        ? context.colorScheme.onSurface
        : context.colorScheme.surface;

    return Material(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Color(0xFFE6E6E6)),
      ),
      child: InkWell(
        onTap: isEnabled ? onSelected : null,
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: 55,
          height: 46,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                timeslot.time,
                maxLines: 1,
                style: context.textTheme.labelLarge?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: foregroundColor,
                ),
              ),
              const SizedBox(height: 1),
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
