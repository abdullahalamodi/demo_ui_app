import '../../../common_libs.dart';

enum HomeCourtDetailTab {
  home,
  booking,
  coaches,
  openMatch,
  competitions,
  community
  ;

  String label(BuildContext context) {
    return switch (this) {
      HomeCourtDetailTab.home => context.loc.homeNavHome,
      HomeCourtDetailTab.booking => context.loc.homeCourtTabBooking,
      HomeCourtDetailTab.coaches => context.loc.homeCourtTabCoaches,
      HomeCourtDetailTab.openMatch => context.loc.homeCourtTabOpenMatch,
      HomeCourtDetailTab.competitions => context.loc.homeCourtTabCompetitions,
      HomeCourtDetailTab.community => context.loc.homeCourtTabCommunity,
    };
  }
}

class ShowHomeCourtTabsSection extends StatelessWidget {
  const ShowHomeCourtTabsSection({
    required this.selectedTab,
    required this.onSelected,
    super.key,
  });

  final HomeCourtDetailTab selectedTab;
  final ValueChanged<HomeCourtDetailTab> onSelected;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(kRadiusS),
        border: Border.all(color: context.colorScheme.outlineVariant),
      ),
      child: SizedBox(
        height: 40,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          child: Row(
            children: [
              for (final tab in HomeCourtDetailTab.values) ...[
                _CourtTabChip(
                  label: tab.label(context),
                  isSelected: selectedTab == tab,
                  onPressed: () => onSelected(tab),
                ),
                if (tab != HomeCourtDetailTab.values.last)
                  const SizedBox(width: 18),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _CourtTabChip extends StatelessWidget {
  const _CourtTabChip({
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected
          ? context.customColors.selection
          : context.colorScheme.surface,
      borderRadius: BorderRadius.circular(kRadiusXs),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(kRadiusXs),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 61, minHeight: 30),
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 13),
            child: Center(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: context.colorScheme.onSurface,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
