import '../../../common_libs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static void go(BuildContext context) {
    context.goNamed(AppRoutes.homeName);
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedSportId = HomeSportCategory.demoItems.first.id;
  String? _selectedTimeslotKey;
  HomeBottomNavItem _selectedNavItem = HomeBottomNavItem.home;
  final Set<String> _favoriteVenueIds = {};

  void _selectSport(HomeSportCategory category) {
    setState(() => _selectedSportId = category.id);
  }

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

  void _selectNavItem(HomeBottomNavItem item) {
    setState(() => _selectedNavItem = item);
  }

  Future<void> _showFilterSheet() {
    final pageContext = context;

    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      barrierColor: context.colorScheme.primary.withValues(alpha: .08),
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (sheetContext) => HomeFilterSheet(
        onApplyPressed: () {
          Navigator.of(sheetContext).pop();
          SearchResultPage.push(pageContext);
        },
      ),
    );
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
          child: Stack(
            children: [
              ListView(
                padding: const EdgeInsetsDirectional.fromSTEB(
                  13,
                  0,
                  13,
                  160,
                ),
                children: [
                  HomeHeader(
                    user: HomeUser.demo,
                    onFilterPressed: _showFilterSheet,
                    onNotificationsPressed: () {},
                  ),
                  const SizedBox(height: 28),
                  HomeSportCategoryRail(
                    categories: HomeSportCategory.demoItems,
                    selectedId: _selectedSportId,
                    onSelected: _selectSport,
                  ),
                  const SizedBox(height: 22),
                  HomeCitySelector(onPressed: () {}),
                  const SizedBox(height: 16),
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
                bottom: 92,
                child: Center(
                  child: HomeFilterSortBar(
                    onFilterPressed: _showFilterSheet,
                    onSortPressed: () {},
                  ),
                ),
              ),
              PositionedDirectional(
                start: 0,
                end: 0,
                bottom: 0,
                child: HomeBottomNavBar(
                  selectedItem: _selectedNavItem,
                  onSelected: _selectNavItem,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
