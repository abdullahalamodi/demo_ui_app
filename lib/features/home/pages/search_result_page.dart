import '../../../common_libs.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({super.key});

  static void push(BuildContext context) {
    context.pushNamed(AppRoutes.searchResultName);
  }

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  String? _selectedTimeslotKey;
  final Set<String> _favoriteVenueIds = {};

  void _toggleFavorite(HomeCourtVenue venue) {
    setState(() {
      if (_favoriteVenueIds.contains(venue.id)) {
        _favoriteVenueIds.remove(venue.id);
      } else {
        _favoriteVenueIds.add(venue.id);
      }
    });
  }

  void _selectTimeslot(HomeCourtVenue venue, HomeTimeSlot timeslot) {
    setState(() => _selectedTimeslotKey = _timeslotKey(venue, timeslot));
  }

  Future<void> _showFilterSheet() {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      barrierColor: context.colorScheme.primary.withValues(alpha: .08),
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (context) => const HomeFilterSheet(),
    );
  }

  void _handleBack() {
    if (context.canPop()) {
      context.pop();
      return;
    }

    HomePage.go(context);
  }

  String _timeslotKey(HomeCourtVenue venue, HomeTimeSlot timeslot) {
    return '${venue.id}:${timeslot.id}';
  }

  String? _selectedTimeslotIdFor(HomeCourtVenue venue) {
    final key = _selectedTimeslotKey;
    if (key == null || !key.startsWith('${venue.id}:')) {
      return null;
    }
    return key.substring(venue.id.length + 1);
  }

  @override
  Widget build(BuildContext context) {
    final venues = HomeCourtVenue.demoItems;

    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: SafeArea(
        child: Align(
          alignment: AlignmentDirectional.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: Stack(
              children: [
                ListView(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                    14,
                    50,
                    13,
                    150,
                  ),
                  children: [
                    _SearchResultsHeader(
                      courtCount: 500,
                      onBackPressed: _handleBack,
                      onFilterPressed: _showFilterSheet,
                    ),
                    const SizedBox(height: 26),
                    const _AppliedFiltersRow(),
                    const SizedBox(height: 24),
                    for (final venue in venues) ...[
                      HomeCourtCard(
                        venue: venue,
                        isFavorite: _favoriteVenueIds.contains(venue.id),
                        selectedTimeslotId: _selectedTimeslotIdFor(venue),
                        onFavoritePressed: () => _toggleFavorite(venue),
                        onSharePressed: () {},
                        onTimeslotSelected: (timeslot) {
                          _selectTimeslot(venue, timeslot);
                        },
                        onPressed: () => ShowHomeCourtPage.go(
                          context,
                          venue.id,
                        ),
                      ),
                      if (venue != venues.last) const SizedBox(height: 12),
                    ],
                  ],
                ),
                PositionedDirectional(
                  start: 0,
                  end: 0,
                  bottom: 0,
                  child: const HomeBottomGradient(),
                ),
                PositionedDirectional(
                  start: 0,
                  end: 0,
                  bottom: 60,
                  child: Center(
                    child: HomeFilterSortBar(
                      onFilterPressed: _showFilterSheet,
                      onSortPressed: () {},
                    ),
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

class _SearchResultsHeader extends StatelessWidget {
  const _SearchResultsHeader({
    required this.courtCount,
    required this.onBackPressed,
    required this.onFilterPressed,
  });

  final int courtCount;
  final VoidCallback onBackPressed;
  final VoidCallback onFilterPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _SearchHeaderButton(
          iconAsset: FixedAssets.chevronLeft,
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
          onPressed: onBackPressed,
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.loc.homeSearchResults,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.headlineMedium?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                context.loc.homeCourtCount(courtCount),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        _SearchHeaderButton(
          iconAsset: FixedAssets.filterLines,
          tooltip: context.loc.homeFilter,
          onPressed: onFilterPressed,
        ),
      ],
    );
  }
}

class _SearchHeaderButton extends StatelessWidget {
  const _SearchHeaderButton({
    required this.iconAsset,
    required this.tooltip,
    required this.onPressed,
  });

  final String iconAsset;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: context.colorScheme.surface,
        shape: CircleBorder(
          side: BorderSide(color: context.colorScheme.outlineVariant),
        ),
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: SizedBox.square(
            dimension: 56,
            child: Center(
              child: AppSvgIcon(
                iconAsset,
                size: 18,
                color: context.colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AppliedFiltersRow extends StatelessWidget {
  const _AppliedFiltersRow();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _AppliedFilterChip(
            width: 140,
            label: context.loc.homePriceLowToHigh,
          ),
          const SizedBox(width: 16),
          _AppliedFilterChip(
            width: 80,
            label: context.loc.homeDuration90Min,
          ),
        ],
      ),
    );
  }
}

class _AppliedFilterChip extends StatelessWidget {
  const _AppliedFilterChip({
    required this.width,
    required this.label,
  });

  final double width;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 41,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.colorScheme.secondary,
          borderRadius: BorderRadius.circular(kRadiusPill),
        ),
        child: Center(
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 13,
              color: context.colorScheme.onSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
