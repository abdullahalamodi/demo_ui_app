import '../../../common_libs.dart';

class ShowHomeCourtPage extends StatefulWidget {
  const ShowHomeCourtPage({
    required this.id,
    super.key,
  });

  final String id;

  static void go(BuildContext context, String id) {
    context.pushNamed(
      AppRoutes.showHomeCourtName,
      pathParameters: {'id': id},
    );
  }

  @override
  State<ShowHomeCourtPage> createState() => _ShowHomeCourtPageState();
}

class _ShowHomeCourtPageState extends State<ShowHomeCourtPage> {
  HomeCourtDetailTab _selectedTab = HomeCourtDetailTab.home;
  String _selectedReservationDateId = HomeReservationDate.initialSelectedId;
  String _selectedCoachDateId = HomeCoachDate.initialSelectedId;
  String _selectedTimeslotId = '12-am';
  String _selectedDurationId = HomeBookingDuration.initialSelectedId;
  String _selectedCourtId = HomeBookingCourt.initialSelectedId;
  bool _isFavorite = false;

  void _handleBack() {
    if (context.canPop()) {
      context.pop();
      return;
    }

    HomePage.go(context);
  }

  void _toggleFavorite() {
    setState(() => _isFavorite = !_isFavorite);
  }

  void _selectTab(HomeCourtDetailTab tab) {
    setState(() => _selectedTab = tab);
  }

  void _selectReservationDate(HomeReservationDate date) {
    if (date.isBooked) {
      return;
    }

    setState(() => _selectedReservationDateId = date.id);
  }

  void _selectCoachDate(HomeCoachDate date) {
    setState(() => _selectedCoachDateId = date.id);
  }

  void _selectTimeslot(HomeTimeSlot timeslot) {
    if (!timeslot.isEnabled) {
      return;
    }

    setState(() => _selectedTimeslotId = timeslot.id);
  }

  void _selectDuration(HomeBookingDuration duration) {
    setState(() => _selectedDurationId = duration.id);
  }

  void _selectCourt(HomeBookingCourt court) {
    setState(() => _selectedCourtId = court.id);
  }

  @override
  Widget build(BuildContext context) {
    final venue = HomeCourtVenue.demoById(widget.id);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Align(
          alignment: AlignmentDirectional.topCenter,
          child: ShowHomeCourtContent(
            venue: venue,
            selectedTab: _selectedTab,
            selectedReservationDateId: _selectedReservationDateId,
            selectedCoachDateId: _selectedCoachDateId,
            selectedTimeslotId: _selectedTimeslotId,
            selectedDurationId: _selectedDurationId,
            selectedCourtId: _selectedCourtId,
            isFavorite: _isFavorite,
            onBackPressed: _handleBack,
            onFavoritePressed: _toggleFavorite,
            onSharePressed: () {},
            onTabSelected: _selectTab,
            onReservationDateSelected: _selectReservationDate,
            onCoachDateSelected: _selectCoachDate,
            onTimeslotSelected: _selectTimeslot,
            onDurationSelected: _selectDuration,
            onCourtSelected: _selectCourt,
            onCancelPressed: _handleBack,
            onBookPressed: () {},
            onCoachBookPressed: (_) {},
            onCoachShowProfilePressed: (_) {},
            onSubscriptionPressed: () {},
          ),
        ),
      ),
    );
  }
}
